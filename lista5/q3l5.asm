.data

#0X10010000
.word 0, 0, 0, 0, 0, 0, 0, 0

.text
main:	addi $8, $0, 0	#INICIALIZANDO O I PARA O FOR

	addi $9, $0, 8	#ADICIONANDO PARA VERIFICAÇÃO DO FOR
	lui $25, 0x1001
	
for0:	beq $8, $9, continua	#VERIFICAÇÃO PARA SAÍDA DO FOR
	
	addi $2, $0, 5	#LENDO NÚMERO
	syscall
	
	sw $2, 0($25)	#ARMAZENANDO O NÚMERO LIDO EM UM ENDEREÇO DE MEMÓRIA
	
	addi $25, $25, 4 #SOMANDO PARA APONTAR PARA O PRÓXIMO ENDEREÇO DE MEMÓRIA
	
	addi $8, $8, 1	#INCREMENTANDO I
	j for0
	
continua: addi $2, $0, 5	#LENDO X
	  syscall
	  
	  add $10, $2, $0	#MANDANDO X PARA O $10
	  
	  addi $2, $0, 5	#LENDO Y
	  syscall
	  
	  add $11, $2, $0	#MANDANDO Y PARA O $11
	  
	  #REINICIANDO AS VARIAVEIS PARA A SOMA DO A[X] E A[Y]
	  addi $8, $0, 0
	  addi $9, $0, 8
	  lui $25, 0x1001
	  add $12, $0, $0	#CRIANDO A VARIÁVEL SOMA
	  
for1:	beq $8, $9, fim		#VERIFICAÇÃO DE SAÍDA
	beq $8, $10, somaX	#VERIFICAÇÃO DE ÍNDICE
	beq $8, $11, somaY	#VERIFICAÇÃO DE ÍNDICE
	
	add $25, $25, 4	#SOMANDO PARA APONTAR PARA O PRÓXIMO ENDEREÇO DE MEMÓRIA

	addi $8, $8, 1	#INCREMENTANDO I
	j for1
	
somaX:	lw $13, 0($25)	#CARREGANDO O QUE TEM NO ENDEREÇO DE MEMÓRIA APONTADO POR $25 PARA $13
	add $12, $12, $13
	
	add $25, $25, 4	#SOMANDO PARA APONTAR PARA O PRÓXIMO ENDEREÇO DE MEMÓRIA

	addi $8, $8, 1	#INCREMENTANDO I
	j for1
	
somaY:  lw $13, 0($25)	#CARREGANDO O QUE TEM NO ENDEREÇO DE MEMÓRIA APONTADO POR $25 PARA $13
	add $12, $12, $13
	
	add $25, $25, 4	#SOMANDO PARA APONTAR PARA O PRÓXIMO ENDEREÇO DE MEMÓRIA

	addi $8, $8, 1	#INCREMENTANDO I
	j for1
	
fim:	add $4, $12, $0
	addi $2, $0, 1
	syscall

	addi $2, $0, 10
	syscall