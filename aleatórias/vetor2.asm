.data

#0X10010000
.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
main:	
	addi $8, $0, 0
	addi $9, $0, 10
	lui $25, 0x1001
	
for1:	beq $8, $9 fim
	

	addi $2, $0, 5
	syscall
	
	sw $2, 0($25)
	
	addi $25, $25, 4
	
	addi $8, $8, 1
	j for1
	
fim:	addi $2, $0, 10
	syscall
