.data

.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
#0x10010000

.text
main:	addi $8, $0, 0	#INICIALIZANDO O I PARA O FOR

	addi $9, $0, 10	#ADICIONANDO PARA VERIFICA��O NO FOR (I < 10)
	lui $25, 0x1001
	
for0:	beq $8, $9, continua	#VERIFICA��O PARA SA�DA DO FOR
	
	addi $2, $0, 5	#LENDO N�MERO
	syscall
	
	sw $2, 0($25)	#ARMAZENANDO O N�MERO LIDO EM UM ENDERE�O DE MEM�RIA
	
	addi $25, $25, 4 #SOMANDO PARA APONTAR PARA O PR�XIMO ENDERE�O DE MEM�RIA
	
	addi $8, $8, 1	#INCREMENTANDO I
	j for0
	
continua:
	  #REINICIANDO AS VARIAVEIS PARA A VERIFICA��O SE O N�MERO � PAR
	  addi $8, $0, 0
	  addi $9, $0, 10
	  lui $25, 0x1001


for1:	beq $8, $9, fim	#VERIFICA��O PARA SA�DA DO FOR
	
	lw $10, 0($25)	#CARREGANDO O QUE TEM NO ENDERE�O DE MEM�RIA APONTADO POR $25 PARA $13
	andi $11, $10, 1 #VERIFICANDO SE O N�MERO � PAR
	beq $11, $0, par #SE FOR PAR ELE VAI PARA A IMPRESS�O
	
	addi $25, $25, 4 #SOMANDO PARA APONTAR PARA O PR�XIMO ENDERE�O DE MEM�RIA
	
	addi $8, $8, 1	#INCREMENTANDO I
	
	j for1
	
par:	add $4, $0, $10	#ADICIONANDO AO $4 PARA IMPRESS�O
	addi $2, $0, 1
	syscall
	
	addi $4, $0, 10	#IMPRIMIR QUEBRA DE LINHA
	addi $2, $0, 11
	syscall
	
	addi $25, $25, 4 #SOMANDO PARA APONTAR PARA O PR�XIMO ENDERE�O DE MEM�RIA
	
	addi $8, $8, 1	#INCREMENTANDO I
	
	j for1
	
fim:	addi $2, $0, 10
	syscall