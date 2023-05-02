.text

main:	addi $8, $0, 0
	addi $2, $0, 5
	syscall		#lendo o primeiro número
	beq $2, $0, fim	#se o usuário digitar 0, então acaba o programa
	
	add $9, $2, $0	#adicionando o menor ao $9
	add $10, $2, $0	#adicionando o maior ao $10
	
do:	addi $2, $0, 5	#lendo o número
	syscall
	beq $2, $0, sai	#se o número digitador for = 0, então deve-se sair do laço
	
	slt $11, $2, $9	#se o $2 for menor que o $9, então $11 = 1 e o $2 deve ser o novo menor, senão $11 = 0
	beq $11, $0, testM
	add $9, $0, $2	#$2 se torna o novo menor se não for para o testM
	
testM: 	slt $11, $10, $2 #se o $10 for menor que $2, então $11 = 1 e o $2 deve ser o novo maior, senão $11 = 0
	beq $11, $0, fimT
	add $10, $0, $2
	
fimT:	j do
	
sai:	add $4, $10, $0
	addi $2, $0, 1
	syscall		#imprime o maior
	
	addi $4, $0, 10
	addi $2, $0, 11
	syscall		#imprime quebra de linha
	
	add $4, $9, $0
	addi $2, $0, 1
	syscall		#imprime o menor
	
				
fim:	addi $2, $0, 10
	syscall