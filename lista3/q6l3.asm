.text

main:	addi $8, $0, 0

do:	addi $2, $0, 5	#lendo o n�mero
	syscall
	
	srl $9, $2, 30	#pegando o sinal do n�mero
	bne $9, $0, sai	#se o sinal for diferente de 0, ent�o o n�mero � negativo e deve-se  sair do la�o
	
	add $8, $8, $2	#somando o n�mero
	j do
	
sai:	add $4, $8, $0
	addi $2, $0, 1
	syscall
	
				
fim:	addi $2, $0, 10
	syscall