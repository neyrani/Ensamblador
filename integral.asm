.286
pila segment stack
    db 32 DUP('stack---')
pila ends
datos segment
    v db 4
    vv db 2
    tre db 3
    rs db 12
    
    final dw 0AH,(?),"$"
    rst dw 0AH,(?),"$"
    segr dw 0AH,(?),"$"
    rtt dw 0AH,,(?),"$"
    res dw 0AH,(?),"$"
    re db 0AH,(?),"$"
    m db 0AH,"resultado $"
datos ends
codigo segment 'code'
    assume SS:pila,DS:datos,CS:codigo
main proc far
push DS
push 0
mov AX,datos
mov DS,ax   
    ;---------multiplicacion primer termino
    mov al,v
    mul vv
    add al,30h
    mov res,ax
   
    mov ah,09h
    lea dx,res
    int 21h
    
   
    
    ; xor ax,ax ;limpiar
        
        
        ;---------multiplicacion segundo 
    mov al,vv
    mul vv
    mul tre
    div vv
    add al,30h
    mov segr,ax
    
   
    
    mov ah,09h
    lea dx,segr
    int 21h
    
    ;xor ax,ax ;limpiar
    
    ;TERCER TERMINO termino
    
    mov al,vv
    mul vv
    mul vv
    add al,30h
    mov rtt,ax
   
    mov ah,09h
    lea dx,rtt
    int 21h
   
  ; xor ax,ax ;limpiar
    ;terminos juntos 
   
    mov bx,res
    mov al,vv
    mul vv
    mul tre
    div vv
    add al,30h
    mov segr,ax
    
   
    
    mov ah,09h
    lea dx,segr
    int 21h
    
    
     xor ax,ax ;limpiar
    

ret
main ENDP
codigo ENDS
end main