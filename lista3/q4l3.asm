.text

main:	addi $2, $0, 5
	syscall		#lendo o n�mero
	add $8, $2, 0	#criando contador
	
	
	addi $2, $0, 5
	syscall		#lendo outro n�mero
	addi $9, $2, 1  #adicionando para verifica��o
	
for:	beq $8, $9, fim #testando a condi��o: se cont = num+1 pare
	
	andi $10, $8, 1 #verificando se o n�mero � par; se $10 = 0 � par, se $10 = 1 � impar
	
	bne $10, $0, passa
	
	#IMPRIMINDO N�MERO E QUEBRA DE LINHA:
	add $4, $0, $8
	addi $2, $0, 1
	syscall
	addi $4, $0, 10
	addi $2, $0, 11
	syscall			
	
passa:	addi $8, $8, 1  #incrementando contador
	j for


fim:	addi $2, $0, 10
	syscall