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
    print_double(23.85);

    return 0;
}
