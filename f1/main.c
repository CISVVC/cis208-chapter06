/*
 * Test file for asm_main.asm
 */

#include <stdio.h>

#include "cdecl.h"

double PRE_CDECL f1( double, double) POST_CDECL;

int main()
{
  double a,b;

  printf("Enter a and b: ");
  scanf("%lf %lf", &a, &b);
  printf("(a + b)  * 3= : %f\n",f1( a, b));
  return 0;
}

