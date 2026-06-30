#include <stdio.h>   // für printf
#include <unistd.h>  // für usleep
#include <conio.h>   

#include <stdint.h>
#include <stdbool.h>

#define GRB_ALIVE 255, 0, 0
#define GRB_DEAD 0, 0, 0

#define SET_PIXEL_DELAY_MS 2

uint8_t grid1[8] = {0};
uint8_t grid2[8] = {0};

const uint8_t ALL_ALIVE[8] = {
    0b11111111,
    0b11111111,
    0b11111111,
    0b11111111,
    0b11111111,
    0b11111111,
    0b11111111,
    0b11111111
};
/*
const uint8_t DIAGONALE[8] = {
    0b10000000,
    0b01000000,
    0b00100000,
    0b00010000,
    0b00001000,
    0b00000100,
    0b00000010,
    0b00000001
};
*/

const uint8_t BLOCK[8] = {
    0b00000000,
    0b01100000,
    0b01100000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000
};

const uint8_t BLINKER[8] = {
    0b00000000,
    0b00000000,
    0b00000000,
    0b00011100,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000
};

const uint8_t GLIDER[8] = {
    0b00100000,   
    0b00010000,   
    0b01110000,   
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000
};

const uint8_t BLOCK_CORNER[8] = {
    0b11000000,   // Bits 7+6 (oben links)
    0b11000011,   // Bits 7+6
    0b00000011,
    0b00000000,
    0b00110000,
    0b00110000,
    0b11000011,
    0b11000011
};

const uint8_t CROSS[8] = {
    0b01000000,
    0b00100000,
    0b01000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000
};

const uint8_t OCTAGON_2[8] = {
    0b00011000,
    0b00100100,
    0b01000010,
    0b10000001,
    0b10000001,
    0b01000010,
    0b00100100,
    0b00011000
};
// Geburt bei 3 lebenden Nachbarn
// Überleben bei 2 oder 3 lebenden Nachbarn
// Sterben bei weniger als 2 oder mehr als 3 lebenden Nachbarn

// Prototypen - später nach .h verschieben
void write_grid_to_matrix(uint8_t *grid, const int delay_ms);
void write_extended_grid_to_matrix(uint16_t *extended_grid, const int delay_ms);
void load_pattern_to_grid(uint8_t *grid, const uint8_t *pattern);
void reset_grid(uint8_t *grid);
void reset_extended_grid(uint16_t *extended_grid);
void neorv32_cpu_delay_ms(int ms);
int iceduino_button_get(int id);
void merge_grid_with_edge(uint8_t *grid, uint16_t *extended_grid, uint8_t *edge_sdu);

//Funktionsdefinitionen - später nach .c verschieben
void write_grid_to_matrix(uint8_t *grid, const int delay_ms)
{
    (void)delay_ms;  // auf PC nicht benötigt
    
    //printf("\033[2J\033[H");  // Bildschirm löschen
    printf("---------------\n");
    for (int i = 0; i < 8; i++) {
        for (int j = 7; j >= 0; j--) {
            printf((grid[i] >> j) & 1 ? "X" : ".");
        }
        printf("\n");
    }
    printf("\n");
    fflush(stdout);
}

void write_extended_grid_to_matrix(uint16_t *extended_grid, const int delay_ms)
{
    (void)delay_ms;  // auf PC nicht benötigt
    
    // printf("\033[2J\033[H");  // Bildschirm löschen
    printf("---------------\n");

    for (int i = 0; i < 10; i++) {
        for (int j = 15; j >= 0; j--) {
            printf((extended_grid[i] & (0x0001 << j)) ? "X" : ".");
        }
        printf("\n");
    }
    printf("\n");
    fflush(stdout);
}

void load_pattern_to_grid(uint8_t *grid, const uint8_t *pattern)
{
    for(int i=0;i<8;i++){
        grid[i] = pattern[i];
    }
}

