#include <neorv32_iceduino.h>

int main() {
    /*
    for syntesize
    */

    int cnt = 0;

    while (1) {
        if (iceduino_button_get(1) != 0) {
            neorv32_cpu_delay_ms(1200);

            switch (cnt) {
                case 0:
                    for (int i = 0; i < 64; i++) {
                        set_pixel(i, 255, 0, 0);
                        for (int j = 0; j < 10000; j++);
                    }
                    cnt++;
                    break;
                case 1:
                    for (int i = 0; i < 64; i++) {
                        set_pixel(i, 0, 255, 0);
                        for (int j = 0; j < 10000; j++);
                    }
                    cnt++;
                    break;
                case 2:
                    for (int i = 0; i < 64; i++) {
                        set_pixel(i, 0, 255, 0);
                        for (int j = 0; j < 10000; j++);
                    }
                    cnt = 0;
                    break;
            }
        }
    }

    while (1) {
        for (int i = 0; i < 64; i++) {
            set_pixel(i, 255, 0, 0);
            for (int j = 0; j < 10000; j++);
        }

        neorv32_cpu_delay_ms(1000);

        for (int i = 0; i < 64; i++) {
            set_pixel(i, 0, 255, 0);
            for (int j = 0; j < 10000; j++);
        }

        neorv32_cpu_delay_ms(1000);

        for (int i = 0; i < 64; i++) {
            set_pixel(i, 0, 0, 255);
            for (int j = 0; j < 10000; j++);
        }

        neorv32_cpu_delay_ms(1000);
    }

    while (1);

    return 0;
}
