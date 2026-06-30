#include "neorv32_iceduino.h"


static uint8_t grid_1[8] = {0};
static uint8_t grid_2[8] = {0};




int main(void) {
    
    // Initialisiere die LED-Matrix und andere Hardwarekomponenten
    neorv32_cpu_delay_ms(10);
    
    // Lade das GLIDER-Muster in das erste Grid
    load_pattern_to_grid(grid_1, GLIDER);

    // Schreibe das initiale Muster in die LED-Matrix
    write_grid_to_matrix(grid_1, SET_PIXEL_DELAY_MS);

    // Unendliche Schleife, um auf Benutzereingaben zu warten und die nächste Generation zu berechnen
    while (1) {
        if (iceduino_button_get(2)) {
            
            // debouncing
            neorv32_cpu_delay_ms(500);
  
            // Berechne die nächste Generation, inkl. Schreiben in den DP-RAM und Reset des alten Grids
            compute_next_generation(grid_1, grid_2);
        }
    }
}