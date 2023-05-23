.data

.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
#0x10010000

.text
main:	addi $8, $0, 0	#INICIALIZANDO O I PARA O FOR

	addi $9, $0, 10	#ADICIONANDO PARA VERIFICAÇÃO NO FOR (I < 10)
	lui $25, 0x1001
	
for0:	beq $8, $9, continua	#VERIFICAÇÃO PARA SAÍDA DO FOR
	
	addi $2, $0, 5	#LENDO NÚMERO
	syscall
	
	sw $2, 0($25)	#ARMAZENANDO O NÚMERO LIDO EM UM ENDEREÇO DE MEMÓRIA
	
	addi $25, $25, 4 #SOMANDO PARA APONTAR PARA O PRÓXIMO ENDEREÇO DE MEMÓRIA
	
	addi $8, $8, 1	#INCREMENTANDO I
	j for0
	
continua:
	  #REINICIANDO AS VARIAVEIS PARA A VERIFICAÇÃO SE O NÚMERO É PAR
	  addi $8, $0, 0
	  addi $9, $0, 10
	  lui $25, 0x1001
	  lw $10, 0($25)	#CARREGANDO O QUE TEM NO ENDEREÇO DE MEMÓRIA APONTADO POR $25 PARA $10
	  lw $13, 0($25)	#CARREGANDO O QUE TEM NO ENDEREÇO DE MEMÓRIA APONTADO POR $25 PARA $13

for1:	beq $8, $9, imprimemaior #VERIFICAÇÃO PARA SAÍDA DO FOR
	
	lw $11, 0($25)	#CARREGANDO O QUE TEM NO ENDEREÇO DE MEMÓRIA APONTADO POR $25+4 PARA $11
	slt $12, $11, $10	#VERIFICANDO SE $11 < $10, SE SIM $12=1 SE NÃO $12 = 0
	beq $12, $0, mudaMaior
	
	slt $12, $13, $11	#VERIFICANDO SE $13 < $11, SE SIM $12=1 SE NÃO $12 = 0
	beq $12, $0, mudaMenor
	
	addi $25, $25, 4 #SOMANDO PARA APONTAR PARA O PRÓXIMO ENDEREÇO DE MEMÓRIA
	
	addi $8, $8, 1	#INCREMENTANDO I
	
	j for1
	
mudaMaior: add $10, $0, $11
		
	   slt $12, $13, $11	#VERIFICANDO SE $13 < $11, SE SIM $12=1 SE NÃO $12 = 0
	   beq $12, $0, mudaMenor
	   
	   addi $25, $25, 4 #SOMANDO PARA APONTAR PARA O PRÓXIMO ENDEREÇO DE MEMÓRIA
	
	   addi $8, $8, 1	#INCREMENTANDO I
	
	   j for1
	   
mudaMenor: add $13, $0, $11

	   addi $25, $25, 4 #SOMANDO PARA APONTAR PARA O PRÓXIMO ENDEREÇO DE MEMÓRIA
	
	   addi $8, $8, 1	#INCREMENTANDO I
	
	   j for1

imprimemaior: add $4, $0, $10
	      addi $2, $0, 1
	      syscall
	      
	      addi $4, $0, 10	#IMPRIMIR QUEBRA DE LINHA
	      addi $2, $0, 11
	      syscall
	      
imprimemenor: add $4, $0, $13
	      addi $2, $0, 1
	      syscall
	   
fim:	addi $2, $0, 10
	syscall