;
; file: asm_main.asm

%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
%define  SIZE 10
segment .data
; next print out result message as series of steps
msg:    db "Hello world: %c %s of length %d %d %X %e %E",10,0
					; format string for printf
char1:	db	'a'			; a character 
str1:	db	"string",0	        ; a C string, "string" needs 0
len:	equ	$-str1			; len has value, not an address
inta1:	dd	1234567		        ; integer 1234567
hex1:	dd	0x6789ABCD	        ; hex constant 
flt1:	dd	5.327e-30		; 32-bit floating point
flt2:	dq	-123.456789e300	        ; 64-bit floating point
; uninitialized data is put in the .bss segment
;
segment .bss
flttmp:	resq 1			        ; 64-bit temporary for printing flt1

;
; code is put in the .text segment
;
segment .text
        global  asm_main
		extern  printf
asm_main:
        enter   0,0               ; setup routine
        pusha

		fld	    dword [flt1]	        ; need to convert 32-bit to 64-bit
		fstp	qword [flttmp]          ; floating load makes 80-bit,
										; store as 64-bit
										; push last argument first
		push	dword [flt2+4]	        ; 64 bit floating point (bottom)
		push	dword [flt2]	        ; 64 bit floating point (top)
		push	dword [flttmp+4]        ; 64 bit floating point (bottom)
		push	dword [flttmp]	        ; 64 bit floating point (top)
		push	dword [hex1]	        ; hex constant
		push	dword [inta1]	        ; integer data pass by value
		push	dword len	        ; constant pass by value
		push	dword str1		; "string" pass by reference 
        push    dword [char1]		; 'a'
        push    dword msg		; address of format string
        call    printf			; Call C function
        add     esp, 40			; pop stack 10*4 bytes
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


