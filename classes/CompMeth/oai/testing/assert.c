#include <assert.h>
#include <stdio.h>

// Function to perform division
double safe_division(double numerator, double denominator) {
    // Assert that the denominator is not zero
    assert(denominator != 0.0 && "Denominator must not be zero!");

    return numerator / denominator;
}

int main() {
    double num = 10.0;
    double den = 0.0;  // Intentionally setting it to zero for demonstration

    // This will cause the assert to trigger, because denominator is zero
    double result = safe_division(num, den);

    // If the program continues, print the result
    printf("Result of division: %f\n", result);

    return 0;
}

