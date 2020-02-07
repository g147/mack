%include        'io.asm'

SECTION .data
msg1    db      'Hello, World !!!', 0h
 
SECTION .text
global  _start
 
_start:
    mov     eax, msg1
    call    printLF
    call    terminate