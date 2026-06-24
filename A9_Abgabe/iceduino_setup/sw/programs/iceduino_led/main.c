#include <neorv32_iceduino.h>


int main() {

  for (int i = 0; i<64; i++){
    set_pixel(i, 255,0,0);
    for(int j = 0;j<10000;j++);
  }

  for(int j = 0;j<1000000;j++);

  for (int i = 0; i<64; i++){
    set_pixel(i, 0,255,0);
    for(int j = 0;j<10000;j++);
  }

  while(1);

  return 0;
}


