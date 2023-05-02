.text

main:	addi $2, $0, 5
	syscall		#lendo o número
	add $8, $2, 0	#criando contador
	
	
	addi $2, $0, 5
	syscall		#lendo outro número
	addi $9, $2, 1  #adicionando para verificação
	
for:	beq $8, $9, fim #testando a condição: se cont = num+1 pare
	
	andi $10, $8, 1 #verificando se o número é par; se $10 = 0 é par, se $10 = 1 é impar
	
	bne $10, $0, passa
	
	#IMPRIMINDO NÚMERO E QUEBRA DE LINHA:
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