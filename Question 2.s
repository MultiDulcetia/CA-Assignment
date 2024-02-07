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

               MOV     R2, #6 ; user input

               MOV     R4, #0x0 ; Initializing R4 with 0

               MOV     R5, #6 ; Initializing loop counter with 6

               MOV     R8, #0x0 ; results

match          
               LDRB    R6, [R1], #1 ; Loading R1's value into R6 and incrementing by 1
               CMP     R6, R2 ; comparing R6 with User Input
               BNE     does_not_match ; branch if R6 does not equal to R2
               ADD     R4, R4, #1 ; Adding 1 because user input matches with value
               MOV     R3 , #0x6100 ; initializing R3 with memory address #0x6100
               MOV     R8, #0xA ; initializing R8 with value A (in hex)
               STRB    R8 , [R3] ; Storing results in R3's memory address
               ADD     R7, R7, #1 ; Adding 1 because user input matches with value (counting the number of matches)

does_not_match 
               SUB     R5, R5, #1 ; Decrementing loop counter by 1
               CMP     R5, #0 ; comparing loop counter with 0
               BNE     match ; looping back to match to continue looping through the values
               CMP     R4 , #0 ; comparing R4 with 0, if R4 > 0, means there's a match
               BGT     the_end ; branch if R4 is greater than 0, if R4 < 0, means there's no match
               MOV     R3, #0x6200 ; initializing R3 with memory address #0x6200
               MOV     R8, #0xB ; initializing R8 with value B (in hex)
               STRB    R8 , [R3] ; Storing results in R3's memory address

the_end        
               MOV     R3, #0x6300 ; Initializing R3 with memory address #0x6300
               STRB    R7, [R3] ; storing the amount of matches in R3

; R0 = Value
; R1 = Memory Address of Values
; R2 = User Input
; R3 = Memory Address of Resuls (#0x6100, #0x6200, #0x6300)
; R4 = if there's a match
; R5 = Loop Counter
; R6 = new value
; R7 = Counting the amount of matches
; R8 = Storing results in R3's memory address