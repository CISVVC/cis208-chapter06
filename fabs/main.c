/*
 * file: main.c
 * Test file for asm_main.asm demonstrates using the fsqrt function
 */

#include <stdio.h>

#include "cdecl.h"

double PRE_CDECL the_function( double ) POST_CDECL;

int main()
{
  double a;

  printf("Enter a: ");
  scanf("%lf", &a);
  printf("result: %.10g\n",the_function( a ));
  return 0;
}

