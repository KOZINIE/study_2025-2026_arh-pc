%include 'in_out.asm'

SECTION .data
    msg_func    db "Функция: f(x) = 2*(x-1)", 0
    msg_result  db "Результат: ", 0

SECTION .text
GLOBAL _start

_start:
    mov eax, msg_func
    call sprintLF

    pop ecx        ; argc
    pop edx        ; return addr (не нужен)
    sub ecx, 1     ; исключаем имя программы

    mov esi, 0     ; сумма

next:
    cmp ecx, 0
    jz _end

    pop eax
    call atoi          ; eax = x

    call _calculate_fx ; eax = 2*(x-1)

    add esi, eax       ; суммируем

    loop next          ; ecx--; если не ноль → next

_end:
    mov eax, msg_result
    call sprint

    mov eax, esi
    call iprintLF

    call quit


; -----------------------------------------
; f(x) = 2*(x-1)
; Вход:  eax = x
; Выход: eax = 2*(x-1)
; -----------------------------------------
_calculate_fx:
    sub eax, 1     ; x - 1
    shl eax, 1     ; * 2
    ret