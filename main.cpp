#include <iostream>
#include <complex>
using namespace std;

int main() {
    // Create complex numbers
    complex<double> c1(3.0, 4.0);
    complex<double> c2(1.0, 2.0);
    complex<double> c3(0, -INFINITY);

    // Display complex numbers
    cout << "c1 = " << c1 << endl;
    cout << "c2 = " << c2 << endl;
    cout << "c3 = " << c3 << endl;

    // Perform arithmetic operations
    complex<double> c4 = c1 + c2;
    complex<double> c5 = c1 - c2;
    complex<double> c6 = c1 * c2;
    complex<double> c7 = c1 / c2;

    // Display results
    cout << "c1 + c2 = " << c4 << endl;
    cout << "c1 - c2 = " << c5 << endl;
    cout << "c1 * c2 = " << c6 << endl;
    cout << "c1 / c2 = " << c7 << endl;

    // Calculate norm, conjugate, and projection
    cout << "Norm of c1 = " << norm(c1) << endl;
    return 0;
}