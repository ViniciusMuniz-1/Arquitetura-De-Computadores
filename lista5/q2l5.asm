.data

#0X10010000
.word 0, 0, 0, 0, 0, 0,

.text
main:	addi $8, $0, 0	#INICIALIZANDO O I PARA O FOR

	addi $9, $0, 6	#ADICIONANDO PARA VERIFICA��O DO FOR
	lui $25, 0x1001
	
for0:	beq $8, $9, continua	#VERIFICA��O PARA SA�DA DO FOR
	
	addi $2, $0, 5	#LENDO N�MERO
	syscall
	
	sw $2, 0($25)	#ARMAZENANDO O N�MERO LIDO EM UM ENDERE�O DE MEM�RIA
	
	addi $25, $25, 4 #SOMANDO PARA APONTAR PARA O PR�XIMO ENDERE�O DE MEM�RIA
	
	addi $8, $8, 1	#INCREMENTANDO I
	j for0
	
continua:	#REINICIANDO AS VARIAVEIS PARA A IMPRESS�O DO VETOR INTEIRO
		addi $8, $0, 0
		addi $9, $0, 6
		lui $25, 0x1001
	
for1:	beq $8, $9 fim	#VERIFICA��O DE SA�DA DO FOR
	
	lw $4, 0($25)	#CARREGANDO O QUE TEM NO ENDERE�O DE MEM�RIA APONTADO POR $25 PARA $4
	addi $2, $0, 1	#IMPRIMINDO
	syscall
	
	addi $4, $0,10	#IMPRIMINDO QUEBRA DE LINHA
	addi $2, $0, 11
	syscall
	
	addi $25, $25, 4 #SOMANDO PARA APONTAR PARA O PR�XIMO ENDERE�O DE MEM�RIA
	
	addi $8, $8, 1 #INCREMENTANDO O I
	j for1
	
fim:	addi $2, $0, 10
	syscall