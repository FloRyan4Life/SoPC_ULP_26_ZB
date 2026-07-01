
#include "neorv32_iceduino.h"

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

const uint8_t PULSAR_GEN_1[8] = {
    0b01010101,
    0b10110110,
    0b01010101,
    0b11100011,
    0b00000000,
    0b11100011,
    0b01010101,
    0b10110110
};

const uint8_t PULSAR_EDGES[3][8]= {
    {
    0b00000000,
    0b00000000,
    0b00000000,
    0b00001010,
    0b10100110,
    0b00110001,
    0b10001100,
    0b10101010
    },
    {
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000010,
    0b10000000,
    0b00000000,
    0b00000000,
    0b00101000
    },
    {
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000110,
    0b00110001,
    0b10001100,
    0b00000000
    }
};


//Funktionsdefinitionen
// Schreibt ein 8x8 Grid in den DualPort-RAM.
void write_grid_to_matrix(uint8_t *grid, const int delay_ms)
{   //Fuer jedes Pixel in der 8x8 Matrix
    for (int i = 0; i < 64; i++)
    {   
        if ((grid[i / 8] & (0x01 << (i % 8))) != 0)
        {   //Wenn das Bit gesetzt ist, setze Pixel auf "alive"
            set_pixel(i, GRB_ALIVE);
            neorv32_cpu_delay_ms(delay_ms);
        }
        else
        {   //Wenn das Bit nicht gesetzt ist, setze Pixel auf "dead"
            set_pixel(i, GRB_DEAD);
            neorv32_cpu_delay_ms(delay_ms);
        }
    }
}

// Lädt ein Muster in das Grid.
void load_pattern_to_grid(uint8_t *grid,const uint8_t *pattern)
{
    for(int i=0;i<8;i++){
        grid[i] = pattern[i];
    }
}

// Setzt alle Zellen im Grid auf "dead".
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


