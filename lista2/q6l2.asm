.text

main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	addi $10, $0, 64
	addi $11, $0, 49
	addi $15, $0, 59
	addi $16, $0, 34
	
	addi $12, $0, 1
	slt $13, $10, $8
	slt $14, $11, $9
	slt $17, $15, $8
	slt $18, $16, $9
	
	beq $13, $12, sim
	beq $14, $12, sim
	and $19, $18, $17
	beq $19, $12, sim


nao: 	addi $4, $0, 78
	addi $2, $0, 11
	syscall
	addi $2, $0, 10
	syscall	

sim: 	addi $4, $0, 83
	addi $2, $0, 11
	syscall
	addi $2, $0, 10
	syscall
