//Student Name: Dave Nguyen
//Student ID: 104697710
//Assignment-2/Matchstick Game
      MOV R2,#msg8      //printing all messages
      MOV R3,#myName
      MOV R4,#num
      MOV R5,#msg4
      MOV R6,#msg11
      MOV R7,#ans
      MOV R9,#num
// --main--
// the Matchsticks input
      STR R2, .WriteString 
      MOV R2,#msg1
      STR R2, .WriteString
      STR R3, .ReadString 
NumInput:
      MOV R2,#msg2
      STR R2, .WriteString
      LDR R4, .InputNum
      CMP R4, #5
      BLT NumInput
      CMP R4, #100
      BGT NumInput
      MOV R6, R4
Game:
      MOV R2, #msg8
      STR R2, .WriteString
      MOV R4, R6
// --players will be asked to remove the matchsticks--
HumanRemoveLoop: 
      MOV R2,#msg3
      STR R2, .WriteString
      STR R3, .WriteString
      MOV R5,#msg4
      STR R5, .WriteString
      STR R4, .WriteSignedNum
      MOV R5,#msg5
      STR R5, .WriteString
      STR R2, .WriteString 
      STR R3, .WriteString 
      MOV R2,#msg6
      STR R2, .WriteString 
      LDR R9, .InputNum
      CMP R9, #1
      BLT HumanRemoveLoop
      CMP R9, #3
      BGT HumanRemoveLoop
      CMP R9, R4
      BGT HumanRemoveLoop
      STR R9, .WriteSignedNum
      SUB R4, R4, R9
      CMP R4, #0
      BEQ Draw
      CMP R4, #1
      BEQ HumanWin
// --machine will removes the matchsticks randomly--
ComputerRemoveLoop:
      LDR R9, .Random
      AND R9, R9, #3
      CMP R9, #1
      BLT ComputerRemoveLoop
      MOV R2,#msg11
      STR R2, .WriteString 
      STR R9, .WriteSignedNum
      SUB R4, R4, R9
      CMP R4, #1
      BEQ ComputerWin
      CMP R4, #0
      BEQ Draw
      BGT HumanRemoveLoop
// --printing result--
HumanWin:
      MOV R2,#msg7 
      STR R2, .WriteString 
      B EndPart
ComputerWin:
      MOV R2,#msg10
      STR R2, .WriteString 
      B EndPart
Draw:
      MOV R2,#msg9
      STR R2, .WriteString 
// --rematch or not--
EndPart:
      MOV R2, #msg12
      STR R2, .WriteString
      MOV R7, #flag
      STR R7, .ReadString
      LDRB R7, [R7+#0]
      CMP R7, #121
      BEQ Game
      CMP R7, #110
      BNE EndPart
      HALT
// --end of the game--
myName: .BLOCK 128
flag: .BLOCK 128
num:  .Word
ans:  .Word
msg1: .ASCIZ "PLEASE ENTER YOUR NAME\n"
msg2: .ASCIZ "How many matchsticks (5-100)?\n"
msg3: .ASCIZ "\nPlayer "
msg4: .ASCIZ ", there are "
msg5: .ASCIZ "matchsticks remaining"
msg6: .ASCIZ ", how many do you want to remove (1-3)?\n"
msg7: .ASCIZ "\nYOU WIN!"
msg8: .ASCIZ "Let's play matchsticks with me!\n"
msg9: .ASCIZ "\nIt's a draw\n"
msg10: .ASCIZ "\nYOU LOSE!\n"
msg11: .ASCIZ "\nComputer Player's Turn\n"
msg12: .ASCIZ "\nPlay again (y/n)? \n"
