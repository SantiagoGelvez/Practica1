                            ;  PROGRAMA N°1: OPERACION MATEMATICA CON 6 OPERANDOS

;  AUTORES: MARIA CAMILA CEPEDA SAENZ        201111157
;           SANTIAGO ANDRES GELVEZ CAMARGO   201111163

;  FECHA DE CREACION:   MARZO 14, 2017

STACK SEGMENT  PARA  PUBLIC   'STACK'
   DB 64 DUP('STACK')
STACK ENDS

DATA  SEGMENT  PARA  PUBLIC   'DATA'
   Var1  DB 3  DUP(?)
   Var2  DB 3  DUP(?)
   Var3  DB 3  DUP(?)
   Var4  DB 3  DUP(?)
   Var5  DB 3  DUP(?)
   Var6  DB 3  DUP(?)
   
   Cen1  DB 1  DUP(?)
   Dec1  DB 1  DUP(?)
   Num1  DB 1  DUP(?)
       
   Cen2  DB 1  DUP(?)
   Dec2  DB 1  DUP(?)
   Num2  DB 1  DUP(?)
   
   Cen3  DB 1  DUP(?)
   Dec3  DB 1  DUP(?)
   Num3  DB 1  DUP(?)
   
   Cen4  DB 1  DUP(?)
   Dec4  DB 1  DUP(?)
   Num4  DB 1  DUP(?)
   
   Cen5  DB 1  DUP(?)
   Dec5  DB 1  DUP(?)
   Num5  DB 1  DUP(?)
   
   Cen6  DB 1  DUP(?)
   Dec6  DB 1  DUP(?)
   Num6  DB 1  DUP(?)
   
   OP1   DB 1  DUP(?)
   OP2   DB 1  DUP(?)
   OP3   DB 1  DUP(?)
   OP4   DB 1  DUP(?)
   RES   DB 1  DUP(?)
   
   AUX_CEN  DB 1  DUP(?)
   AUX_DEC  DB 1  DUP(?)
   AUX_UNI  DB 1  DUP(?)
   TEC   DB 1  DUP(?)
   
   MSJI  DB 9,9,"PROGRAMA OPERACION CON 6 NUMEROS",'$'
   MSJI2 DB 10,13,9,"La operaci",149,"n es (N",248,"1 + N",248,"2 - N",248,"3)*N",248,"4 - N",248,"5 + N",248,"6",'$'
   
   MSJ1  DB 10,13,"Numero 1: ",'$'
   MSJ2  DB 10,13,"Numero 2: ",'$'
   MSJ3  DB 10,13,"Numero 3: ",'$'
   MSJ4  DB 10,13,"Numero 4: ",'$'
   MSJ5  DB 10,13,"Numero 5: ",'$'
   MSJ6  DB 10,13,"Numero 6: ",'$'
   
   MSJE  DB 10,10,13,"TECLA ERRONEA",'$'
   
   RESUL DB 10,13,"Resultado: ",'$'
   ENT   DB 10,13,'$'
DATA  ENDS

CODE  SEGMENT  PARA  PUBLIC   'CODE'
   ASSUME   CS:CODE, DS:DATA, SS:STACK
   START:
      MOV   AX,@DATA
      MOV   DS,AX
      MOV   AH,09H
      MOV   DX,OFFSET MSJI
      INT   21H
      MOV   AH,09H
      MOV   DX,OFFSET MSJI2
      INT   21H
;------------------------------------------
;------------------------------------------
      INTENTO1:
         MOV   TEC,'V'
         MOV   AH,09H
         MOV   DX,OFFSET MSJ1
         INT   21H
         MOV   BX,OFFSET Var1
         MOV   CX,3
      ENTRADA1:
         MOV   AH,01H
         INT   21H
         CALL  LIMITE
         CMP   TEC,'V'
         JB INTENTO1
         SUB   AL,30H
         MOV   [BX],AL
         INC   BX
      LOOP  ENTRADA1
;------------------------------------------
      INTENTO2:
         MOV   TEC,'V'
         MOV   AH,09H
         MOV   DX,OFFSET MSJ2
         INT   21H
         MOV   BX,OFFSET Var2
         MOV   CX,3
      ENTRADA2:
         MOV   AH,01H
         INT   21H
         CALL  LIMITE
         CMP   TEC,'V'
         JB INTENTO2
         SUB   AL,30H
         MOV   [BX],AL
         INC   BX
      LOOP  ENTRADA2
;------------------------------------------
      INTENTO3:
         MOV   TEC,'V'
         MOV   AH,09H
         MOV   DX,OFFSET MSJ3
         INT   21H
         MOV   BX,OFFSET Var3
         MOV   CX,3
      ENTRADA3:
         MOV   AH,01H
         INT   21H
         CALL  LIMITE
         CMP   TEC,'V'
         JB INTENTO3
         SUB   AL,30H
         MOV   [BX],AL
         INC   BX
      LOOP  ENTRADA3
