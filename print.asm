[ORG 0]
    jmp start

msg:  db  "Hello, LEAF OS! "

start:
    mov ax, cs
    mov ds, ax
    mov es, ax

print:
    mov ax, msg
    mov bp, ax                    ; ES:BP
    mov cx, 16                    ; CX = String Length
    mov ax, 01301h                ; AH = 13h, AL = 01h
    mov bx, 000Ch                 ; BH = Page(0) BL = 0ch
    mov dl, 0
    int 10h                       ; Interupt 10h

hang:
    jmp hang

times 510-($-$$)  db  0
dw 0xAA55