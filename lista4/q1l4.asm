.text

main:	addi $2, $0, 5
	syscall		#leio o número
	jal funcDobro
	add $4, $8, $0
	addi $2, $0, 1
	syscall
	
fim:	addi $2, $0, 10
	syscall


#====================================
#Nome: funcDobro
#Utilidade: recebe um número inteiro e retorna o dobro dele
#Parâmetro: 1 número inteiro
#Retorno: $8 com dobro do número inteiro
funcDobro: sll $8, $2, 1
	   jr $31
#====================================
