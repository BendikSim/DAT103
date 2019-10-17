section .bss
	num resb 1

segment .data
	nl dw 0xa
	nlLen equ $ - nl
	cr equ 13
	lf equ 10
	crlf db cr,lf
	crlfLen equ $ - crlf

section .text

global _start

_start:
	mov ecx, 12
	mov eax, 1 ; startverdi = 1

l1:
	mov ebx, eax
	cmp eax, 9
	jle skriven
	mov ebx, 1
	call skrivtall
	mov ebx, eax
	sub ebx, 10

skriven:
	call skrivtall
	inc eax
	call nylinje
	loop l1

	mov ebx,0
	mov eax,1
	int 80h

nylinje:
push edx
push ecx
push ebx
push eax
mov edx, crlfLen
mov ecx, crlf
mov ebx, 1
mov eax, 4
int 80h
pop eax
pop ebx
pop ecx
pop edx
ret

skrivtall:
push edx
push ecx
push eax
add ebx, '0' ;gjør om tallet til ascii
mov [num], ebx
mov edx, 1
mov ecx, num
mov ebx, 1
mov eax, 4
int 80h
pop eax
pop ecx
pop edx
ret

