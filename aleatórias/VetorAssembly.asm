.data

#0X10010000
.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
main:	addi $8, $0, 0
	addi $9, $0, 10
	lui $25, 0x1001
	
for1:	beq $8, $9 fim
	
	lw $4, 0($25)
	addi $2, $0, 1
	syscall
	
	addi $4, $0,10
	addi $2, $0, 11
	syscall
	
	addi $25, $25, 4
	
	addi $8, $8, 1
	j for1
	
fim:	addi $2, $0, 10
	syscall
