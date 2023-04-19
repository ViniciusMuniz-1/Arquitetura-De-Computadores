.text
#Escreva um código que leia um número decimal de 0 até 999 e transforme-o em um sistema de base 11
main:		addi $2, $0, 5
		syscall
		add $8, $0, $2
		addi $9, $0, 11
	
decompondo: 	div $8, $9
	    	mfhi $11		#bit menos significativo para $11
	    	mflo $8
	    
	   	div $8, $9
	   	mfhi $10		#bit meio $10
	   	mflo $9			#bit mais significativo para $9
	    
	    
	    	addi $25, $0, 10	#adição para verificação
	    
impressao1: 	beq $25, $9, imprimirA	#se $9 for = 10, então vai imprimir A
		j impressaonormal	#
	   
imprimirA:  	addi $4, $0, 'A'	#imprime A
	    	addi $2, $0, 11
	   	syscall
	    	j impressao2		#salta para próxima impressão
	    
impressaonormal:add $4, $0, $9
		addi $2, $0, 1
		syscall

impressao2:	beq $25, $10, imprimirA2
		j impressaonormal2
	
imprimirA2:  	addi $4, $0, 'A'
	    	addi $2, $0, 11
	    	syscall
	   	j impressao3
	    
impressaonormal2:add $4, $0, $10
		 addi $2, $0, 1
		 syscall
		  
impressao3:	 beq $25, $11, imprimirA3
		 j impressaonormal3
	
imprimirA3:	 addi $4, $0, 'A'
	    	 addi $2, $0, 11
	    	 syscall
	    	 j fim
	    
impressaonormal3:add $4, $0, $11
		 addi $2, $0, 1
		 syscall
		  
fim:		addi $2, $0, 10
		syscall
