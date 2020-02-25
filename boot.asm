[ORG 0]

    jmp 07C0h:start

start:
    mov ax, cs
    mov ds, ax
    mov es, ax

    mov ax, msg
    mov bp, ax                    ; es:bp
    mov cx, 16                    ; cx = String Length
    mov ax, 01301h                ; ah = 13h, al = 01h
    mov bx, 000ch                 ; bh = Page(0) bl = 0ch
    mov dl, 0
    int 10h                       ; Interupt 10h

hang:
    jmp hang

msg:  db  "Hello, OS world!"

times 510-($-$$)  db  0
dw 0xaa55