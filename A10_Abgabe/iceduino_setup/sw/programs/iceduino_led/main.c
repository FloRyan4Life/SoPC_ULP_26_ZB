#include "neorv32_iceduino.h"

#include <stdint.h>
#include <stdbool.h>

#define GRB_ALIVE 255, 0, 0
#define GRB_DEAD 0, 0, 0

uint8_t grid1[8] = {0};
uint8_t grid2[8] = {0};
uint8_t living_neighbors_cnt = 0;

uint8_t grid_switch = 0;

const int OCTAGON_2[8] = {0b00011000, 0b00100100, 0b01000010, 0b10000001, 0b10000001, 0b01000010, 0b00100100, 0b00011000};
// Geburt bei 3 lebenden Nachbarn
// Überleben bei 2 oder 3 lebenden Nachbarn
// Sterben bei weniger als 2 oder mehr als 3 lebenden Nachbarn

int main(void)
{

    // init grid

    neorv32_cpu_delay_ms(10);

    // for (int i = 0; i < 64; i++)
    // {
    //     if (i % 2 == 0)
    //     {
    //         grid1[i / 8] = grid1[i / 8] | (0x01 << (i % 8));
    //     }
    //     else
    //     {
    //         // nothing
    //     }
    // }

    for(int i=0;i<8;i++){
        grid1[i] = OCTAGON_2[i];
    }
    

    for (int i = 0; i < 64; i++)
    {
        if ((grid1[i / 8] & (0x01 << (i % 8))) != 0)
        {
            set_pixel(i, GRB_ALIVE);
            neorv32_cpu_delay_ms(4);
        }
        else
        {
            set_pixel(i, GRB_DEAD);
            neorv32_cpu_delay_ms(4);
        }
    }

    // infinite loop

    while (1)
    {

        if (iceduino_button_get(2))
        {
            // debouncing
            neorv32_cpu_delay_ms(500);

            if (grid_switch == 0)
            {
                // grid1 ist aktuell -> grid2 wird berechnet

                // Äußere Punkte berechnen

                // Innere Punkte berechnen
                for (int i = 1; i < 7; i++)
                {
                    for (int j = 1; j < 7; j++)
                    {

                        for (int s = (j - 1); s < (j + 1); s++)
                        {
                            living_neighbors_cnt += (grid1[i - 1] & (0x01 << s)) ? 1 : 0;
                            living_neighbors_cnt += (grid1[i + 1] & (0x01 << s)) ? 1 : 0;
                        }

                        living_neighbors_cnt += (grid1[i] & (0x01 << (j - 1))) ? 1 : 0;
                        living_neighbors_cnt += (grid1[i] & (0x01 << (j + 1))) ? 1 : 0;

                        // Bit löschen
                        // grid2[i] = grid2[i] & ~(0x01 << j);
                        // Bit erzeugen
                        // grid2[i] = grid2[i] | (0x01 <<j);

                        switch (living_neighbors_cnt)
                        {
                        case 0:
                            grid2[i] = grid2[i] & ~(0x01 << j);
                            break;
                        case 1:
                            grid2[i] = grid2[i] & ~(0x01 << j);
                            break;
                        case 2:
                            if ((grid1[i] & (0x01 << j)) ? 1 : 0)
                            {
                                grid2[i] = grid2[i] | (0x01 << j);
                            }
                            else
                            {
                                grid2[i] = grid2[i] & ~(0x01 << j);
                            }
                            break;
                        case 3:

                            grid2[i] = grid2[i] | (0x01 << j);

                            break;
                        default:
                            grid2[i] = grid2[i] & ~(0x01 << j);
                            break;
                        }
                        living_neighbors_cnt = 0;
                    }
                }

                // set the pixels here
                for (int i = 0; i < 64; i++)
                {

                    if ((grid2[i / 8] & (0x01 << (i % 8))) != 0)
                    {
                        set_pixel(i, GRB_ALIVE);
                        neorv32_cpu_delay_ms(3);
                    }
                    else
                    {
                        set_pixel(i, GRB_DEAD);
                        neorv32_cpu_delay_ms(3);
                    }
                }

                for(int i=0;i<8;i++){
                    grid1[i] = 0x00;
                }

                

                grid_switch = 1;
            }
            else
            {
                // grid2 ist aktuell -> grid1 wird berechnet

                // Äußere Punkte berechnen

                // Innere Punkte berechnen
                for (int i = 1; i < 7; i++)
                {
                    for (int j = 1; j < 7; j++)
                    {

                        for (int s = (j - 1); s < (j + 1); s++)
                        {
                            living_neighbors_cnt += (grid2[i - 1] & (0x01 << s)) ? 1 : 0;
                            living_neighbors_cnt += (grid2[i + 1] & (0x01 << s)) ? 1 : 0;
                        }

                        living_neighbors_cnt += (grid2[i] & (0x01 << (j - 1))) ? 1 : 0;
                        living_neighbors_cnt += (grid2[i] & (0x01 << (j + 1))) ? 1 : 0;

                        // Bit löschen
                        // grid2[i] = grid2[i] & ~(0x01 << j);
                        // Bit erzeugen
                        // grid2[i] = grid2[i] | (0x01 <<j);

                        switch (living_neighbors_cnt)
                        {
                        case 0:
                            grid1[i] = grid1[i] & ~(0x01 << j);
                            break;
                        case 1:
                            grid1[i] = grid1[i] & ~(0x01 << j);
                            break;
                        case 2:
                            if ((grid2[i] & (0x01 << j)) ? 1 : 0)
                            {
                                grid1[i] = grid1[i] | (0x01 << j);
                            }
                            else
                            {
                                grid1[i] = grid1[i] & ~(0x01 << j);
                            }
                            break;
                        case 3:

                            grid1[i] = grid1[i] | (0x01 << j);

                            break;
                        default:
                            grid1[i] = grid1[i] & ~(0x01 << j);
                            break;
                        }
                        living_neighbors_cnt = 0;
                    }
                }

                // set the pixels here
                for (int i = 0; i < 64; i++)
                {

                    if ((grid1[i / 8] & (0x01 << (i % 8))) != 0)
                    {
                        set_pixel(i, GRB_ALIVE);
                        neorv32_cpu_delay_ms(3);
                    }
                    else
                    {
                        set_pixel(i, GRB_DEAD);
                        neorv32_cpu_delay_ms(3);
                    }
                }

                for(int i=0;i<8;i++){
                    grid2[i] = 0x00;
                }

            
                grid_switch = 0;
            }
        }
    }
}