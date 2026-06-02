title db"KERBOOT [BIOS]"
load db"LOADING KERNEL."
    mov si, title     
    mov ah, 0x0e       


.title_loop:        
    lodsb         
    or al, al       
    jz .title         
    int 0x10        
    jmp .title_loop 

.title:

    mov si, load     
    mov ah, 0x0e       

mov al, 0x0D
int 0x10
mov al, 0x0A
int 0x10

.load_loop:        
    lodsb         
    or al, al       
    jz .load         
    int 0x10        
    jmp .load_loop

load:


hlt: 
hlt

;someone write the code to load kernel to ram


int 0x13 ;disk controller interrupt
time 510 db 0
db 0x55, 0xaa 
hlt: 
hlt