// SDU aus MMCP-Protokoll in das Grid laden
// Spiegelung der Bits, erforderlich.
void set_grid_from_sdu(uint8_t *grid, uint8_t *sdu){
    reset_grid(grid);  // Setze das Grid zurück, bevor das Muster geladen wird

    // Iteriere über jede Zeile und Spalte des 8x8 Grids
    for(uint8_t i = 0; i < 8; i++){
        for(uint8_t j = 0; j < 8; j++){
            if(sdu[7 - i] & (0x01 << (j))){ // Überprüfe, ob das Bit in der SDU gesetzt ist
                grid[i] |= (0x01 << (j));  // Setze das entsprechende Bit im Grid
            }
        }
    }
}

void reset_grid(uint8_t *grid)
{
    for(int i=0;i<8;i++){
        grid[i] = 0x00;
    }
}

void reset_extended_grid(uint16_t *extended_grid){
    for(int i=0;i<10;i++){
        extended_grid[i] = 0x0000;
    }
}

// static inline Definitionen direkt im Header
// Zählt die lebenden Nachbarn einer Zelle in der aktuellen Generation
// Randbehandlung nicht nötig, da nur durch das innere Grid iteriert aber im erweiterten Grid nach Nachbarn gesucht wird.
static inline uint8_t count_living_neighbors(const uint16_t *current_extended_grid, uint8_t i, uint8_t j) {

    // Anzahl der Nachbarn
    uint8_t living_neighbors_cnt = 0;

    uint8_t j_shift = 6;  // Kompatibilität der 8x8 Grids mit den 10x10 Grids.
    
    // Dadurch zb j = 1 bis 8, wird zu j = 7 bis 14, was den Indizes des erweiterten Grids entspricht.
    for (uint8_t s = (j - 1 + j_shift); s <= (j + 1 + j_shift); s++) {
        // Zähle die lebenden Nachbarn in der oberen Zeile (i-1)
        living_neighbors_cnt += (current_extended_grid[i - 1] & (0x0001 << s)) ? 1 : 0;
        // Zähle die lebenden Nachbarn in der unteren Zeile (i+1)
        living_neighbors_cnt += (current_extended_grid[i + 1] & (0x0001 << s)) ? 1 : 0;
        
    }

    // Zähle die lebenden Nachbarn in der mittleren Zeile (i), rechts
    living_neighbors_cnt += (current_extended_grid[i] & (0x0001 << (j - 1 + j_shift))) ? 1 : 0;
    // Zähle die lebenden Nachbarn in der mittleren Zeile (i), links
    living_neighbors_cnt += (current_extended_grid[i] & (0x0001 << (j + 1 + j_shift))) ? 1 : 0;

    if (living_neighbors_cnt != 0) {
        printf("Cnt[Zeile:%d][Spalte:%d] = %d\n", i, j, living_neighbors_cnt);
    }

    return living_neighbors_cnt;
}

// Aktualisiert den Zustand einer Zelle in der nächsten Generation basierend auf
// der Anzahl der lebenden Nachbarn
static inline void update_cell_state(const uint8_t *current_grid, uint8_t *next_grid,
                                     const uint8_t living_neighbors_cnt,
                                     uint8_t i, uint8_t j) {

    const uint8_t offset = 1;  // dient der Kompabilität der 8x8 Grids mit den 10x10 Grids.
    // Dadurch zb i = 1 bis 9, wird zu i = 0 bis 8, was den Indizes des 8x8 Grids entspricht. 


    switch (living_neighbors_cnt) {
        case 0:  // Einsamkeitstod bei < 2 lebenden Nachbarn

            next_grid[i - offset] = next_grid[i - offset] & ~(0x0001 << (j - offset));
            break;

        case 1:  // Einsamkeitstod bei < 2 lebenden Nachbarn

            next_grid[i - offset] = next_grid[i - offset] & ~(0x0001 << (j - offset));
            break;

        case 2:  // Überleben bei 2 lebenden Nachbarn

            if ((current_grid[i - offset] & (0x0001 << (j - offset))) ? 1 : 0) {
                next_grid[i - offset] = next_grid[i - offset] | (0x0001 << (j - offset));   // Zelle bleibt am Leben
            } else {
                next_grid[i - offset] = next_grid[i - offset] & ~(0x0001 << (j - offset));  // Zelle bleibt tot
            }
            break;

        case 3:  // Geburt bei 3 lebenden Nachbarn

            next_grid[i - offset] = next_grid[i - offset] | (0x0001 << (j - offset));
            break;

        default:  // Überbevölkerungstod bei > 3 lebenden Nachbarn

            next_grid[i - offset] = next_grid[i - offset] & ~(0x0001 << (j - offset));
            break;
    }
}


