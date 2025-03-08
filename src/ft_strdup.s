section .text
default rel         ; Enable RIP-relative addressing
global ft_strdup
extern malloc
extern ft_strlen
extern ft_strcpy

ft_strdup:
    push rdi            ; On sauvegarde rdi

    call ft_strlen      ; On appelle ft_strlen
    mov rdi, rax        ; On met le résultat dans rdi
    inc rdi             ; On incrémente rdi

    call malloc wrt ..plt  ; On appelle malloc, wrt ..plt : PLT-relative call
    test rax, rax       ; Test si rax = 0
    jz .error           ; Si oui, jump to error
    
    mov rdi, rax        ; On met le résultat dans rdi
    pop rsi             ; On récupère rsi
    call ft_strcpy      ; On copie rsi dans rdi 
    ret
.error:
    pop rdi
    xor eax, eax
    ret