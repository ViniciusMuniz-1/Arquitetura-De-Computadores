.data

.word 0, 0, 0, 0, 0, 0
#0x10010000

.text
main:	addi $8, $0, 0	#INICIALIZANDO O I PARA O FOR

	addi $9, $0, 6	#ADICIONANDO PARA VERIFICA��O NO FOR (I < 10)
	add $15, $0, 0	#CRIANDO CONTADO PARA SER O I DO PR�XIMO FOR
	
	lui $25, 0x1001
	
for0:	beq $8, $9, continua	#VERIFICA��O PARA SA�DA DO FOR
	
	addi $2, $0, 5	#LENDO N�MERO
	syscall
	
	andi $10, $2, 1	#VERIFICANDO SE O N�MERO � PAR
	bne $10, $0, pula
	
	sw $2, 0($25)	#ARMAZENANDO O N�MERO LIDO EM UM ENDERE�O DE MEM�RIA
	addi $15, $15, 1
	
	addi $25, $25, 4 #SOMANDO PARA APONTAR PARA O PR�XIMO ENDERE�O DE MEM�RIA
	
	addi $8, $8, 1	#INCREMENTANDO I
	j for0
	
pula:	addi $8, $8, 1	#INCREMENTANDO I

	j for0

continua:
	  #REINICIANDO AS VARIAVEIS PARA A VERIFICA��O SE O N�MERO � PAR
	  addi $8, $0, 0
	  add $9, $0, $15
	  lui $25, 0x1001
	  
	  mul $14, $15, 4
	  subi $14, $14, 4
	  
	  add $25, $25, $14
	  
for1:	  beq $8, $9, fim #VERIFICA��O PARA SA�DA DO FOR
	
	  lw $4, 0($25)
	  addi $2, $0, 1
	  syscall
	  
	  addi $4, $0, 10	#IMPRIMIR QUEBRA DE LINHA
	  addi $2, $0, 11
	  syscall
	  
	  subi $25, $25, 4
	
	  addi $8, $8, 1	#INCREMENTANDO I
	  
	  j for1
	  
fim:	addi $2, $0, 10
	syscall  