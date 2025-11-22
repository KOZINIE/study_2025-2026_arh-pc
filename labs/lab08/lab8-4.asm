%include 'in_out.asm'

SECTION .data
msg_func db "Функция: f(x) = 2*(x-1)", 0
msg_result db "Результат: ", 0

SECTION .text
GLOBAL _start

_start:
    ; Выводим описание функции
    mov eax, msg_func
    call sprintLF

    ; Аргументы передаются через стек
    ; pop ecx = argc, pop edx = адрес возврата (не используется)
    pop ecx
    pop edx
    sub ecx, 1           ; уменьшаем на 1, т.к. первый аргумент — имя программы
    mov esi, 0           ; esi = сумма

next_arg:
    cmp ecx, 0
    jz print_result

    pop eax              ; берем следующий аргумент
    call atoi            ; преобразуем в число

    ; f(x) = 2 * (x - 1)
    sub eax, 1           ; x - 1
    shl eax, 1           ; умножаем на 2
    add esi, eax         ; добавляем к сумме

    dec ecx
    jmp next_arg

print_result:
    mov eax, msg_result
    call sprint
    mov eax, esi
    call iprintLF

    call quit