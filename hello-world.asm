bits 64
default rel

extern GetStdHandle
extern WriteFile
extern ExitProcess

global main

section .data
    msg db "Hello, World!", 13, 10
    len equ $ - msg
    written dd 0

section .text
main:
    sub rsp, 40

    mov ecx, -11
    call GetStdHandle

    mov rcx, rax
    lea rdx, [msg]
    mov r8d, len
    lea r9, [written]
    mov qword [rsp+32], 0
    call WriteFile

    xor ecx, ecx
    call ExitProcess