;------------------------------------------
      INTENTO4:
         MOV   TEC,'V'
         MOV   AH,09H
         MOV   DX,OFFSET MSJ4
         INT   21H
         MOV   BX,OFFSET Var4
         MOV   CX,3
      ENTRADA4:
         MOV   AH,01H
         INT   21H
         CALL  LIMITE
         CMP   TEC,'V'
         JB INTENTO4
         SUB   AL,30H
         MOV   [BX],AL
         INC   BX
      LOOP  ENTRADA4
;------------------------------------------
      INTENTO5:
         MOV   TEC,'V'
         MOV   AH,09H
         MOV   DX,OFFSET MSJ5
         INT   21H
         MOV   BX,OFFSET Var5
         MOV   CX,3
      ENTRADA5:
         MOV   AH,01H
         INT   21H
         CALL  LIMITE
         CMP   TEC,'V'
         JB INTENTO5
         SUB   AL,30H
         MOV   [BX],AL
         INC   BX
      LOOP  ENTRADA5
;------------------------------------------
      INTENTO6:
         MOV   TEC,'V'
         MOV   AH,09H
         MOV   DX,OFFSET MSJ6
         INT   21H
         MOV   BX,OFFSET Var6
         MOV   CX,3
      ENTRADA6:
         MOV   AH,01H
         INT   21H
         CALL  LIMITE
         CMP   TEC,'V'
         JB INTENTO6
         SUB   AL,30H
         MOV   [BX],AL
         INC   BX
      LOOP  ENTRADA6
;------------------------------------------
;------------------------------------------
      MOV   AL,Var1[0]
      MOV   BL,100
      MUL   BL
      MOV   Cen1,AL
      MOV   AL,Var1[1]
      MOV   BL,10
      MUL   BL
      MOV   Dec1,AL
      MOV   AL,Cen1
      ADD   AL,Dec1
      ADD   AL,Var1[2]
      MOV   Num1,AL
;------------------------------------------
      MOV   AL,Var2[0]
      MOV   BL,100
      MUL   BL
      MOV   Cen2,AL
      MOV   AL,Var2[1]
      MOV   BL,10
      MUL   BL
      MOV   Dec2,AL
      MOV   AL,Cen2
      ADD   AL,Dec2
      ADD   AL,Var2[2]
      MOV   Num2,AL    
;------------------------------------------
      MOV   AL,Var3[0]
      MOV   BL,100
      MUL   BL
      MOV   Cen3,AL
      MOV   AL,Var3[1]
      MOV   BL,10
      MUL   BL
      MOV   Dec3,AL
      MOV   AL,Cen3
      ADD   AL,Dec3
      ADD   AL,Var3[2]
      MOV   Num3,AL
;------------------------------------------
      MOV   AL,Var4[0]
      MOV   BL,100
      MUL   BL
      MOV   Cen4,AL
      MOV   AL,Var4[1]
      MOV   BL,10
      MUL   BL
      MOV   Dec4,AL
      MOV   AL,Cen4
      ADD   AL,Dec4
      ADD   AL,Var4[2]
      MOV   Num4,AL    
;------------------------------------------
      MOV   AL,Var5[0]
      MOV   BL,100
      MUL   BL
      MOV   Cen5,AL
      MOV   AL,Var5[1]
      MOV   BL,10
      MUL   BL
      MOV   Dec5,AL
      MOV   AL,Cen5
      ADD   AL,Dec5
      ADD   AL,Var5[2]
      MOV   Num5,AL    
;------------------------------------------
      MOV   AL,Var6[0]
      MOV   BL,100
      MUL   BL
      MOV   Cen6,AL
      MOV   AL,Var6[1]
      MOV   BL,10
      MUL   BL
      MOV   Dec6,AL
      MOV   AL,Cen6
      ADD   AL,Dec6
      ADD   AL,Var6[2]
      MOV   Num6,AL    
;------------------------------------------
;------------------------------------------
      MOV   AL,Num1
      ADD   AL,Num2
      MOV   OP1,AL
      
      SUB   AL,Num3
      MOV   OP2,AL
      
      MUL   Num4
      MOV   OP3,AL
      
      SUB   AL,Num5
      MOV   OP4,AL
      
      ADD   AL,Num6
      MOV   RES,AL
      
      AAM
      MOV   AUX_UNI,AL
      MOV   AL,AH
      AAM
      MOV   AUX_DEC,AL
      MOV   AUX_CEN,AH
      
      MOV   BX,0000H
      MOV   DX,0000H
      
      MOV   AH,09H
      MOV   DX,OFFSET ENT
      INT   21H
      MOV   AH,09H
      MOV   DX,OFFSET RESUL
      INT   21H
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
;--------------------------------------------
;--------------------------------------------
      MOV   AX,4C00H
      INT   21H
   LIMITE PROC NEAR
      PUSHA
      CMP AL,30H
      JB LABEL1 
      CMP AL,3AH
      JAE LABEL1
      JMP LABEL2
      LABEL1:
         MOV AH,09H
         MOV DX,OFFSET MSJE
         INT 21H
         MOV TEC,'I'
      LABEL2:
         POPA
         RET
   LIMITE  ENDP
   END START
CODE  ENDS