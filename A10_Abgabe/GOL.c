#include
#include <stdint.h>

uint8_t grid1[8] = {0};
uint8_t grid2[8] = {0};
uint8_t living_neighbors_cnt = 0;

uint8_t grid_switch = 0;

// Geburt bei 3 lebenden Nachbarn
// Überleben bei 2 oder 3 lebenden Nachbarn
// Sterben bei weniger als 2 oder mehr als 3 lebenden Nachbarn

int main(void)
{

    while (!buttonpressed)
    {
    }

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
                switch (living_neighbors_cnt)
                {
                    case 0:
                    break;
                    case 1:
                    break;
                    case 2:
                    break;
                    case 3:
                    break;
                    default:
                    break;

                }
                living_neighbors_cnt = 0;
            }
        }

        grid_switch = 1;
    }
    else
    {
        // grid2 ist aktuell -> grid1 wird berechnet

        grid_switch = 0;
    }
}