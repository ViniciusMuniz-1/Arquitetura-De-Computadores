.data

#0X10010000
.word 0, 0, 0, 0, 0, 0,

.text
main:	addi $8, $0, 0	#INICIALIZANDO O I PARA O FOR

	addi $9, $0, 6	#ADICIONANDO PARA VERIFICAÇÃO DO FOR
	lui $25, 0x1001
	
for0:	beq $8, $9, continua	#VERIFICAÇÃO PARA SAÍDA DO FOR
	
	addi $2, $0, 5	#LENDO NÚMERO
	syscall
	
	sw $2, 0($25)	#ARMAZENANDO O NÚMERO LIDO EM UM ENDEREÇO DE MEMÓRIA
	
	addi $25, $25, 4 #SOMANDO PARA APONTAR PARA O PRÓXIMO ENDEREÇO DE MEMÓRIA
	
	addi $8, $8, 1	#INCREMENTANDO I
	j for0
	
continua:	#REINICIANDO AS VARIAVEIS PARA A IMPRESSÃO DO VETOR INTEIRO
		addi $8, $0, 0
		addi $9, $0, 6
		lui $25, 0x1001
	
for1:	beq $8, $9 fim	#VERIFICAÇÃO DE SAÍDA DO FOR
	
	lw $4, 0($25)	#CARREGANDO O QUE TEM NO ENDEREÇO DE MEMÓRIA APONTADO POR $25 PARA $4
	addi $2, $0, 1	#IMPRIMINDO
	syscall
	
	addi $4, $0,10	#IMPRIMINDO QUEBRA DE LINHA
	addi $2, $0, 11
	syscall
	
	addi $25, $25, 4 #SOMANDO PARA APONTAR PARA O PRÓXIMO ENDEREÇO DE MEMÓRIA
	
	addi $8, $8, 1 #INCREMENTANDO O I
	j for1
	
fim:	addi $2, $0, 10
	syscall