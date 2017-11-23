;
; file: asm_main.asm

%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
%define  SIZE 10
segment .data
; next print out result message as series of steps

format_string:    db "The int value is: %d",10,"The double value is %f",10,0
					; format string for printf
number:  dq 23.85
; uninitialized data is put in the .bss segment
;
segment .bss

;
; code is put in the .text segment
;
segment .text
        global  asm_main
		extern  printf
asm_main:
        enter   0,0               ; setup routine
        pusha
        
        push    dword [number + 4]
        push    dword [number]
        push    dword 42
        push    dword format_string		; address of format string
        call    printf			; Call C function
        add     esp, 16			; pop stack 
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


