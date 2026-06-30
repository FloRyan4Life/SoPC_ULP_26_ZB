#ifndef GAME_OF_LIFE_H
#define GAME_OF_LIFE_H

#include <stdint.h>
#include <stdbool.h>
#include "neorv32_iceduino.h"

// Konstanten
#define GRB_ALIVE 255, 0, 0
#define GRB_DEAD 0, 0, 0
#define SET_PIXEL_DELAY_MS 3

// Muster (extern, da Definition in .c)
extern const uint8_t GLIDER[8];
extern const uint8_t OCTAGON_2[8];

// Prototypen für normale Funktionen
void write_grid_to_matrix(uint8_t *grid, int delay_ms);
void load_pattern_to_grid(uint8_t *grid, uint8_t *pattern);
void reset_grid(uint8_t *grid);
void compute_next_generation(uint8_t *grid1, uint8_t *grid2);

// static inline Definitionen direkt im Header
// Zählt die lebenden Nachbarn einer Zelle in der aktuellen Generation
// inkl. Randbehandlung (Zellen am Rand haben weniger Nachbarn)
static inline uint8_t count_living_neighbors(const uint8_t *current_grid, uint8_t i, uint8_t j) {

    uint8_t living_neighbors_cnt = 0;

    // Berechne die Grenzen für die Nachbarzellen, um Array-Index-Out-of-Bounds zu vermeiden
    uint8_t top_gap = (i > 0) ? 1 : 0;
    uint8_t bottom_gap = (i < 7) ? 1 : 0;
    uint8_t right_gap = (j > 0) ? 1 : 0;
    uint8_t left_gap = (j < 7) ? 1 : 0;

    // Obere und untere Zeile
    // Wichtig: j - right_gap ist immer >= 0, da right_gap = 1, wenn j > 0
    // Wichtig: j + left_gap ist immer <= 7, da left_gap = 1, wenn j < 7
    for (uint8_t s = (j - right_gap); s <= (j + left_gap); s++) {

        // wenn top_gap = 0, dann ist i - 1 < 0, also keine obere Zeile
        if(top_gap) {
            living_neighbors_cnt += (current_grid[i - 1] & (0x01 << s)) ? 1 : 0;
        }

        // wenn bottom_gap = 0, dann ist i + 1 > 7, also keine untere Zeile
        if(bottom_gap) {
            living_neighbors_cnt += (current_grid[i + 1] & (0x01 << s)) ? 1 : 0;
        }
    }


    if (right_gap) {  // wenn j > 0, dann ist j - 1 >= 0, also rechte Nachbarzelle existiert
        living_neighbors_cnt += (current_grid[i] & (0x01 << (j - 1))) ? 1 : 0;
    }
    
    if (left_gap) {  // wenn j < 7, dann ist j + 1 <= 7, also linke Nachbarzelle existiert
        living_neighbors_cnt += (current_grid[i] & (0x01 << (j + 1))) ? 1 : 0;
    }

    return living_neighbors_cnt;
}

// Aktualisiert den Zustand einer Zelle in der nächsten Generation basierend auf
// der Anzahl der lebenden Nachbarn
static inline void update_cell_state(const uint8_t *current_grid, uint8_t *next_grid,
                                     const uint8_t living_neighbors_cnt,
                                     uint8_t i, uint8_t j) {
    switch (living_neighbors_cnt) {
        case 0:  // Einsamkeitstod bei < 2 lebenden Nachbarn

            next_grid[i] = next_grid[i] & ~(0x01 << j);
            break;

        case 1:  // Einsamkeitstod bei < 2 lebenden Nachbarn

            next_grid[i] = next_grid[i] & ~(0x01 << j);
            break;

        case 2:  // Überleben bei 2 lebenden Nachbarn

            if ((current_grid[i] & (0x01 << j)) ? 1 : 0) {
                next_grid[i] = next_grid[i] | (0x01 << j);   // Zelle bleibt am Leben
            } else {
                next_grid[i] = next_grid[i] & ~(0x01 << j);  // Zelle bleibt tot
            }
            break;

        case 3:  // Geburt bei 3 lebenden Nachbarn

            next_grid[i] = next_grid[i] | (0x01 << j);
            break;

        default:  // Überbevölkerungstod bei > 3 lebenden Nachbarn

            next_grid[i] = next_grid[i] & ~(0x01 << j);
            break;
    }
}

#endif