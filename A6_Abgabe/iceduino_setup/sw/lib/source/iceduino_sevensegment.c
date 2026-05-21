#include "neorv32_iceduino.h"

// void iceduino_sevensegment_set(int num)
// {
//     int num_bitpattern = 0x0;
    
//     if (!(num >= 0 && num <= 9)){
//         return;
//     }

//     switch (num){
//         case 0:
//         num_bitpattern = 0b11111100;
//         case 1:
//         num_bitpattern = 0b01100000;
//         case 2:
//         num_bitpattern = 0b11011010;
//         case 3:
//         num_bitpattern = 0b11110010;
//         case 4:
//         num_bitpattern = 0b01100110;
//         case 5:
//         num_bitpattern = 0b10110110;
//         case 6:
//         num_bitpattern = 0b10111110;
//         case 7:
//         num_bitpattern = 0b11100000; 
//         case 8:
//         num_bitpattern = 0b11111110;
//         case 9:
//         num_bitpattern = 0b11110110;
//     }


//     ICEDUINO_SEVENSEGMENT = num_bitpattern;
// }
void iceduino_sevensegment_clr(){
    ICEDUINO_SEVENSEGMENT = 0x00;

}
// void iceduino_sevensegment_set_point(int status){
//     if(status != 0){

//         ICEDUINO_SEVENSEGMENT | 0x01;
//     }
//     else{
//         ICEDUINO_SEVENSEGMENT & 0b11111110;
//     }
// }

// falls vhdl die kombinatorischen dinge übernehmen soll dann diese funktionen nutzen
void iceduino_sevensegment_set(int num){
    ICEDUINO_SEVENSEGMENT = num;
}