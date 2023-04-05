.text

main:   addi $2, $0, 12
	syscall		#le o caractere
	add  $8, $2, $0 #move o caractere para o reg $8
	addi $4, $0, 10	#adicionado caractere de quebra de linha
	addi $2, $0, 11
	syscall		#quebra de linha
	addi $9, $0, 32
	sub  $4, $8, $9
	addi $2, $0, 11
	syscall		#imprime