.model small
.stack 100h
.data
    msg db 'Conteo descendente: $'
    number db 9   ; Comenzar desde 9

.code
main:
    ; Inicializaci?n
    mov ax, @
    mov ds, ax

    ; Mostrar el mensaje de conteo
    mov dx, offset msg
    mov ah, 09h
    int 21h

    ; Ciclo de conteo descendente
countdown:
    ; Convertir el n?mero a ASCII para mostrar
    add number, '0'
    mov dl, number
    mov ah, 02h    ; Funci?n para imprimir un car?cter
    int 21h
    sub number, '0' ; Restaurar el valor original

    ; Decrementar el n?mero
    dec number

    ; Comprobar si el conteo ha llegado a -1
    cmp number, -1
    jge countdown    ; Saltar si el n?mero es mayor o igual a -1

    ; Finalizar el programa
    mov ax, 4C00h
    int 21h
end main

