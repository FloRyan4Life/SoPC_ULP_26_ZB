#include "neorv32_iceduino.h"


void iceduino_sevensegment_clr(){
    ICEDUINO_SEVENSEGMENT = 0x00;

}
 

void iceduino_sevensegment_set(int num){
    ICEDUINO_SEVENSEGMENT = num;
}