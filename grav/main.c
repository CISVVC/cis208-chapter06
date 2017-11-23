/*
 * file: quadt.c
 * Test file for quad.asm
 */

#include <stdio.h>

#include "cdecl.h"

double PRE_CDECL grav( double, double, double) POST_CDECL;

int main()
{
  double m1,m2,r;

  printf("Enter m1, m2, r: ");
  scanf("%lf %lf %lf", &m1, &m2, &r);
  printf("force: %.10g\n",grav( m1, m2, r));
  return 0;
}

