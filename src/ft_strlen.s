section .text
global ft_strlen

ft_strlen:
    xor rax, rax    ; rax = 0
.loop:
    cmp byte [rdi + rax], 0 ; rdi adresse chaine, rax index
    je .end                 ; si 0, jump to end
    inc rax                 ; incremente rax
    jmp .loop
.end:
    ret