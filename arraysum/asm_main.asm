;
; file: asm_main.asm

%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
%define  SIZE 10
segment .data
print_format db "%f",0xA,0
flt1:  dd 5.327e-30
flt2:  dq -123.456789e300
; uninitialized data is put in the .bss segment
;
segment .bss
array resq SIZE
sum resq 1

;
; code is put in the .text segment
;
segment .text
        global  asm_main
		extern  printf
asm_main:
        enter   0,0               ; setup routine
        pusha
; next print out result message as series of steps

		mov ecx, SIZE
		mov esi, array
;		fldz ; ST0 = 0
        fld dword [flt2]
lp:
		fadd qword [esi] ; ST0 += *(esi)
		add esi, 8 ; move to next double
		loop lp

		fstp qword [sum] ; store result into sum
		push dword [sum+4] ; store result into stack (MSB)
		push dword [sum] ; store result into stack (LSB)
		push print_format
		call printf
        add  esp,12
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


