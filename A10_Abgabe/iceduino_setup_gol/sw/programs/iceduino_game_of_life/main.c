#include "neorv32_iceduino.h"


static uint8_t grid_1[8] = {0};
static uint8_t grid_2[8] = {0};

static uint16_t extended_grid[10] = {0};  // 10x10 Grid, um unsichtbare Zellen zu berücksichtigen

static uint8_t rx_buffer[16] = {0};  // Buffer für empfangene Daten per MMCP
static uint8_t tx_buffer[16] = {0};  // Buffer für zu sendende Daten per MMCP


int main(void) {
    
    // Initialisiere die LED-Matrix und andere Hardwarekomponenten
    neorv32_cpu_delay_ms(10);
    
    // Lade das GLIDER-Muster in das erste Grid
    load_pattern_to_grid(grid_1, GLIDER);

    uint8_t edge_sdu_cache[8] = {0};


    // Schreibe das initiale Muster in die LED-Matrix
    write_grid_to_matrix(grid_1, SET_PIXEL_DELAY_MS);

    while (1) {
        if (iceduino_button_get(2)) {
            // debouncing

            mmcp_master_fsm(rx_buffer, tx_buffer, PULSAR_GEN_1);

            neorv32_cpu_delay_ms(10);  // Simuliere eine kurze Verzögerung, um
                                       // die Verarbeitung zu ermöglichen

            mmcp_slave_fsm(grid_1, grid_2, extended_grid, edge_sdu_cache,
                           rx_buffer, tx_buffer);

            neorv32_cpu_delay_ms(10);  // Simuliere eine kurze Verzögerung, um
                                       // die Verarbeitung zu ermöglichen
        }
    }
}