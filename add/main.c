/*
 * Test file for asm_main.asm
 */

#include <stdio.h>

#include "cdecl.h"

double PRE_CDECL add( double, double) POST_CDECL;

int main()
{
  double a,b;

  printf("Enter a and b: ");
  scanf("%lf %lf", &a, &b);
  printf("a + b = : %5.2f\n",add( a, b));
  return 0;
}

