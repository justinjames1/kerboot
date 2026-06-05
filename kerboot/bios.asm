[org 0x7C00]
[bits 16] 
disk_data: db"BETA LOAD."
title: db "KERBOOT [BIOS]"
load: db "LOADING KERNEL."
    mov si, title     
    mov ah, 0x0e       


.title_loop:        
    lodsb         
    or al, al       
    jz .title         
    int 0x10        
    jmp .title_loop 

.title:

mov al, 0x0D
int 0x10
mov al, 0x0A
int 0x10

    mov si, load     
    mov ah, 0x0e       


.load_loop:        
    lodsb         
    or al, al       
    jz .load         
    int 0x10        
    jmp .load_loop

.load:


.keyboard:
mov ah, 0
int 0x16
cmp al, 'c'
jnz .keyboard ;keep scanning until the c key is pressed.
jz .CDISK_HANDLE
mov ax, 0x1000
mov es, ax ;cylinders
xor bx, bx
mov ah, 2 ;tell bios we are reading from disk.
mov al, 63 ;read from 16 sectors
mov ch, 1 ;cylinders
mov cl, 1
mov dh, 0 ;header
mov dl, 0x80 ;specify we are reading from the C: drive
int 0x13 ;disk controller interrupt
.CDISK_HANDLE:

;i hope someones fucking crazy enough to fucking fix the absoulutely horrid disk read.



    mov si, disk_data   
    mov ah, 0x0e       

mov al, 0x0D
int 0x10
mov al, 0x0A
int 0x10

.diskprint_loop:        
    lodsb         
    or al, al       
    jz .hlt       
    int 0x10        
    jmp .diskprint_loop

.hlt: 
hlt

times 510 db 0
db 0x55, 0xaa 
