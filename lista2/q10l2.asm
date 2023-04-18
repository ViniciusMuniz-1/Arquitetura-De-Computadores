main:	addi $2 $0 5
	syscall
	add $8 $0 $2
	addi $2 $0 5
	syscall
	add $9 $0 $2
	addi $2 $0 5
	syscall
	add $10 $0 $2
	add $4 $8 $9
	add $4 $4 $10
	addi $11 $0 3
	div $4 $11
	mflo $4
	mfhi $12
	addi $11 $0 1
	slt $13 $11 $12
	add $4 $4 $13
	addi $2 $0 1
	syscall
	add $4 $0 ','
	addi $2 $0 11
	syscall
	add $4 $0 $0
	addi $2 $0 1
	syscall
fim:	addi $2 $0 10
	syscall