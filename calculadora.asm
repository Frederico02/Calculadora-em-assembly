section .data
    prompt db 'Selecione uma operação:',0
    option1 db '1 - Adição',0
    option2 db '2 - Subtração',0
    option3 db '3 - Multiplicação',0
    option4 db '4 - Divisão',0
    result db 'Resultado: %d',0

section .bss
    num1 resb 4
    num2 resb 4
    res resb 4

section .text
    global _start

_start:
    ;imprime as opções
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 20
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, option1
    mov edx, 12
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, option2
    mov edx, 13
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, option3
    mov edx, 16
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, option4
    mov edx, 12
    int 0x80

    ;le o numero 1
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 4
    int 0x80

    ;le o numero 2
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 4
    int 0x80

    ;le a opcao
    mov eax, 3
    mov ebx, 0
    mov ecx, res
    mov edx, 4
    int 0x80

    ;realiza a operacao
    mov eax, [num1]
    mov ebx, [num2]
    cmp byte [res], '1'
    je add
    cmp byte [res], '2'
    je sub
    cmp byte [res], '3'
    je mul
    cmp byte [res], '4'
    je div

add:
    add eax, ebx
    jmp print

sub:
    sub eax, ebx
    jmp print

mul:
    mul ebx
    jmp print

div:
    xor edx, edx
    div ebx

print:
    ;imprime o resultado
    mov ebx, eax
    mov eax, 4
    mov ecx, result
    mov edx, 12
    int 0x80

    ;finaliza o programa
    mov eax, 1
    xor ebx, ebx
    int 0x80
