.text

main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	addi $2, $0, 5
	syscall
	add $10, $0, $2
	
	addi $11, $0, 1
	addi $12,  $0, 2
	addi $13, $0, 3
	addi $14, $0, 6
	
	mul $8, $8, $11
	mul $9, $9, $12
	mul $10, $10, $13
	
	add $15, $9, $10
	add $15, $15, $8
	
	div $15, $14
	
	mflo $14
	addi $16, $0, 60
	slt $17, $16, $14	#se 60 < media, retorna 1, se não 0
	addi $18, $0, 1
	
	beq $17, $18, aprovado
	beq $17, $0, reprovado
	
aprovado: add $4, $0, $14
	  addi $2, $0, 1
	  syscall
	  addi $4, $0, 44
	  addi $2, $0, 11
	  syscall	#imprime a vírgula
	 
	  mfhi $11	#move para o $11 o resto
	  addi $12, $0, 10 #adiciona 10 ao reg $12
	  mul $13, $11, $12 #multiplica o resto por 10
	  div $13, $9	  #divide por 2 o novo valor
	  mflo $4	  #move o resultado para o 4
	  addi $2, $0, 1	
	  syscall	  #imprime a parte decimal
	  addi $4, $0, 32
	  addi $2, $0, 11
	  syscall
	  addi $4, $0, 65
	  addi $2, $0, 11
	  syscall
	  addi $2, $0, 10
	  syscall
	  
reprovado:add $4, $0, $14
	  addi $2, $0, 1
	  syscall
	  addi $4, $0, 44
	  addi $2, $0, 11
	  syscall	#imprime a vírgula
	 
	  mfhi $11	#move para o $11 o resto
	  addi $12, $0, 10 #adiciona 10 ao reg $12
	  mul $13, $11, $12 #multiplica o resto por 10
	  div $13, $9	  #divide por 2 o novo valor
	  mflo $4	  #move o resultado para o 4
	  addi $2, $0, 1	
	  syscall	  #imprime a parte decimal
	  addi $4, $0, 32
	  addi $2, $0, 11
	  syscall
	  addi $4, $0, 82
	  addi $2, $0, 11
	  syscall
	  addi $2, $0, 10
	  syscall
