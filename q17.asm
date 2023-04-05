.text

main:  addi $2, $0, 5
       syscall		#le o primeiro num
       add $8, $0, $2	#move o num1 para reg $8
       addi $2, $0, 5
       syscall		#le o segundo num
       addi $9, $0, 2   #adiciona 2 ao reg $8
       
sum:   add $10, $8, $2  #soma os 2 nums e adiciona o resul ao reg $10

div:   div $10, $9	#divide o resultado por 2

imprime: mflo $4	#move a parte inteira para o 4
	 addi $2, $0, 1	
	 syscall	#imprime a parte inteira
	 
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
	 
fim:     addi $2, $0, 10
	 syscall