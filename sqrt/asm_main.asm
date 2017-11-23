;

%define a     qword [ebp+8]
%define b     qword [ebp+16]

segment .data

segment .bss
 

segment .text
        global  the_function
the_function:
        enter   0,0

        fld    a             ; stack: a
        fadd   b             ; stack: a+b
        fsqrt                ; sqrt(a+b)
        mov     eax,0           ; return value is 0
quit:
        leave
        ret

