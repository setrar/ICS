# Testing aarx noises

- [ ] Which version

> gcc --version
gcc (GCC) 11.4.1 20231218 (Red Hat 11.4.1-3)
Copyright (C) 2021 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



- [ ] Compile

```
gcc aarx.c
```

- [ ] Execute

```
./a.out
```
> Returns
```powershell
 Exit Pool - Starts 
Array # = 0	 Estimated delay = 1	 Noise Amp2 = 10000000000	
Array # = 1	 Estimated delay = 2	 Noise Amp2 = 20000000000	
Array # = 2	 Estimated delay = 3	 Noise Amp2 = 30000000000	
Array # = 3	 Estimated delay = 4	 Noise Amp2 = 40000000000	

 Exit Pool - Ends 
```

## Source Code

```c
#include <stdio.h>
#include <inttypes.h>

typedef struct {
  int est_delay;
} delay_t;

int main() {
    int nb_antennas_rx = 4;
    delay_t delay[4] = { {1}, {2}, {3}, {4} };
    uint64_t noises_amp2[4] = { 10000000000ULL, 20000000000ULL, 30000000000ULL, 40000000000ULL };

    printf("\n Exit Pool - Starts \n");

    for (int aarx = 0; aarx < nb_antennas_rx; aarx++) {
        printf("Array # = %i\t Estimated delay = %i\t Noise Amp2 = %" PRIu64 "\t\n", aarx, delay[aarx].est_delay, noises_amp2[aarx]);
    }

    printf("\n Exit Pool - Ends \n");

    return 0;
}
```

