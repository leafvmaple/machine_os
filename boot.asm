[ORG 0]

    jmp 07C0h:start

start:
    mov ax, cs
    mov ds, ax
    mov es, ax

reset:
    mov ax, 0           ; int13h[AH = 00h]: Reset Drive
    mov dl, 0           ; Drive = 0
    int 13h

    jc reset            ; Exception

read:

    mov ax, 1000h       ; ES:BX = 1000h:0000
    mov es, ax
    mov bx, 0

    mov ah, 2           ; int13h[AH = 02h]: Load Drive
    mov al, 5           ; Load 5 Sectors
    mov ch, 0           ; Cylinder = 0
    mov cl, 2           ; Sector   = 2
    mov dh, 0           ; Head     = 0
    mov dl, 0           ; Drive    = 0
    int 13h             ; Load Data to 1000h:0000

    jc read             ; Exception

    jmp 1000h:0000

times 510-($-$$)  db  0
dw 0xAA55