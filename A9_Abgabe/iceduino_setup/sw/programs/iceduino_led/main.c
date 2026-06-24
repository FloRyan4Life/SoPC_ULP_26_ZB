#include <neorv32_iceduino.h>

int main()
{

  while (1)
  {
    for (int i = 0; i < 64; i++)
    {
      set_pixel(i, 255, 0, 0);
      for (int j = 0; j < 10000; j++)
        ;
    }

    neorv32_cpu_delay_ms(1000);

    for (int i = 0; i < 64; i++)
    {
      set_pixel(i, 0, 255, 0);
      for (int j = 0; j < 10000; j++)
        ;
    }

    neorv32_cpu_delay_ms(1000);

    for (int i = 0; i < 64; i++)
    {
      set_pixel(i, 0, 0, 255);
      for (int j = 0; j < 10000; j++)
        ;
    }

    neorv32_cpu_delay_ms(1000);
  }

  while (1)
    ;

  return 0;
}
