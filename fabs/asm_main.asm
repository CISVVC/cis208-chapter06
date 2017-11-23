;

%define a     qword [ebp+8]

segment .data

segment .bss
 

segment .text
        global  the_function
the_function:
        enter   0,0

        fld    a             ; stack: a
        fabs                ; abs(a)
        mov     eax,0           ; return value is 0
quit:
        leave
        ret

