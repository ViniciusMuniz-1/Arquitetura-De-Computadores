.text

main:	addi $2, $0, 5
	syscall		#leitura da quantidade de linhas do tri�ngulo de Floyd
	
	add $20, $2, $0 #mandando o valor de linhas para o $20
	
	addi $8, $0, 1	#valor inicial do tri�ngulo
	addi $9, $0, 1	#coluna inicial para o valor 1
	
firstfor: beq $20, $0, fim
	  
	  addi $10, $0, 0 #Contador i
	  
for:	  beq $10, $9 quebradelinha #se o n�mero de valores for = quant de colunas da piramide, ent�o quebra a linha
	  add $4, $8, $0
	  addi $2, $0, 1	#imprimo o valor
	  syscall
	  
	  addi $4, $0, ' '
	  addi $2, $0, 11
	  syscall
	  
	  addi $8, $8, 1 #somando 1 ao valor inicial
	  addi $10, $10, 1 #incrementando o contador para verifica��o da coluna
	  j for
	  
quebradelinha:  addi $4, $0, 10
		addi $2, $0, 11
		syscall		#imprime quebra de linha
		
		addi $9, $9, 1 # aumentando o n�mero de colunas para a pr�xima linha
		addi $20, $20, -1 # diminuindo o valor de linhas existentes
		j firstfor
	  	
fim:	addi $2, $0, 10
	syscall
