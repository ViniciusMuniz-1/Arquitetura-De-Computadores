.text

main:	addi $2, $0, 5
	syscall
	add $8, $0, 4
	div $2, $8
	mfhi $9
	beq $0, $9, sim
	
teste2:	addi $10, $0, 400
	div $2, $10
	mfhi $11
	beq $0, $11, sim

nao:	addi $4, $0, 'N'
	addi $2, $0, 11
	syscall
	j fim
	
sim:	addi $4, $0, 'S'
	addi $2, $0, 11
	syscall
	j fim

fim:	addi $2, $0, 10
	syscall