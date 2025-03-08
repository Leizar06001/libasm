section .text
global ft_strcmp

ft_strcmp:
    xor rax, rax        ; rax = 0
.loop:
    mov al, byte [rdi]  ; copie le caractère de la destination dans al (8 bits)
    mov cl, byte [rsi]  ; copie le caractère de la source dans cl (8 bits)
    cmp al, cl          ; compare les deux caractères
    jne .diff           ; si différent, jump to diff
    test al, al         ; al & al > test si al = 0
    jz .equal           ; si oui, jump to equal
    inc rdi             ; incrémente la destination
    inc rsi             ; incrémente la source
    jmp .loop           ; boucle
.diff:
    sub eax, ecx        ; soustrait ecx de eax
    movsx rax, eax      ; permet de copier eax dans rax en signant
    ret
.equal:
    xor eax, eax        ; rax = 0
    ret