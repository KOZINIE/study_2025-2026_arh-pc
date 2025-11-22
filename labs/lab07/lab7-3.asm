%include "in_out.asm"

SECTION .data
msgA db "Введите A: ", 0
msgB db "Введите B: ", 0
msgC db "Введите C: ", 0
msgMin db "Наименьшее число: ", 0

SECTION .bss
A resb 10
B resb 10
C resb 10
min resd 1

SECTION .text
GLOBAL _start
_start:

; ===== Ввод A =====
mov eax, msgA
call sprint

mov ecx, A
mov edx, 10
call sread

mov eax, A
call atoi
mov [A], eax

; ===== Ввод B =====
mov eax, msgB
call sprint

mov ecx, B
mov edx, 10
call sread

mov eax, B
call atoi
mov [B], eax

; ===== Ввод C =====
mov eax, msgC
call sprint

mov ecx, C
mov edx, 10
call sread

mov eax, C
call atoi
mov [C], eax

; ===== Поиск минимума =====
mov eax, [A]     ; min = A
mov [min], eax

mov eax, [B]
cmp eax, [min]
jge check_C
mov [min], eax

check_C:
mov eax, [C]
cmp eax, [min]
jge finish
mov [min], eax

finish:
mov eax, msgMin
call sprint

mov eax, [min]
call iprintLF

call quit