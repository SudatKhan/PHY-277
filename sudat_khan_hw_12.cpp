//Name: Sudat Khan
//Purpose: To use Newton-Raphson iteration to find roots
// initial guess for root: 0; epsilon: 0.00000001; root: 0
// intial guess for root: 1.918; epsilon: 0.0001; root: 1.9175
// initial guess for root: 2.613; epsilon: 0.00001; root: 2.61298
// initial guess for root: -1.918; epsilon: 0.00001; root: -1.9175
// initial guess for root: -2.613; epsilon: 0.00001; root: -2.61298

#include <iostream>
#include <cmath>
using namespace std;

float xold; // Old estimate of root
float xnew; // New estimate of root
float fold; // the value of the function f(xold)
float df_old; // the value of the derivated df/dx(xold)
float epsilon; //value for convergence
bool converged; // boolean value for convergence (true or false)
int n_interations = 1; // number of iterations
int n_interations_MAX = 300; //maximum number of iterations

int main() {
    cout << "Enter initial guess at root: ";
    cin >> xold;
    cout << "Enter initial guess at epsilon: ";
    cin >> epsilon;

    do { // Initiate do loop to use Newton-Raphson iteration to find roots
        fold = xold + 3 * sin(2 * xold);
        df_old = 1 + 6 * cos(2 * xold);
        if (abs(df_old) < 1.0e-20) { //If derivative is zero the method fails
            cout << "df_old is approximately zero";
            cout << "method has failed";
            return 2;
        }
        xnew = xold - fold/df_old;
        if (xold != 0.0) { //checks for convergence
            converged = abs(xnew - xold) < epsilon * abs(xold);
        } else {
            converged = abs(xnew - xold) < epsilon;
        }
        if (converged) {
            cout << "root is";
            cout << xnew;
            return 0;
        }
        xold = xnew;
        n_interations = n_interations + 1;
    } while (n_interations < n_interations_MAX);

    cout << "Method Failed: Too many iterations";
    return 1;
}

