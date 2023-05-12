.text

main:	addi $2, $0, 5
	syscall		#leio o n�mero de sinais
	jal funcDesenhaLinha

	
fim:	addi $2, $0, 10
	syscall


#====================================
#Nome: funcDesenhaLinha
#Utilidade: recebe um n�mero inteiro e retorna uma linha com a quantidade digitada
#Par�metro: 1 n�mero inteiro
#Retorno: Linha com =
funcDesenhaLinha: 

add $8, $0, $2
addi $9, $0, 1
	
for:	beq $8, $0, endFunc
	addi $4, $0, '='
	addi $2, $0, 11
	syscall
	
	sub $8, $8, $9
	
	j for
	
endFunc: jr $31
#====================================
