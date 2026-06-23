#include <neorv32_iceduino.h>


int main() {

  for (int i = 0; i<64;i++){
    update_matrix(i, 255,0,0);
  }
  while(1);

  return 0;
}


