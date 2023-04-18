.text

main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	slt $10, $8, $9	#se 8 < 9 então 10 = 1; se 9 < 8 então 10 = 0
	addi $11, $0, 1	#adição de 1 no reg 10 para verificação no beq
	
	beq $8, $9,  igual
	beq $10, $11, maiornum2
	beq $10, $0,  maiornum1
	
maiornum2: add $4, $0, $8
	   addi $2, $0, 1
	   syscall
	   addi $4, $0, 60
	   addi $2, $0, 11
	   syscall
	   add $4, $0, $9
	   addi $2, $0, 1
	   syscall
	   addi $2, $0, 10
	   syscall
	   
maiornum1: add $4, $0, $8
	   addi $2, $0, 1
	   syscall
	   addi $4, $0, 62
	   addi $2, $0, 11
	   syscall
	   add $4, $0, $9
	   addi $2, $0, 1
	   syscall
	   addi $2, $0, 10
	   syscall
	   
igual:     add $4, $0, $8
	   addi $2, $0, 1
	   syscall
	   addi $4, $0, 61
	   addi $2, $0, 11
	   syscall
	   add $4, $0, $9
	   addi $2, $0, 1
	   syscall
	   addi $2, $0, 10
	   syscall