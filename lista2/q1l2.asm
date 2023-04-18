.text

main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	
	slt $9, $8, $2 # se 8 for menor que 2: 9 = 1, senao 9 = 0
	addi $10, $0, 1
	
	beq $10, $9, maior2
	beq $0, $9, maior8
	
maior2: add $4, $2, $0
      add $2, $0, 1
      syscall
      add $2, $0, 10
      syscall
	
maior8: add $4, $8, $0
      add $2, $0, 1
      syscall
      add $2, $0, 10
      syscall