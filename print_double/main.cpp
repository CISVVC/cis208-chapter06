/**
 * prints the bits that make up a double value
 */
#include<iostream>

typedef unsigned long long uint64;
typedef unsigned long uint32;


void print_float(float d)
{
    const int BITS = (sizeof(float) * 8 -1);
    uint32 num = *(uint32*)(&d);
    for(int j=BITS;j>=0;j--)
    {
        std::cout << ( (num>>j) & 1 );
        if(j == BITS )
            std::cout << " ";
        if(j == 23)
            std::cout << " ";
    }
    std::cout << std::endl;
}

void print_double(double d)
{
    const int BITS = (sizeof(double) * 8 -1);
    uint64 num = *(uint64*)(&d);
    for(int j=BITS;j>=0;j--)
    {
        std::cout << ( (num>>j) & 1 );
        if(j == BITS )
            std::cout << " ";
        if(j == 52)
            std::cout << " ";
    }
    std::cout << std::endl;
}

int main()
{
    //double number = 0.072;
    double number = -11.2;
    //unsigned char *num = (unsigned char*)(&number);
    //std::cout << "original number: " << number << std::endl;
    std::cout << "double : ";
    print_double(number);
    std::cout << "float : ";
    print_float(number);
    
    return 0;
}
