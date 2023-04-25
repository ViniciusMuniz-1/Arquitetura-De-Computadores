.text
#10 primeiros números múltiplos de 3; 3 6 9 12 15 18 21 24 27 30

main:	addi $8, $0, 3 #ADIÇÃO PARA DIVISÃO
	addi $9, $0, 1 #ADIÇÃO PARA DIVISÃO
	addi $24, $0, 30 #ADIÇÃO PARA VERIFICAÇÃO
	
for:    div $9, $8		#DIVISÃO PARA VERIFICAÇÃO
	mfhi $10		#MOVER O RESTO PARA O $10
	beq $0, $10, mutiplo
	addi $9, $9, 1		#ADIÇÃO DO 1
	j for
	
mutiplo: add $4, $0, $9
	 addi $2, $0, 1
	 syscall
	 addi $4, $0, ' '
	 addi $2, $0, 11
	 syscall
	 beq $24, $9, fim	#SE O NÚMERO FOR = 30, ENTÃO DEVE-SE IMPRIMIR TUDO
	 addi $9, $9, 1		#ADIÇÃO DO 1
	 j for

fim: 	addi $2, $0, 10
	syscall
