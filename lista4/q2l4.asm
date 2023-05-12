.text

main:	addi $2, $0, 5
	syscall		#leio o n�mero
	jal funcPosiOuNeg
	add $4, $8, $0
	addi $2, $0, 1
	syscall
	
fim:	addi $2, $0, 10
	syscall


#====================================
#Nome: funcPosiOuNeg
#Utilidade: recebe um n�mero inteiro e retorna se ele � positivo, negativo ou 0
#Par�metro: 1 n�mero inteiro
#Retorno: $8 com 1 se positivo, -1 se negativo e 0 se 0
funcPosiOuNeg:  beq $2, $0, zero
		srl $8, $2, 31
		beq $8, $0, positivo
		
negativo:	addi $8, $0, -1
		jr $31
		
positivo:	addi $8, $0, 1
		jr $31

zero:		addi $8, $0, 0
	   	jr $31
#====================================