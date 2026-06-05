nasm -f bin kerboot/kerboot/bios.asm -o bios.bin
cc kerboot/kerboot/uefi.C -o uefi.efi
mv kerboot/kerboot/bios.bin /root/
mv kerboot/kerboot/uefi.efi /root/
rm kerboot/kerboot/bios.asm 
rm kerboot/kerboot/uefi.C
