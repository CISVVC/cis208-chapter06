;
; file: quad.asm

; function grav
; calculates the gravitation force according to the equation:
;    G * m1 * m2
;    -----------
;       r * r
;
; G  : gravitational force constant
; m1 : mass of body 1
; m2 : mass of body 2
; r : distance between bodies
; Return value:
;   returns 1 if real roots found, else 0
;FLD 	source 	loads a floating point number from memory onto the top of the stack. The source may be a single, double or extended precision number or a coprocessor register.

;FILD 	source reads an integer from memory, converts it to floating point and stores the result on top of the stack. The source may be either a word, double word or quad word.
;FLD1 	stores a one on the top of the stack.
;FLDZ 	stores a zero on the top of the stack.

%define m1     qword [ebp+8]
%define m2     qword [ebp+16]
%define r      qword [ebp+24]

segment .data
G: dq 6.674e-11 ;
 

segment .text
        global  grav
grav:
        enter   0,0

        fld    qword [G]      ; stack G
        fmul   m1             ; stack: G*m1
        fmul   m2             ; stack: G*m1*m2
        fld    r
        fmul   r             ; stack: r*r
        fdivr  st1

; alternative
        ;fld    qword [G]      ; stack G
        ;fmul   m1             ; stack: G*m1
        ;fmul   m2             ; stack: G*m1*m2
        ;fld    r
        ;fmul   r             ; stack: G*m1*m2,r*r
        ;fstp   qword [denom]
        ;fdiv   qword [denom]
        mov     eax,0           ; return value is 0

quit:
        leave
        ret

