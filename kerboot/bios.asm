org 0x7C00
[bits 16] 


    mov si, title     
    mov ah, 0x0E


title_loop:        
    lodsb         
    or al, al       
    jz title1      
    int 0x10        
    jmp title_loop 

title1:

mov al, 0x0D
int 0x10
mov al, 0x0A
int 0x10


   mov si, load     
    mov ah, 0x0E


load_loop:        
    lodsb         
    or al, al       
    jz halt     
    int 0x10        
    jmp load_loop 


halt:

;i hope someones fucking crazy enough to fucking fix the absoulutely horrid disk read.

hlt

title: db "KERBOOT [BIOS]",0
load: db "LOADING KERNEL.",0



times 510-($-$$) db 0
db 0x55, 0xaa 
