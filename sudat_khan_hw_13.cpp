//Name: Sudat Khan
#include <iostream>
#include <cmath>
using namespace std;

class Vector {
    public:
        double x;
        double y;
        double z;
        Vector(double a1, double a2, double a3) { //Decleration of the Vector method
            x = a1;
            y = a2;
            z = a3;
        }
        Vector add(Vector u); //Declaration of the add method
        Vector subtract(Vector u); //Declaration of the subtract method
        double norm(); //Declaration of the norm method
        double dot(Vector u); //Declaration of the dot product method
        Vector cross(Vector u); //Declaration of the cross product method
        void print(); //Declaration of print method
};

void Vector::print() { //Definition of the print method
    cout << "<" << x << "," << y << "," << z << ">" << endl;
}
Vector Vector::add(Vector u) { //Definition of the add method
    return Vector(x+ u.x, y+ u.y, z+ u.z);
}
Vector Vector::subtract(Vector u) { //Definition of subtract method
    return Vector(x - u.x, y- u.y, z - u.z);
}
double Vector::norm() { //Definition of norm method
    return(sqrt(x*x + y*y + z*z));
}
double Vector::dot(Vector u) { //Definition of dot method
    return((x * u.x) + (y * u.y) + (z * u.z));
}
Vector Vector::cross(Vector u) { //Definition of cross method
    return Vector(y*u.z - z*u.y, x*u.z - z*u.x, x*u.y - y*u.x);
}
//Temporary variable for vector 1 coordinates
double a;
double b;
double c;
//Temporary variable for vector 2 coordinates
double e;
double f;
double g;

int main() {
    cout << "Enter x-value for vector 1: " << endl;
    cin >> a;
    cout << "Enter y-value for vector 1: " << endl;
    cin >> b;
    cout << "Enter z-value for vector 1: " << endl;
    cin >> c;
    
    cout << "Enter x-value for vector 2: " << endl;
    cin >> e;
    cout << "Enter y-value for vector 2: " << endl;
    cin >> f;
    cout << "Enter z-value for vector 2: " << endl;
    cin >> g;

    Vector v1 = Vector(a, b, c);
    Vector v2 = Vector(e, f, g);
    cout << "This is vector 1: ";
    v1.print();
    cout << "This is vector 2: ";
    v2.print();

    Vector sum = v1.add(v2);
    cout << "This is the sum of vector 1 and 2: ";
    sum.print();

    Vector difference = v1.subtract(v2);
    cout << "This is the difference between vector 1 and 2: ";
    difference.print();

    cout << "This is the normalization  of the summed vector resulting from vector 1 + vector 2: " << sum.norm() << endl;
    cout << "This is the normalization of the vector difference resulting from vector 1 - vector 2: " << difference.norm() << endl;
    cout << "This is the dot product of vector 1 and 2: " << v1.dot(v2) << endl;
    
    Vector crossprod = v1.cross(v2);
    cout << "This is the cross product of vector 1 and 2: ";
    crossprod.print();

    return 0;
}
