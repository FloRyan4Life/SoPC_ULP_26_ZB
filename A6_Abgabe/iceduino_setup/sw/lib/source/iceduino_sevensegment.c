#include "neorv32_iceduino.h"

void iceduino_sevensegment_set(int num)
{
    int num_bitpattern = 0x0;

    switch (num){
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
    }


    ICEDUINO_SEVENSEGMENT = num_bitpattern;
}
void iceduino_sevensegment_clr();
void iceduino_sevensegment_set_pin(int pin);
void iceduino_sevensegment_clr_pin(int pin);