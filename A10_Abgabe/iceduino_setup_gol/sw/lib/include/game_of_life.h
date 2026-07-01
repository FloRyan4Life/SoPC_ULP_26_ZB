#ifndef GAME_OF_LIFE_H
#define GAME_OF_LIFE_H


// #include "neorv32_iceduino.h"

// Konstanten
#define GRB_ALIVE 255, 0, 0
#define GRB_DEAD 0, 0, 0
#define SET_PIXEL_DELAY_MS 2

// MMCP Slave FSM Zustände
typedef enum {
    STATE_IDLE = 0,
    STATE_RECEIVE_GRID,
    STATE_RECEIVE_EDGE,
    STATE_NEXT_GEN,
} mmcp_slave_state_t;

//extern mmcp_slave_state_t mmcp_slave_state;

// Muster (extern, da Definition in .c)
extern uint8_t GLIDER[8];
extern uint8_t OCTAGON_2[8];


// Prototypen für normale Funktionen
void write_grid_to_matrix(uint8_t *grid, int delay_ms);
void load_pattern_to_grid(uint8_t *grid, uint8_t *pattern);
void reset_grid(uint8_t *grid);
void reset_extended_grid(uint16_t *extended_grid);
void compute_next_generation(uint8_t *grid1, uint8_t *grid2, uint16_t *current_extended_grid, uint8_t *sdu);
void merge_grid_with_edge(uint8_t *grid, uint16_t *extended_grid, uint8_t *edge_sdu);
void set_grid_from_sdu(uint8_t *grid, uint8_t *sdu);
void slave_fsm(uint8_t *grid1, uint8_t *grid2, uint16_t *extended_grid, uint8_t *sdu, uint8_t *rx_buffer, uint8_t *tx_buffer);

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

#endif