             MOV     R1, #0x5000 ; initialize Register 1 with memory address 0x5000
             MOV     R0, #0x6 ; Storing 6 into R0
             STRB    R0,[R1],#1 ; Storing R1 into R0 and increment by 1
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

             MOV     R1, #0x5000 ; Reinitializing R1 with memory address 0x5000

             MOV     R2, #0x6000 ; Initializing R2 with memory address 0x6000
             LDRB    R3, [R1], #1 ; Loading R1 into R3 and adding 1
             ADD     R0, R0, R3 ; R0 + R3 and placing it in R0
             MOV     R4, #0x4 ; We initialize R4 with 4 as a loop counter

SUM_LOOP     ;       Creating Loop to add all the numbers together
             LDRB    R3, [R1], #1 ; Load R1 into R3 and add 1
             ADD     R0, R0, R3 ; R0 + R3 and placing it into R0
             SUB     R4, R4, #1 ; Subtract 1 from R4 (loop counter)
             CMP     R4, #0 ; Comparing R4 with 0
             BNE     SUM_LOOP ; Loop again if R4 does not equal 0

             STRB    R0, [R2] ; Storing the value from R0 into R2


             MOV     R1, #0x5000 ; Re-initialize R1
             MOV     R4, #5 ; Reset loop counter to 5


MAXIMUM_LOOP ;       Creating loop to find the max
             LDRB    R5, [R1], #1 ; Load R1's value into R5
             CMP     R5, R6 ; Comparing R5 (new value) and R6 (old value)
             BLT     MAXIMUM ; Branch to MAXIMUM if R5 is less than R6
             MOV     R6, R5 ; Move R5 (new value) into R6 (old value) so that we can compare next value with the current value

MAXIMUM      
             SUB     R4, R4, #1 ; decrement loop counter by 1
             CMP     R4, #0 ; compare loop counter with 0
             BNE     MAXIMUM_LOOP ; branch back to loop if loop counter does not equal to 0
             STRB    R6, [R2, #4] ; we store the value from r6 into memory address #0x6004


             MOV     R1, #0x5000 ; re-initialize R1
             MOV     R4, #5 ; reset loop counter to 5
             MOV     R8, #10 ; initialize R8 with immediate value 10 first so that we can compare and BGT later on


MINIMUM_LOOP ;       Creating loop to find the min
             LDRB    R7, [R1], #1 ; load R1's value into R7
             CMP     R7, R8 ; comparing R7 (new value) with R8 (old value)
             BGT     MINIMUM ; branch to MINIMUM if R7 is greater than R8
             MOV     R8, R7 ; move R7 (new value) into R8 (old value) so that we can compare next value with the current value

MINIMUM      
             SUB     R4, R4, #1 ; decrement loop counter by 1
             CMP     R4, #0 ; compare loop counter with 0
             BNE     MINIMUM_LOOP ; branch back to MINIMUM_LOOP if loop counter is not 0
             STRB    R8, [R2, #8] ; store R8's value into memory address 0x6008


             END

             ;       R0 = value
             ;       R1 = Memory Location of value (r0)
             ;       R2 = Memory Location of SUM, MIN, and MAX
             ;       R3 = Used by SUM to add all the values together
             ;       R4 = loop counter
             ;       R5 = used by MAX to load new value
             ;       R6 = used by MAX to store old value so that we can compare with new value
             ;       R7 = used by MIN to load new value
             ;       R8 = used by MIN to store old value so that we can compare with new value

             ;       NOTE = if we do not set R8 with a high value, then the CMP and BGT won't work because R8 will always start off as 0
             ;       and when we compare any value with R8, because R8 is 0, it'll always branch to MINIMUM and skip moving R7's value into R8
             ;       so, I've initialize R8 with immediate value 10 to fix the issue