.data
#0x10010000
.word 0,0,0,0,0,0,0,0,0,0

.text
main: addi $8, $0, 0
      addi $9, $0, 10
      lui $25, 0x1001
for0: beq $8, $9, sai0

     
      addi $2, $0, 5
      syscall
      sw $2, 0($25)
     
      addi $25, $25, 4
 
      addi $8, $8, 1
      j for0
sai0:
#----------------------------------
      addi $8, $0, 0
      addi $9, $0, 10
      addi $25, $25, -4
for1: beq $8, $9, sai

      lw $4, 0($25)
      addi $2, $0, 1
      syscall
     
      addi $4, $0, 10
      addi $2, $0, 11
      syscall
     
      addi $25, $25, -4
 
      addi $8, $8, 1
      j for1
sai:  addi $2, $0, 10
      syscall