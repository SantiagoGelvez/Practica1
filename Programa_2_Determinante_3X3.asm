;  PROGRAMA N°3: DETERMINANTE DE MATRIZ 3X3

;  AUTORES: MARIA CAMILA CEPEDA SAENZ        201111157
;           SANTIAGO ANDRES GELVEZ CAMARGO   201111163

;  FECHA DE CREACION:   MARZO 14, 2017

STACK   SEGMENT PARA PUBLIC 'STACK'
    DB 64 DUP('STACK')
STACK ENDS

DATA    SEGMENT PARA PUBLIC 'DATA'
    Matriz  DB 9 DUP(?)
    Mult1   DB 1 DUP(?)
    Mult2   DB 1 DUP(?)
    Total   DB 1 DUP(?)
    AUX_CEN   DB 1 DUP(?)
    AUX_DEC   DB 1 DUP(?)
    AUX_UNI   DB 1 DUP(?)
    Titulo  DB 9,9,"PROGRAMA PARA HALLAR DETERMINANTE MATRIZ 3X3",'$'    
    Mensaje DB 10,13,"Ingrese matriz 3X3: ",'$'    
    Result  DB "El resultado del determinante es: ",'$'    
    Enter   DB 10,13,'$'     
    Espacio DB " ",'$'                    
    
DATA ENDS

CODE    SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODE,DS:DATA,SS:STACK
    
 START:
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DX, OFFSET Titulo
    MOV AH,09H
    INT 21H  
    MOV DX, OFFSET Enter
    MOV AH,09H
    INT 21H 
    MOV DX, OFFSET Mensaje
    MOV AH,09H
    INT 21H     
    MOV DX, OFFSET Enter
    MOV AH,09H
    INT 21H     
    MOV BX,0
    MOV CX,3
 ETIQUETA:
    PUSH CX
    MOV CX,3
 ETIQUETA1:
    MOV AH,01H
    INT 21H           
    SUB AL,30H
    MOV Matriz[BX],AL    
    MOV DX, OFFSET Espacio
    MOV AH,09H
    INT 21H
    INC BX 
 LOOP ETIQUETA1
    POP CX
    MOV DX, OFFSET Enter
    MOV AH,09H
    INT 21H  
 LOOP ETIQUETA

;DETERMINANTE:
    MOV AL,Matriz[5]
    MUL Matriz[7]
    MOV Mult1,AL
    
    MOV AL,Matriz[8]
    MUL Matriz[4]
    
    SUB AL,Mult1
    MUL Matriz[0]
    MOV Total,AL
;---------------------; 
    MOV AL,Matriz[6]
    MUL Matriz[5]
    MOV Mult1,AL
    
    MOV AL,Matriz[8]
    MUL Matriz[3]
    
    
    SUB AL,Mult1
    MUL Matriz[1]
    
    SUB Total,AL
;---------------------;    
    MOV AL,Matriz[4]
    MUL Matriz[6]
    MOV Mult1,AL
    
    MOV AL,Matriz[7]
    MUL Matriz[3]
   
    SUB AL,Mult1
    MUL Matriz[2]
    
    ADD Total,AL              
;---------------------;
    MOV DX, OFFSET Result
    MOV AH,09H
    INT 21H     
    MOV DX, OFFSET Enter
    MOV AH,09H
    INT 21H
    MOV  AX,00H
    MOV AL,Total   
      
    AAM
      MOV   AUX_UNI,AL
      MOV   AL,AH
      AAM
      MOV   AUX_DEC,AL
      MOV   AUX_CEN,AH
      
      MOV   BX,0000H
      MOV   DX,0000H
      
      MOV   BL,AUX_CEN
      ADD   BL,30H
      MOV   AH,02
      MOV   DL,BL
      INT   21H
      MOV   BL,AUX_DEC
      ADD   BL,30H
      MOV   AH,02
      MOV   DL,BL
      INT   21H
      MOV   BL,AUX_UNI
      ADD   BL,30H
      MOV   AH,02
      MOV   DL,BL
      INT   21H
      MOV   AX,02H
      INT   21H  
      
      
    
    MOV AH,2
	mov DL,Total
	INT 21h
	
;---------------------------------
;---------------------------------                  
    MOV AH,4CH
    INT 21H
 END START
CODE ENDS