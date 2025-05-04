#include <stdio.h>

#define VEC_LENGTH 4

int main() {
    float a[VEC_LENGTH], b[VEC_LENGTH], c[VEC_LENGTH];

    // Initialize arrays a and b
    for(int i = 0; i < VEC_LENGTH; i++) {
        a[i] = i;
        b[i] = i + 1;
    }

    // Calculate the sum of arrays a and b into array c
    for(int i = 0; i < VEC_LENGTH; i++) {
        c[i] = a[i] + b[i];
    }

    // Optional: Print the contents of array c to verify the results
    for(int i = 0; i < VEC_LENGTH; i++) {
        printf("c[%d] = %f\n", i, c[i]);
    }

    return 0;
}

