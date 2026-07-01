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

typedef enum {
    STATE_SEND_GRID = 0,
    STATE_SEND_EDGE,
    STATE_TRIG_NEXT_GEN,
} mmcp_master_state_t;


//extern mmcp_slave_state_t mmcp_slave_state;

// Muster (extern, da Definition in .c)
extern const uint8_t GLIDER[8];
extern const uint8_t DIAGONALE[8];
extern const uint8_t BLOCK[8];
extern const uint8_t BLINKER[8];
extern const uint8_t BLOCK_CORNER[8];
extern const uint8_t CROSS[8];
extern const uint8_t OCTAGON_2[8];
extern const uint8_t PULSAR_GEN_1[8];
extern const uint8_t PULSAR_EDGES[3][8];


// Prototypen für normale Funktionen
void write_grid_to_matrix(uint8_t *grid, int delay_ms);
void load_pattern_to_grid(uint8_t *grid, const uint8_t *pattern);
void reset_grid(uint8_t *grid);
void reset_extended_grid(uint16_t *extended_grid);
void merge_grid_with_edge(uint8_t *grid, uint16_t *extended_grid, const uint8_t *edge_sdu);
void set_grid_from_sdu(uint8_t *grid, const uint8_t *sdu);
void build_mmcp_frame(uint8_t *buffer, uint8_t apnr, const uint8_t *data);
void mmcp_slave_fsm(uint8_t *grid1, uint8_t *grid2, uint16_t *extended_grid, uint8_t *edge_sdu_cache, uint8_t *rx_buffer, uint8_t *tx_buffer);
void mmcp_master_fsm(uint8_t *rx_buffer, uint8_t *tx_buffer, const uint8_t *start_pattern);




#endif