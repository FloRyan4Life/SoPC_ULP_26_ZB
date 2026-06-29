#include "neorv32_iceduino.h"

void set_pixel(int pixel, uint8_t r, uint8_t g, uint8_t b){
    if (pixel < 0 || pixel >= MATRIX_SIZE) {
        return; // Invalid pixel index
    }
    uint32_t rgb = ((uint32_t)r << 16) | ((uint32_t)g << 8) | (uint32_t)b;
    WS2812[pixel] = rgb;
}