// SDU aus MMCP-Protokoll in das Grid laden
// Spiegelung der Bits, erforderlich.
void set_grid_from_sdu(uint8_t *grid, const uint8_t *sdu){
    reset_grid(grid);  // Setze das Grid zurück, bevor das Muster geladen wird

    // Iteriere über jede Zeile und Spalte des 8x8 Grids
    for(uint8_t i = 0; i < 8; i++){
        for(uint8_t j = 0; j < 8; j++){
            if(sdu[7 - i] & (0x01 << (j))){ // Überprüfe, ob das Bit in der SDU gesetzt ist
                grid[i] |= (0x01 << (7 - j));  // Setze das entsprechende Bit im Grid
            }
        }
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

//Kombiniert das aktuelle Grid mit den Randinformationen aus der SDU und speichert das Ergebnis im erweiterten Grid.
void merge_grid_with_edge(uint8_t *grid, uint16_t *extended_grid,const uint8_t *edge_sdu){

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

// Baut ein MMCP-Frame im rx_buffer
// apnr: 1=SetGrid, 2=NextGen, 6=SetEdge
// sdu: Pointer auf 8 Bytes, oder NULL für leere SDU
void build_mmcp_frame(uint8_t *rx_buffer, uint8_t apnr, const uint8_t *sdu) {
    rx_buffer[0] = 0x00;   // SOF
    rx_buffer[1] = 0x00;   // To (Master=1) / (Slave=2)
    rx_buffer[2] = 0x00;   // From -||-
    rx_buffer[3] = 0x00;   // Vers
    rx_buffer[4] = 0x00;   // Hops
    rx_buffer[5] = apnr;   // ApNr
    
    if (sdu != NULL) {
        for (int i = 0; i < 8; i++) {
            rx_buffer[6 + i] = sdu[i];
        }
    } else {
        for (int i = 0; i < 8; i++) {
            rx_buffer[6 + i] = 0x00;
        }
    }
    
    rx_buffer[14] = 0x00;  // Checksumme (hier einfach 0)
    rx_buffer[15] = 0x00;  // EOF
}

void mmcp_slave_fsm(uint8_t *grid1, uint8_t *grid2, uint16_t *extended_grid, uint8_t *edge_sdu_cache, uint8_t *rx_buffer, uint8_t *tx_buffer){

    mmcp_slave_state_t mmcp_slave_state = STATE_IDLE;

    uint8_t living_neighbors_cnt = 0;
    // static Variable, um den aktuellen aktiven Grid zwischen den Aufrufen zu verfolgen
    static uint8_t grid_switch = 0;

    // Bestimme, welcher Grid aktuell aktiv ist und welcher aktualisiert wird
    uint8_t *current_grid = (grid_switch == 0) ? grid1 : grid2;
    uint8_t *next_grid = (grid_switch == 0) ? grid2 : grid1;


    // Zustand wechseln, basierend auf ApNr im rx_buffer[5]
    switch (rx_buffer[5]) {
        case 0x00:
            mmcp_slave_state = STATE_IDLE;
            break;

        case 0x01:
            mmcp_slave_state = STATE_RECEIVE_GRID;
            break;

        case 0x02:
            mmcp_slave_state = STATE_NEXT_GEN;
            break;

        case 0x06:
            mmcp_slave_state = STATE_RECEIVE_EDGE;
            break;

        default:
            mmcp_slave_state = STATE_IDLE;
            break;
    }


    switch (mmcp_slave_state) {
        case STATE_IDLE:
            break;

        case STATE_RECEIVE_GRID:
            set_grid_from_sdu(current_grid, &rx_buffer[6]);  // Setze das aktuelle Grid basierend auf den empfangenen Daten
            break;

        case STATE_RECEIVE_EDGE:
            for (int i = 6; i < 14; i++) {
                edge_sdu_cache[i - 6] = rx_buffer[i];   // Speichere die empfangenen
                                                        // Randinformationen in der SDU
            }
            break;

        case STATE_NEXT_GEN:


            // Kombinieren des aktuellen inneren Grids mit den Randinformationen
            // aus der SDU.
            merge_grid_with_edge(current_grid, extended_grid, edge_sdu_cache);

            // Berechne die nächste Generation
            // Iteriere über jede Zelle des 8x8 Grids im erweiterten 10x10 Grid
            for (int i = 1; i < 9; i++) {
                for (int j = 1; j < 9; j++) {

                    // Zähle die lebenden Nachbarn der aktuellen Zelle
                    living_neighbors_cnt = count_living_neighbors(extended_grid, i, j);
                    // Aktualisiere den Zustand der Zelle in der nächsten
                    // Generation basierend auf den Regeln des Spiels
                    update_cell_state(current_grid, next_grid, living_neighbors_cnt, i, j);
                }
            }

            // Schreibe die neue Generation in den DP-RAM (LED-Matrix)

            write_grid_to_matrix(next_grid, SET_PIXEL_DELAY_MS);

            // Setze den alten Grid zurück, um ihn für die nächste Berechnung
            // vorzubereiten
            reset_grid(current_grid);
            
            grid_switch = (grid_switch == 0) ? 1 : 0;
            break;

        default:
            mmcp_slave_state = STATE_IDLE;
            break;
    }

}

void mmcp_master_fsm(uint8_t *rx_buffer, uint8_t *tx_buffer, const uint8_t *start_pattern) {
    // FSM zur Emulation des MMCP-Masters, der die ApNr und die Daten an den Slave sendet.

    static mmcp_master_state_t mmcp_master_state = STATE_SEND_GRID;
    static uint8_t gen_counter = 0;

    switch(mmcp_master_state) {
        case STATE_SEND_GRID:
            // Implementiere die Logik zum Senden des Grids

            build_mmcp_frame(rx_buffer, 0x01, start_pattern);  // Beispiel-Daten für das Grid


            gen_counter++;

            mmcp_master_state = STATE_SEND_EDGE;  // Wechsel zum nächsten Zustand

            break;

        case STATE_SEND_EDGE:

            // Implementiere die Logik zum Senden der Randinformationen
            build_mmcp_frame(rx_buffer, 0x06, PULSAR_EDGES[gen_counter - 1]);  // Beispiel-Daten für die Randinformationen


            mmcp_master_state = STATE_TRIG_NEXT_GEN;  // Wechsel zum nächsten Zustand
            break;

        case STATE_TRIG_NEXT_GEN:
            // Implementiere die Logik zum Auslösen der nächsten Generation

            build_mmcp_frame(rx_buffer, 0x02, NULL);  // Beispiel-Daten für das Auslösen der nächsten Generation

            if(gen_counter == 3) {
                gen_counter = 1;
            } else {
                gen_counter++;
            }

            mmcp_master_state = STATE_SEND_EDGE;  // Wechsel zurück zum ersten Zustand
            
            break;
            
        default:
            mmcp_master_state = STATE_SEND_GRID;
            break;
    }
}