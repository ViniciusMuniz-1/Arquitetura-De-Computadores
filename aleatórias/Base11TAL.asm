.text

main:	addi $2, $0, 5
	syscall		#lendo o número
	
	addi $25, $0, 11 #armazenando para divisão
	
div:	div $2, $25	#primeira divisão
	mfhi $8		#move o resto da divisão para o $8
	mflo $2		#move o quociente para o $2
	
	div $2, $25	#segunda divisão
	mfhi $9		#move o resto da divisão para o $9
	mflo $10	#move o quociente da divisão para o reg 9
	#Temos a partir daqui o menos significativo
	#no $8 e o mais significativo no $10
	
verificacao: addi $24, $0, 10 #adição para verificação
	   
	   beq $24, $10, imprimirA1 #se o número for = 10, então ele precisa imprimir A
	   j imprimirnormal1	    #senão ele imprime normal
	   
imprimirA1: addi $4, $0, 'A'
	    addi $2, $0, 11
	    syscall
	    j verificacao2
	    
imprimirnormal1: add $4, $0, $10
		 addi $2, $0, 1
		 syscall
		 
verificacao2: beq $24, $9, imprimirA2
	    j imprimirnormal2
	    
imprimirA2: addi $4, $0, 'A'
	    addi $2, $0, 11
	    syscall
	    j verificacao3
	    
imprimirnormal2: add $4, $0, $9
		 addi $2, $0, 1
		 syscall
		 
verificacao3:	beq $24, $8, imprimirA3
		j imprimirnormal3

imprimirA3: 	addi $4, $0, 'A'
	    	addi $2, $0, 11
	    	syscall
	    	j fim
	    	
imprimirnormal3: add $4, $0, $8
		 addi $2, $0, 1
		 syscall
		 
fim:		addi $2, $0, 10
		syscall
