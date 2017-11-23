;
;FLD 	source 	loads a floating point number from memory onto the top of the stack. The source may be a single, double or extended precision number or a coprocessor register.

;FILD 	source reads an integer from memory, converts it to floating point and stores the result on top of the stack. The source may be either a word, double word or quad word.
;FLD1 	stores a one on the top of the stack.
;FLDZ 	stores a zero on the top of the stack.

%define a     qword [ebp+8]
%define b     qword [ebp+16]

segment .data
value dq 3.0
segment .bss
 

segment .text
        global  f1
f1:
        enter   0,0

        fld     a
        fadd    b
        fmul    qword [value]

quit:
        leave
        ret

