; Program som skriver ut Hello World

; Konstanter
   cr equ 13	; Vognretur
   lf equ 10	; Linjeskift

section .data 	; Datsegment
   melding db 'Hello world!',cr,lf
   lengde equ $ - melding

section .text	; Kodesegment
global _start
_start:
   mov edx,lengde
   mov ecx,melding
   mov ebx,1
   mov eax,4	; sys_write
   int 80h
   mov ebx,0
   mov eax,1	; sys_exit
   int 80h
