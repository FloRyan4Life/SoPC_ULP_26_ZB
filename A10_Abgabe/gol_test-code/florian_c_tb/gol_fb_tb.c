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


const uint8_t BLOCK[8] = {
    0b00000000,
    0b00000000,
    0b00000000,
    0b00001100,
    0b00001100,
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

const uint8_t OCTAGON_2[8] = {0b00011000, 0b00100100, 0b01000010, 0b10000001, 0b10000001, 0b01000010, 0b00100100, 0b00011000};
// Geburt bei 3 lebenden Nachbarn
// Überleben bei 2 oder 3 lebenden Nachbarn
// Sterben bei weniger als 2 oder mehr als 3 lebenden Nachbarn

// Prototypen - später nach .h verschieben
void write_grid_to_matrix(uint8_t *grid, const int delay_ms);
void load_pattern_to_grid(uint8_t *grid, const uint8_t *pattern);
void reset_grid(uint8_t *grid);
void neorv32_cpu_delay_ms(int ms);
int iceduino_button_get(int id);

//Funktionsdefinitionen - später nach .c verschieben
void write_grid_to_matrix(uint8_t *grid, const int delay_ms)
{
    (void)delay_ms;  // auf PC nicht benötigt
    
    printf("\033[2J\033[H");  // Bildschirm löschen
    
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            printf((grid[i] >> j) & 1 ? "X" : ".");
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

void reset_grid(uint8_t *grid)
{
    for(int i=0;i<8;i++){
        grid[i] = 0x00;
    }
}

static inline uint8_t count_living_neighbors(uint8_t* current_grid, uint8_t i, uint8_t j) {
    uint8_t living_neighbors_cnt = 0;

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

static inline void update_cell_state(uint8_t* current_grid, uint8_t* next_grid,
                      const uint8_t living_neighbors_cnt, uint8_t i, uint8_t j) {
    switch (living_neighbors_cnt) {
        case 0:
            next_grid[i] = next_grid[i] & ~(0x01 << j);
            break;
        case 1:
            next_grid[i] = next_grid[i] & ~(0x01 << j);
            break;
        case 2:
            if ((current_grid[i] & (0x01 << j)) ? 1 : 0) {
                next_grid[i] = next_grid[i] | (0x01 << j);
            } else {
                next_grid[i] = next_grid[i] & ~(0x01 << j);
            }
            break;
        case 3:

            next_grid[i] = next_grid[i] | (0x01 << j);

            break;
        default:
            next_grid[i] = next_grid[i] & ~(0x01 << j);
            break;
    }
}

void compute_next_generation(uint8_t* grid1, uint8_t* grid2) {

    uint8_t living_neighbors_cnt = 0;
    // static variable to keep track of which grid is currently active
    static uint8_t grid_switch = 0;

    // Determine which grid is currently active and which one will be updated
    uint8_t* current_grid = (grid_switch == 0) ? grid1 : grid2;
    uint8_t* next_grid = (grid_switch == 0) ? grid2 : grid1;

    // Compute the next generation
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            living_neighbors_cnt = count_living_neighbors(current_grid, i, j);
            update_cell_state(current_grid, next_grid, living_neighbors_cnt, i, j);
        }
    }

    // write the new generation to the LED matrix
    write_grid_to_matrix(next_grid, SET_PIXEL_DELAY_MS);

    //reset the old grid
    reset_grid(current_grid);

    // switch the grids for the next generation
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



int main(void) {
    // init grid

    neorv32_cpu_delay_ms(10);

    load_pattern_to_grid(grid1, GLIDER);

    write_grid_to_matrix(grid1, SET_PIXEL_DELAY_MS);

    // infinite loop

    while (1) {
        if (iceduino_button_get(2)) {
            // debouncing
  

            compute_next_generation(grid1, grid2);
        }
    }
}