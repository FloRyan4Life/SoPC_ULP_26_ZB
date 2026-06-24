#include <stdint.h>

uint8_t grid1[8][8] = {0};
uint8_t grid2[8][8] = {0};
uint8_t living_neighbors_cnt = 0;

uint8_t grid_switch = 0;


# Geburt bei 3 lebenden Nachbarn
# Überleben bei 2 oder 3 lebenden Nachbarn
# Sterben bei weniger als 2 oder mehr als 3 lebenden Nachbarn

int main(void){

    while(!buttonpressed){

    }

    if grid_switch == 0{
        #grid1 ist aktuell -> grid2 wird berechnet

        for(int i = 0;i<8;i++){
            for(int j = 0;j<8;j++){
                # Eine Grid Position hier ausgewählt
                for(int x = 0;x<9;x++){
                    if(grid1[i][j] == 1){
                        living_neighbors_cnt++;
                    }
                }
            }
        }

        grid_switch = 1;
    }
    else{
        #grid2 ist aktuell -> grid1 wird berechnet

        grid_switch = 0;
    }




}