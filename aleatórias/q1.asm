.data

.text

main:	lui $8, 0x1001
	addi $10, $0, 512	#ADIÇÃO PARA O FOR
	addi $9, $0, 1		#INICIALIZANDO I PARA O FOR
	
for:	beq $9, $10, sai	#VERIFICANDO PARA SAÍDA DO LAÇO
	sw $9, 0($8)		
	addi $8, $8, 4		#PASSANDO PARA O PRÓXIMO ENDEREÇO DE MEMÓRIA
	
	addi $9, $9, 512	#INCREMENTANDO O I
	
	j for
	
sai:	addi $2, $0, 10		#FIM DO PROGRAMA
	syscall