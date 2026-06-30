#include "game_of_life.h"

#include "neorv32_iceduino.h"

uint8_t GLIDER[8] = {
    0b00100000,   
    0b00010000,   
    0b01110000,   
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000,
    0b00000000
};

uint8_t OCTAGON_2[8] = {
    0b00011000,
    0b00100100,
    0b01000010,
    0b10000001,
    0b10000001,
    0b01000010,
    0b00100100,
    0b00011000
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
void load_pattern_to_grid(uint8_t *grid, uint8_t *pattern)
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

    // Schreibe die neue Generation in den DP-RAM (LED-Matrix)
    write_grid_to_matrix(next_grid, SET_PIXEL_DELAY_MS);

    // Setze den alten Grid zurück, um ihn für die nächste Berechnung vorzubereiten
    reset_grid(current_grid);

    // Wechsle die Grids für die nächste Generation
    grid_switch = (grid_switch == 0) ? 1 : 0;
}

//Kombiniert das aktuelle Grid mit den Randinformationen aus der SDU und speichert das Ergebnis im erweiterten Grid.
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