// Berechnet die nächste Generation basierend auf den aktuellen Zuständen der Zellen und deren Nachbarn.
void compute_next_generation(uint8_t *grid1, uint8_t *grid2, uint16_t *current_extended_grid, uint8_t *sdu) {

    uint8_t living_neighbors_cnt = 0;
    // static Variable, um den aktuellen aktiven Grid zwischen den Aufrufen zu verfolgen
    static uint8_t grid_switch = 0;

    // Bestimme, welcher Grid aktuell aktiv ist und welcher aktualisiert wird
    uint8_t *current_grid = (grid_switch == 0) ? grid1 : grid2;
    uint8_t *next_grid = (grid_switch == 0) ? grid2 : grid1;


    // Kombinieren des aktuellen inneren Grids mit den Randinformationen aus der SDU.
    merge_grid_with_edge(current_grid, current_extended_grid, sdu);

    printf("Extended Grid:\n");
    printf("-----------------\n");
    write_extended_grid_to_matrix(current_extended_grid, SET_PIXEL_DELAY_MS);

    // Berechne die nächste Generation
    // Iteriere über jede Zelle im 8x8 Grid
    for (int i = 1; i < 9; i++) {
        for (int j = 1; j < 9; j++) {
            // Zähle die lebenden Nachbarn der aktuellen Zelle
            living_neighbors_cnt = count_living_neighbors(current_extended_grid, i, j);
            // Aktualisiere den Zustand der Zelle in der nächsten Generation basierend auf den Regeln des Spiels
            update_cell_state(current_grid, next_grid, living_neighbors_cnt, i, j);
        }
    }

    printf("Next Grid:\n");
    printf("-----------------\n");
    // Schreibe die neue Generation in den DP-RAM (LED-Matrix)
    write_grid_to_matrix(next_grid, SET_PIXEL_DELAY_MS);


    

    // Setze den alten Grid zurück, um ihn für die nächste Berechnung vorzubereiten
    reset_grid(current_grid);

    // Wechsle die Grids für die nächste Generation
    grid_switch = (grid_switch == 0) ? 1 : 0;
}

void neorv32_cpu_delay_ms(int ms) {
    usleep(ms * 1000);  // oder einfach: (void)ms;
}

int iceduino_button_get(int id)
{
    (void)id;
    
    if (_kbhit()) {           // Gibt es eine gedrückte Taste?
        int ch = _getch();    // Taste lesen (ohne Enter, ohne Echo)
        if (ch == ' ') {      // Leertaste?
            return 1;
        }
    }
    return 0;
}


