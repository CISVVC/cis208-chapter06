/**
 * prints the bits that make up a double value
 */
#include<iostream>

typedef unsigned long long uint64;

const int BITS = (sizeof(double) * 8 -1);

void print_double(double d)
{
    uint64 num = *(uint64*)(&d);
    for(int j=BITS;j>=0;j--)
    {
        std::cout << ( (num>>j) & 1 );
        if(j == BITS )
            std::cout << " ";
        if(j == 53)
            std::cout << " ";
    }
    std::cout << std::endl;
}

int main()
{
    double number = 23.85;
    std::cout << "original number: " << number << std::endl;
    std::cout << "binary : ";
    print_double(number);

    return 0;
}
