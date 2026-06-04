bits 16
title: db"KERBOOT [BIOS]"
load: db"LOADING KERNEL."
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


disk_data: resb 512

mov ah, 2 ;tell bios we are reading from disk.
mov ch, 128 ;the ammount of sectors.
mov cl, 64 ;cylinders
mov dh, 1 ;header 1
mov dl, 0x80 ;specify we are reading from the C: drive
int 0x13 ;disk controller interrupt

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
