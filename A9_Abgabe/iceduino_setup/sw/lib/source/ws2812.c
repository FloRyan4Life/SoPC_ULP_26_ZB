#include "neorv32_iceduino.h"

void update_matrix(int pixel, int r, int g, int b){
    int rgb = ((g<<16)|(r<<8)|(b));
    WS2812 = rgb;
}