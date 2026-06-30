#include "game_of_life.h"


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

// Berechnet die nächste Generation basierend auf den aktuellen Zuständen der Zellen und deren Nachbarn.
void compute_next_generation(uint8_t *grid1, uint8_t *grid2) {

    uint8_t living_neighbors_cnt = 0;
    // static Variable, um den aktuellen aktiven Grid zwischen den Aufrufen zu verfolgen
    static uint8_t grid_switch = 0;

    // Bestimme, welcher Grid aktuell aktiv ist und welcher aktualisiert wird
    uint8_t* current_grid = (grid_switch == 0) ? grid1 : grid2;
    uint8_t* next_grid = (grid_switch == 0) ? grid2 : grid1;

    // Berechne die nächste Generation
    // Iteriere über jede Zelle im 8x8 Grid
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            // Zähle die lebenden Nachbarn der aktuellen Zelle
            living_neighbors_cnt = count_living_neighbors(current_grid, i, j);
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