void merge_grid_with_edge(uint8_t *grid, uint16_t *extended_grid, uint8_t *edge_sdu){

    // Setze das erweiterte Grid zurück
    reset_extended_grid(extended_grid);

    // Das erweiterte Grid ist 10x10, wobei die äußeren Ränder für die unsichtbaren Zellen reserviert sind.
    // Die unsichtbaren Zellen werden der SDU entnommen und zeilenweise mit dem einfachen Grid kombiniert.
    // Zuordnung der SDU-Bits nach SoPC Script S. 30 ff.
    
    // Zeile 0 (Erste Zeile)
    // N[0], N[1], N[2], N[3], N[4], N[5], N[6], N[7], N[8], N[9]
    for(int i=0; i<8; i++){
        extended_grid[0] |= ((uint16_t)edge_sdu[7] & (0x0001 << i)) << (((7 - i) * 2) + 1);
    }

    extended_grid[0] |= ((uint16_t)edge_sdu[6] & 0x0001) << 7;
    extended_grid[0] |= ((uint16_t)edge_sdu[6] & (0x0001 << 1)) << 5;
    
    // Zeile 1 bis 8:
    // N(35 - i), grid[i], N(10 + i)
    for (int j = 0; j < 8; j++) {

        // ´Linker Rand: N(35 - j) aus SDU[3] und SDU[4]
        if(j <= 3){
            extended_grid[j + 1] |= ((uint16_t)edge_sdu[3] & (0x0001 << (3 - j))) << (8 + 4 + j);    // N(35 - j)
        } else {
            extended_grid[j + 1] |= ((uint16_t)edge_sdu[4] & (0x0001 << (7 + 4 - j))) << (8 - 4 + j);    
        }

        //Mittelteil: grid[j + 1] schreibt das innere 8x8 Grid in die Mitte des erweiterten Grids
        extended_grid[j + 1] |= ((uint16_t)grid[j]) << 7;     
        
        //Rechter Rand: N(10 + j) aus SDU[5] und SDU[6]
        if(j < 5){  // N(10 + j) aus SDU[6] für j=0 bis 4
            extended_grid[j + 1] |= (((uint16_t)edge_sdu[6] & (0x0001 << (2 + j))) << (4 - j));    // N(10 + j)
        }else if(j == 5){ // N(15) aus SDU[6] für j=5 mit eigener Verzweigung, da hier das Bit nach rechts verschoben werden muss
            extended_grid[j + 1] |= (((uint16_t)edge_sdu[6] & (0x0001 << (2 + j))) >> (j - 4));    // N(10 + j)         
        }else{  // N(10 + j) aus SDU[5] für j=6 bis 7
            extended_grid[j + 1] |= (((uint16_t)edge_sdu[5] & (0x0001 << (j - 6))) << (6 + 6 -j));
        }
        
    }

    //Zeile 9 (letzte Zeile)
    // N(27), N(26), N(25), N(24), N(23), N(22), N(21), N(20), N(19), N(18)
    extended_grid[9] |= (((uint16_t)edge_sdu[4] & 0x000F) << 12) ;  // N(27)-N(24) aus SDU[4]
    extended_grid[9] |= (((uint16_t)edge_sdu[5] & ~(0x0003)) << 4) ;   // N(23)-N(20) aus SDU[5]

}



int main(void) {
    // init grid

    neorv32_cpu_delay_ms(10);

    //load_pattern_to_grid(grid1, GLIDER);

    //write_grid_to_matrix(grid1, SET_PIXEL_DELAY_MS);

    // extended grid for testing
    uint16_t extended_grid[10] = {0};

    uint8_t DIAGONALE[8] = {
    0b10000000,
    0b01000000,
    0b00100000,
    0b00010000,
    0b00001000,
    0b00000100,
    0b00000010,
    0b00000001
};

    
    load_pattern_to_grid(grid1, DIAGONALE);
    //set_grid_from_sdu(grid1, DIAGONALE);

    write_grid_to_matrix(grid1, SET_PIXEL_DELAY_MS);


    uint8_t edge_sdu[8] = {0};
    /*
    edge_sdu[2] = 0b11111111;
    edge_sdu[3] = 0b11111111;
    edge_sdu[4] = 0b11111111;
    edge_sdu[5] = 0b11111111;
    edge_sdu[6] = 0b11101010;
    edge_sdu[7] = 0b11111111;
    */
    while (1) {
        if (iceduino_button_get(2)) {
            // debouncing

            // merge_grid_with_edge(grid1, extended_grid, edge_sdu);
            //write_extended_grid_to_matrix(extended_grid, SET_PIXEL_DELAY_MS);
            
            //write_extended_grid_to_matrix(extended_grid, SET_PIXEL_DELAY_MS);
            
            compute_next_generation(grid1, grid2, extended_grid, edge_sdu);


            //compute_next_generation(grid1, grid2);
        }
    }
}