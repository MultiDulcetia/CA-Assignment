         MOV     R1,#0x5000 ; initialize Register 1 with memory address 0x5000
         MOV     R0, #0x6 ; Storing 6 into R0
         STRB    R0,[R1],#1 ; Storing R0 into R1 and adding 1
         MOV     R0,#0x5
         STRB    R0,[R1],#1
         MOV     R0,#0x1
         STRB    R0,[R1],#1
         MOV     R0,#0x6
         STRB    R0,[R1],#1
         MOV     R0,#0x3
         STRB    R0,[R1],#1
         MOV     R0,#0x5
         STRB    R0,[R1]

         MOV     R1,#0x5000 ; Reinitializing R1 with memory address 0x5000

         MOV     R2, #0x6000 ; Initializing R2 with memory address 0x6000
         LDRB    R3, [R1], #1 ; Loading R1 into R3 and adding 1
         ADD     R0, R0, R3 ; R0 + R3 and placing it in R0
         MOV     R4, #0x4 ; We initialize R4 with 4 as a loop counter

SUM_LOOP ;       Creating Loop to add all the numbers together
         LDRB    R3, [R1], #1 ; Load R1 into R3 and add 1
         ADD     R0, R0, R3 ; R0 + R3 and placing it into R0
         SUB     R4, R4, #1 ; Subtract 1 from R4 (loop counter)
         CMP     R4, #0 ; Comparing R4 with 0
         BNE     SUM_LOOP ; Loop again if R4 does not equal 0

         STRB    R0, [R2] ; Storing the value from R0 into R2
         END