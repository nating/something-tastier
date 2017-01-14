	AREA	TastierProject, CODE, READONLY

    IMPORT  TastierDiv
	IMPORT	TastierMod
	IMPORT	TastierReadInt
	IMPORT	TastierPrintInt
	IMPORT	TastierPrintIntLf
	IMPORT	TastierPrintTrue
	IMPORT	TastierPrintTrueLf
	IMPORT	TastierPrintFalse
    IMPORT	TastierPrintFalseLf
    IMPORT  TastierPrintString
    
; Entry point called from C runtime __main
	EXPORT	main

; Preserve 8-byte stack alignment for external routines
	PRESERVE8

; Register names
BP  RN 10	; pointer to stack base
TOP RN 11	; pointer to top of stack

main
; Initialization
	LDR		R4, =globals
	LDR 	BP, =stack		; address of stack base
	LDR 	TOP, =stack+16	; address of top of stack frame
	B		Main
    MOVS    R6, #0          ; false
    ADD     R2, BP, #16
    LDR     R1, =2
    ADD     R2, R2, R1, LSL #2
    STR     R6, [R2]        ; notTrue
    LDR     R6, =9
    ADD     R2, BP, #16
    LDR     R1, =3
    ADD     R2, R2, R1, LSL #2
    STR     R6, [R2]        ; nine
; Procedure myFunction
myFunctionBody
    LDR     R7, =0
    ADD     R2, BP, #16
    LDR     R1, =6
    ADD     R2, R2, R1, LSL #2
    STR     R7, [R2]        ; forResult
    LDR     R7, =4
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    LDR     R6, [R2]        ; a
    MOV     R2, R6
    STR     R7, [R2]        ; a
    LDR     R7, =4
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    LDR     R6, [R2]        ; b
    MOV     R2, R6
    STR     R7, [R2]        ; b
    LDR     R7, =4
    LDR     R2, =1
    STR     R7, [R4, R2, LSL #2] ; globalB
    ADD     R2, BP, #16
    LDR     R1, =2
    ADD     R2, R2, R1, LSL #2
    LDR     R7, [R2]        ; notTrue
    MOVS    R7, R7          ; reset Z flag in CPSR
    BEQ     L1              ; jump on condition false
    LDR     R5, =2
    ADD     R2, BP, #16
    LDR     R1, =4
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2]        ; test
    B       L2
L1
    LDR     R5, =1
    ADD     R2, BP, #16
    LDR     R1, =4
    ADD     R2, R2, R1, LSL #2
    STR     R5, [R2]        ; test
L2
    LDR     R9, =0
    ADD     R2, BP, #16
    LDR     R1, =5
    ADD     R2, R2, R1, LSL #2
    STR     R9, [R2]        ; k
L3
    ADD     R2, BP, #16
    LDR     R1, =5
    ADD     R2, R2, R1, LSL #2
    LDR     R5, [R2]        ; k
    LDR     R6, =10
    CMP     R5, R6
    MOVLT   R5, #1
    MOVGE   R5, #0
    MOVS    R5, R5          ; reset Z flag in CPSR
    BEQ     L6              ; jump on condition false
    BNE     L4              ; jump on condition true
L5
    ADD     R2, BP, #16
    LDR     R1, =5
    ADD     R2, R2, R1, LSL #2
    LDR     R7, [R2]        ; k
    LDR     R8, =1
    ADD     R7, R7, R8
    ADD     R2, BP, #16
    LDR     R1, =5
    ADD     R2, R2, R1, LSL #2
    STR     R7, [R2]        ; k
    B       L3
L4
    ADD     R2, BP, #16
    LDR     R1, =6
    ADD     R2, R2, R1, LSL #2
    LDR     R7, [R2]        ; forResult
    LDR     R8, =1
    ADD     R7, R7, R8
    ADD     R2, BP, #16
    LDR     R1, =6
    ADD     R2, R2, R1, LSL #2
    STR     R7, [R2]        ; forResult
    B       L5
