; int main(int argc, const char * argv[]) {  
;     printf("Please input the number of plates: ");  
;     int n;  
;     scanf("%d",&n);  
;     hanoi(n, 1, 2, 3);  
;     return 0;  
; }

%include "asm_io.inc"

; init data
segment .data
prompt1  db     "Please input the number of plates: ", 0

; uninit data
segment .bss

segment .text
    GLOBAL asm_main
asm_main:
    enter   0, 0 ; start to run
    pusha

    mov     eax, prompt1
    call    print_string
    call    read_int
    call    print_nl
    
    push    eax
    mov     dword ebx, 1
    push    ebx
    mov     dword ecx, 2
    push    ecx
    mov     dword edx, 3
    push    edx

    call    hanoi

    add     esp, 16

    popa
    mov     eax, 0; back to C/C++
    leave
    ret


; void hanoi(int n,int a,int b,int c)  
; {  
;     if(n==1)  
;     {  
;         printf: a --> c \n 
;     }  
;     else{  
;         hanoi(n-1,a, c, b);  
;         printf: a --> c \n 
;         hanoi(n-1, b, a, c);  
;     }  
; }  

segment .data
arrow   db  " --> ", 0 

    ; -------  High
    ; n
    ; -------
    ; plate 1
    ; -------
    ; plate 2
    ; -------
    ; plate 3
    ; -------  Low

segment .text
    GLOBAL hanoi
hanoi:
    enter   16 , 0          ; 4 parameters: n, plate1, plate2, plate3,
    ; push    ebp
    ; mov     ebp, esp

    ; mov     eax, [ebp + 20]
    ; call    print_int
    ; call    print_nl
    ; mov     eax, [ebp + 12]
    ; call    print_int
    ; call    print_nl
    ; mov     eax, [ebp + 16]
    ; call    print_int
    ; call    print_nl
    ; mov     eax, [ebp + 20]
    ; call    print_int
    ; call    print_nl

    mov     eax, [ebp + 20]
    cmp     eax, 1
    jne     elseif          
    mov     eax, [ebp + 16] ; print plate1 --> plate3
    call    print_int
    mov     eax, arrow
    call    print_string
    mov     eax, [ebp + 8]   
    call    print_int
    call    print_nl
    jmp     quit

elseif:
    mov     eax, [ebp + 20]  ; hanoi(n-1, p1, p3, p2)
    dec     eax
    push    eax
    mov     ebx, [ebp + 16]
    push    ebx
    mov     ecx, [ebp + 8]
    push    ecx
    mov     edx, [ebp + 12]
    push    edx
    call    hanoi
    add     esp, 16


    mov     eax, [ebp + 16] ; print plate1 --> plate3
    call    print_int
    mov     eax, arrow
    call    print_string
    mov     eax, [ebp + 8]   
    call    print_int
    call    print_nl

    mov     eax, [ebp + 20]  ; hanoi(n-1, p2, p1, p3)
    dec     eax
    push    eax
    mov     ebx, [ebp + 12]
    push    ebx
    mov     ecx, [ebp + 16]
    push    ecx
    mov     edx, [ebp + 8]
    push    edx
    call    hanoi
    add     esp, 16
    jmp     quit
quit:
    leave
    ret