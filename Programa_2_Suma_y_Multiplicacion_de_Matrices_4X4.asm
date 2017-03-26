                              ;  PROGRAMA N°2: SUMA Y MULTIPLICACION DE MATRICES 4X4

;  AUTORES: MARIA CAMILA CEPEDA SAENZ        201111157
;           SANTIAGO ANDRES GELVEZ CAMARGO   201111163

;  FECHA DE CREACION:   MARZO 14, 2017

STACK  SEGMENT  PARA  PUBLIC   'STACK'
   DB 64 DUP('STACK') 
STACK  ENDS

DATA SEGMENT  PARA  PUBLIC   'DATA'
   
   MATRIZ1  DB 16 DUP(?)
   MATRIZ2  DB 16 DUP(?)
   MATRIZS  DB 16 DUP(?)
   MATRIZM  DB 16 DUP(?)
   TEMP     DB 4  DUP(?)
   INCRE    DB 1  DUP(?)
   PUNTERO  DB 1  DUP(?)
   
   MSJI  DB 9,9,"PROGRAMA PARA SUMA Y MULTIPLICACION DE MATRCIES 4X4",'$'
   MS_MTX1  DB 10,13,"ENTER MATRIX 1: ","$"
   MS_MTX2  DB 10,13,"ENTER MATRIX 2: ","$"
   MS_MTXS  DB 10,13,"MATRIX SUM: ","$"
   MS_MTXM  DB 10,13,"MATRIX MUL: ","$"
   
   ENTER    DB 10,13,"$"
   SPACE    DB " ","$"
     
DATA ENDS

CODE   SEGMENT  PARA  PUBLIC   'CODE'
   ASSUME   CS:CODE,  DS:DATA,   SS:STACK 
   INICIO:   
      MOV   AX,@DATA
      MOV   DS,AX
;------------------------------------------
;------------------------------------------
      MOV   DX,OFFSET MSJI
      MOV   AX,0900H
      INT   21H
      
      MOV   DX,OFFSET MS_MTX1
      MOV   AX,0900H
      INT   21H 
      MOV   DX,OFFSET ENTER
      MOV   AX,0900H
      INT   21H     
      MOV   BX,0
      MOV   SI,0
      MOV   CX,4
   DATO_M1:
      PUSH  CX
      MOV   CX,4
      IN_M1:
         MOV   AH,01H   ;INGRESO DE DATOS PARA LA PRIMERA MATRIZ
         INT   21H
         SUB   AL,30H
         MOV   MATRIZ1[BX+SI],AL
         MOV   DX,OFFSET SPACE
         MOV   AX,0900H
         INT   21H
         INC   SI
      LOOP  IN_M1
      MOV   DX,OFFSET ENTER
      MOV   AX,0900H
      INT   21H
      POP   CX
   LOOP  DATO_M1
;------------------------------------------      
      MOV   DX,OFFSET MS_MTX2
      MOV   AX,0900H
      INT   21H 
      MOV   DX,OFFSET ENTER
      MOV   AX,0900H
      INT   21H     
      MOV   BX,0
      MOV   SI,0
      MOV   CX,4
   DATO_M2:
      PUSH  CX
      MOV   CX,4
      IN_M2:
         MOV   AH,01H
         INT   21H
         SUB   AL,30H
         MOV   MATRIZ2[BX+SI],AL
         MOV   DX,OFFSET SPACE
         MOV   AX,0900H
         INT   21H
         INC   SI
      LOOP  IN_M2
      MOV   DX,OFFSET ENTER
      MOV   AX,0900H
      INT   21H
      POP   CX
   LOOP  DATO_M2
;------------------------------------------
      MOV   DX,OFFSET MS_MTXS
      MOV   AX,0900H
      INT   21H 
      MOV   DX,OFFSET ENTER
      MOV   AX,0900H
      INT   21H     
      MOV   BX,0
      MOV   SI,0
      MOV   CX,4
   DATO_MS:
      PUSH  CX
      MOV   CX,4
      IN_MS:
         MOV   AL,MATRIZ1[BX+SI]
         ADD   AL,MATRIZ2[BX+SI]
         MOV   MATRIZS[BX+SI],AL
         ADD   AL,30h
         MOV   DL,AL
         MOV   AX,0200H
         INT   21H
         MOV   DX,OFFSET SPACE
         MOV   AX,0900H
         INT   21H
         INC   SI
      LOOP  IN_MS
      MOV   DX,OFFSET ENTER
      MOV   AX,0900H
      INT   21H
      POP   CX
   LOOP  DATO_MS
;------------------------------------------
      MOV   DX,OFFSET MS_MTXM
      MOV   AX,0900H
      INT   21H
      MOV   DX,OFFSET ENTER
      MOV   AX,0900H
      INT   21H
      
      MOV   BX,0
      MOV   CX,4
      MOV   INCRE,0
   LABEL2:
      PUSH  CX
      
      MOV   CX,4
      LABEL1:
         MOV   SI,0
         CALL  TERM
         MOV   TEMP[SI],AL
         
         INC   SI
         CALL  TERM
         MOV   TEMP[SI],AL 
         
         INC   SI
         CALL  TERM
         MOV   TEMP[SI],AL
         
         INC   SI
         CALL  TERM
         MOV   TEMP[SI],AL
         
         CALL  GUARDAR
         
         INC   INCRE
      LOOP  LABEL1
      MOV   DX,OFFSET ENTER
      MOV   AX,0900H
      INT   21H
      POP   CX 
      ADD   BX,4
      MOV   INCRE,0
   LOOP  LABEL2      
;------------------------------------------
;------------------------------------------      
      MOV   AH,4CH
      INT   21H

TERM  PROC  NEAR
   PUSH  SI
   PUSH  BX
   MOV   AX,SI
   MOV   BX,4
   MUL   BX
   ADD   AL,INCRE
   MOV   SI,AX
   POP   BX
   MOV   AL,MATRIZ2[SI]
   POP   SI
   MUL   MATRIZ1[BX+SI]
   RET
TERM  ENDP

GUARDAR  PROC  NEAR
   PUSH  BX
   MOV   BL,PUNTERO
   MOV   AL,TEMP[0]
   ADD   AL,TEMP[1]
   ADD   AL,TEMP[2]
   ADD   AL,TEMP[3]
   MOV   MATRIZM[BX],AL
         ADD   AL,30h
         MOV   DL,AL
         MOV   AX,0200H
         INT   21H
         MOV   DX,OFFSET SPACE
         MOV   AX,0900H
         INT   21H
   INC   PUNTERO
   POP   BX
   RET
GUARDAR  ENDP   

CODE   ENDS
END INICIO