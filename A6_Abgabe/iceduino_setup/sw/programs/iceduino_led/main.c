// main.c
#include <neorv32_iceduino.h>

int main(void)
{
    uint8_t i = 0;
    
    // iceduino_sevensegment_set(0);
    while (1) {
        iceduino_sevensegment_set(i);  // Schreibe 0..9 ins Register
        i++;
        if (i > 9) i = 0;            // 0-9 zählen, ohne Delay!

        for(int i = 0; i<5000000;i++);
    }
    
    return 0;
}