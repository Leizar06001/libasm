section .text
default rel         ; Enable RIP-relative addressing
global ft_read
extern __errno_location

ft_read:
    mov rax, 0      ; 0 > read
    syscall         ; appel syscall
    cmp rax, 0      ; compare avec 0
    jl .error       ; si rax < 0, jump to error
    ret
.error:
    neg rax         ; negate rax
    mov rdi, rax    ; move rax to rdi
    call __errno_location wrt ..plt  ; Use PLT-relative call to get the error location
    mov [rax], edi  ; move edi to rax
    mov rax, -1     ; rax = -1
    ret