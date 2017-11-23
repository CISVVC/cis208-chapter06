/*
 * file: main.c
 * Test file for asm_main.asm demonstrates using the fsqrt function
 */

#include <stdio.h>

#include "cdecl.h"

double PRE_CDECL the_function( double, double) POST_CDECL;

int main()
{
  double a,b;

  printf("Enter a, b: ");
  scanf("%lf %lf", &a, &b);
  printf("result: %.10g\n",the_function( a, b));
  return 0;
}

