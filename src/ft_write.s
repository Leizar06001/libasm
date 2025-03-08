section .text
default rel         ; Enable RIP-relative addressing
global ft_write
extern __errno_location

ft_write:
    mov rax, 1      ; 1 is the write
    syscall         ; appel syscall
    cmp rax, 0      ; compare rax to 0
    jl .error       ; if rax < 0, jump to error
    ret
.error:
    neg rax         ; negate rax
    mov rdi, rax    ; move rax to rdi
    call __errno_location wrt ..plt  ; Use PLT-relative call to get the error location
    mov [rax], edi  ; move edi to rax
    mov rax, -1     ; rax = -1
    ret