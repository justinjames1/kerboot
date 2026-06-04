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
mov ch, 1 ;the total ammount of sectors.
mov cl, 8 ;cylinders
mov dh, 4 ;header 1
mov es, disk_data ;move data read from the disk into a unassigned variable or smth
mov dl, 0x80 ;specify we are reading from the C: drive
int 0x13 ;disk controller interrupt

;i hope someones fucking crazy enough to fucking fix the absoulutely horrid disk read.

cmp disk_data, 0xFF ;search for kernel binary entry.

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