L6
    LDR     R2, =0
    LDR     R7, [R4, R2, LSL #2] ; globalA
    LDR     R5, =1
    CMP     R5, R7
    MOVEQ   R5, #1
    MOVNE   R5, #0
    MOVS    R5, R5          ; reset Z flag in CPSR
    BEQ     L7              ; jump on condition false
    LDR     R7, =0
    ADD     R2, BP, #16
    LDR     R1, =7
    ADD     R2, R2, R1, LSL #2
    STR     R7, [R2]        ; switchResult
    B       L8
L7
    LDR     R5, =2
    CMP     R5, R7
    MOVEQ   R5, #1
    MOVNE   R5, #0
    MOVS    R5, R5          ; reset Z flag in CPSR
    BEQ     L9              ; jump on condition false
    LDR     R7, =0
    ADD     R2, BP, #16
    LDR     R1, =7
    ADD     R2, R2, R1, LSL #2
    STR     R7, [R2]        ; switchResult
    B       L8
L9
    LDR     R5, =3
    CMP     R5, R7
    MOVEQ   R5, #1
    MOVNE   R5, #0
    MOVS    R5, R5          ; reset Z flag in CPSR
    BEQ     L10              ; jump on condition false
    LDR     R7, =0
    ADD     R2, BP, #16
    LDR     R1, =7
    ADD     R2, R2, R1, LSL #2
    STR     R7, [R2]        ; switchResult
    B       L8
L10
    LDR     R5, =4
    CMP     R5, R7
    MOVEQ   R5, #1
    MOVNE   R5, #0
    MOVS    R5, R5          ; reset Z flag in CPSR
    BEQ     L11              ; jump on condition false
    LDR     R7, =1
    ADD     R2, BP, #16
    LDR     R1, =7
    ADD     R2, R2, R1, LSL #2
    STR     R7, [R2]        ; switchResult
    B       L8
L11
L8
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L12
    DCB     "test         = ", 0
    ALIGN
L12
    ADD     R2, BP, #16
    LDR     R1, =4
    ADD     R2, R2, R1, LSL #2
    LDR     R9, [R2]        ; test
    MOV     R0, R9
    BL      TastierPrintIntLf
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L13
    DCB     "k            = ", 0
    ALIGN
L13
    ADD     R2, BP, #16
    LDR     R1, =5
    ADD     R2, R2, R1, LSL #2
    LDR     R9, [R2]        ; k
    MOV     R0, R9
    BL      TastierPrintIntLf
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L14
    DCB     "forResult    = ", 0
    ALIGN
L14
    ADD     R2, BP, #16
    LDR     R1, =6
    ADD     R2, R2, R1, LSL #2
    LDR     R9, [R2]        ; forResult
    MOV     R0, R9
    BL      TastierPrintIntLf
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L15
    DCB     "switchResult = ", 0
    ALIGN
L15
    ADD     R2, BP, #16
    LDR     R1, =7
    ADD     R2, R2, R1, LSL #2
    LDR     R9, [R2]        ; switchResult
    MOV     R0, R9
    BL      TastierPrintIntLf
    MOV     TOP, BP         ; reset top of stack
    LDR     BP, [TOP,#12]   ; and stack base pointers
    LDR     PC, [TOP]       ; return from myFunction
myFunction
    LDR     R0, =1          ; current lexic level
    LDR     R1, =9          ; number of local variables
    BL      enter           ; build new stack frame
    B       myFunctionBody
;a is a local variable of type integer at address 0.
;b is a local variable of type integer at address 1.
;notTrue is a local constant of type boolean at address 2.
;nine is a local constant of type integer at address 3.
;arrayOfSizeThree is a local array.
;test is a local variable of type integer at address 4.
;k is a local variable of type integer at address 5.
;forResult is a local variable of type integer at address 6.
;switchResult is a local variable of type integer at address 7.
;t is a local variable of type integer at address 8.
    MOVS    R6, #1          ; true
    ADD     R2, BP, #16
    LDR     R1, =0
    ADD     R2, R2, R1, LSL #2
    STR     R6, [R2]        ; poopoo
MainBody
    LDR     R7, =1
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    STR     R7, [R2]        ; x
    LDR     R7, =2
    LDR     R2, =0
    STR     R7, [R4, R2, LSL #2] ; globalA
    LDR     R7, =3
    LDR     R2, =1
    STR     R7, [R4, R2, LSL #2] ; globalB
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    MOV     R7, R2
    MOV     R2, R11
    LDR     R8, =4
    STR     R7, [R2, R8, LSL #2] ; value of x[]
    LDR     R2, =0
    ADD     R2, R2, R2
    ADD     R2, R2, R2
    ADD     R2, R2, R4
    MOV     R7, R2
    MOV     R2, R11
    LDR     R8, =5
    STR     R7, [R2, R8, LSL #2] ; value of globalA[]
    ADD     R0, PC, #4      ; store return address
    STR     R0, [TOP]       ; in new stack frame
    B       myFunction
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L16
    DCB     "\n", 0
    ALIGN
L16
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L17
    DCB     "x        = ", 0
    ALIGN
L17
    ADD     R2, BP, #16
    LDR     R1, =1
    ADD     R2, R2, R1, LSL #2
    LDR     R11, [R2]        ; x
    MOV     R0, R11
    BL      TastierPrintIntLf
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L18
    DCB     "globalA  = ", 0
    ALIGN
L18
    LDR     R2, =0
    LDR     R9, [R4, R2, LSL #2] ; globalA
    MOV     R0, R9
    BL      TastierPrintIntLf
    ADD     R0, PC, #4      ; string address
    BL      TastierPrintString
    B       L19
    DCB     "globalB  = ", 0
    ALIGN
L19
    LDR     R2, =1
    LDR     R9, [R4, R2, LSL #2] ; globalB
    MOV     R0, R9
    BL      TastierPrintIntLf
StopTest
    B       StopTest
Main
    LDR     R0, =1          ; current lexic level
    LDR     R1, =2          ; number of local variables
    BL      enter           ; build new stack frame
    B       MainBody
;poopoo is a local constant of type boolean at address 0.
;x is a local variable of type integer at address 1.
;globalA is a global variable of type integer at address 0.
;globalB is a global variable of type integer at address 1.
;myFunction is a global procedure.
;a is a local variable of type integer at address 0.
;b is a local variable of type integer at address 1.
;notTrue is a local constant of type boolean at address 2.
;nine is a local constant of type integer at address 3.
;arrayOfSizeThree is a local array.
;test is a local variable of type integer at address 4.
;k is a local variable of type integer at address 5.
;forResult is a local variable of type integer at address 6.
;switchResult is a local variable of type integer at address 7.
;t is a local variable of type integer at address 8.
;main is a global procedure.

; Subroutine enter
; Construct stack frame for procedure
; Input: R0 - lexic level (LL)
;		 R1 - number of local variables
; Output: new stack frame

enter
	STR		R0, [TOP,#4]			; set lexic level
	STR		BP, [TOP,#12]			; and dynamic link
	; if called procedure is at the same lexic level as
	; calling procedure then its static link is a copy of
	; the calling procedure's static link, otherwise called
 	; procedure's static link is a copy of the static link 
	; found LL delta levels down the static link chain
    LDR		R2, [BP,#4]				; check if called LL (R0) and
	SUBS	R0, R2					; calling LL (R2) are the same
	BGT		enter1
	LDR		R0, [BP,#8]				; store calling procedure's static
	STR		R0, [TOP,#8]			; link in called procedure's frame
	B		enter2
enter1
	MOV		R3, BP					; load current base pointer
	SUBS	R0, R0, #1				; and step down static link chain
    BEQ     enter2-4                ; until LL delta has been reduced
	LDR		R3, [R3,#8]				; to zero
	B		enter1+4				;
	STR		R3, [TOP,#8]			; store computed static link
enter2
	MOV		BP, TOP					; reset base and top registers to
	ADD		TOP, TOP, #16			; point to new stack frame adding
	ADD		TOP, TOP, R1, LSL #2	; four bytes per local variable
	BX		LR						; return
	
	AREA	Memory, DATA, READWRITE
globals     SPACE 4096
stack      	SPACE 16384

	END
