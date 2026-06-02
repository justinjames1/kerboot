mov al, 1
esc:
db 0
inc ax
cmp ax, 510
jz esc_1
jmp esc
esc_1:
db 0x55, 0xaa 
