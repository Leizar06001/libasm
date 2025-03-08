section .text
global ft_strcpy

ft_strcpy:
    mov rax, rdi    ; copie l'adresse de la destination dans rax
.loop:
    mov dl, [rsi]   ; copie le caractère de la source dans dl (8 bits)
    mov [rdi], dl   ; copie le caractère de dl dans la destination
    inc rsi         ; incrémente la source
    inc rdi         ; incrémente la destination
    test dl, dl     ; dl & dl > test si dl = 0
    jnz .loop       ; si non, boucle
    ret