.data

#0X10010000
.word 0, 0, 0, 0, 0, 0, 0, 0

.text
main:	addi $8, $0, 0	#INICIALIZANDO O I PARA O FOR

	addi $9, $0, 8	#ADICIONANDO PARA VERIFICA��O DO FOR
	lui $25, 0x1001
	
for0:	beq $8, $9, continua	#VERIFICA��O PARA SA�DA DO FOR
	
	addi $2, $0, 5	#LENDO N�MERO
	syscall
	
	sw $2, 0($25)	#ARMAZENANDO O N�MERO LIDO EM UM ENDERE�O DE MEM�RIA
	
	addi $25, $25, 4 #SOMANDO PARA APONTAR PARA O PR�XIMO ENDERE�O DE MEM�RIA
	
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
	  add $12, $0, $0	#CRIANDO A VARI�VEL SOMA
	  
for1:	beq $8, $9, fim		#VERIFICA��O DE SA�DA
	beq $8, $10, somaX	#VERIFICA��O DE �NDICE
	beq $8, $11, somaY	#VERIFICA��O DE �NDICE
	
	add $25, $25, 4	#SOMANDO PARA APONTAR PARA O PR�XIMO ENDERE�O DE MEM�RIA

	addi $8, $8, 1	#INCREMENTANDO I
	j for1
	
somaX:	lw $13, 0($25)	#CARREGANDO O QUE TEM NO ENDERE�O DE MEM�RIA APONTADO POR $25 PARA $13
	add $12, $12, $13
	
	add $25, $25, 4	#SOMANDO PARA APONTAR PARA O PR�XIMO ENDERE�O DE MEM�RIA

	addi $8, $8, 1	#INCREMENTANDO I
	j for1
	
somaY:  lw $13, 0($25)	#CARREGANDO O QUE TEM NO ENDERE�O DE MEM�RIA APONTADO POR $25 PARA $13
	add $12, $12, $13
	
	add $25, $25, 4	#SOMANDO PARA APONTAR PARA O PR�XIMO ENDERE�O DE MEM�RIA

	addi $8, $8, 1	#INCREMENTANDO I
	j for1
	
fim:	add $4, $12, $0
	addi $2, $0, 1
	syscall

	addi $2, $0, 10
	syscall