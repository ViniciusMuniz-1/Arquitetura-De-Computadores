#Quest�o 5: Fa�a uma fun��o que receba um endere�o de in�cio de uma matriz (endere�o do primeiro dado) de
#inteiros; a quantidade de colunas da matriz; uma linha; e uma coluna e retorne o endere�o do dado. Por exemplo,
#uma matriz 3x4 (3 linhas e 4 colunas) ocupa os endere�os mostrados na tabela a seguir.

.data

.text
main:	addi $2, $0, 5
	syscall		#RECEBENDO O ENDERE�O DE MEM�RIA; O USU�RIO DEVE DIGITAR 10010000, IGNORANDO O 0x
	
	add $4, $0, $2
	
	addi $2, $0, 5
	syscall		#RECEBENDO A QTD DE COLUNAS
	
	add $5, $0, $2
	
	addi $2, $0, 5
	syscall		#RECEBENDO A LINHAS
	
	add $6, $0, $2
	
	addi $2, $0, 5
	syscall		#RECEBENDO A COLUNAS
	
	add $7, $0, $2
	
	jal retornaEndereco
	
	addi $2, $0, 1
	syscall		#O �NICO PROBLEMA DA FUN��O FEITA � O SEGUINTE: N�O SEI COMO CONVERTER OS D�GITOS PARA HEXADECIMAL, AP�S A SOMA
			#MAS, QUANDO SE RECEBE 10010000 4 2 1, TEMOS COMO RETORNO 10010036, 36 EM HEXA � 24, QUE FICARIA 10010024 QUE
			#SERIA O RESULTADO CERTO. ESCREVO ESSA MENSAGEM �S 23:09 E TRISTE :( !
	
fim:	addi $2, $0, 10
	syscall
	
#====================================
#Nome: retornaEndereco
#Utilidade: recebe $4 (endere�o) e retorna o $2 com o endere�o de mem�ria
#Par�metro: $4 (endere�o), $5(Qtd colunas), $6(Linha), $7(Coluna)
#Retorno: $2 com o endere�o desejado
retornaEndereco:
#INICIALIZA��O DE VARI�VEIS:
add $10, $0, $7	#VERIFICADOR PARA VER SE CHEGUEI NO LUGAR
add $11, $0, $0	#CONTADOR DAS COLUNAS PARA PULAR LINHA
add $12, $0, $0	#CONTALINHAS

for:	beq $11, $5, pulalinha	#VERIFICADOR SE DEVE PASSAR DE LINHA
	beq $12, $6, linhacerta	#VERIFICANDO SE CHEGAMOS NA LINHA CORRETA
	
	addi $4, $4, 4		#PULANDO PARA O PROX ENDERE�O
	
	addi $11, $11, 1	#AUMENTANDO A QUANTIDADE DE COLUNAS
	
	j for

pulalinha: addi $11, $0, 0	#AUMENTANDO A QUANTIDADE DE COLUNAS
	   
	   addi $12, $12, 1	#INCREMENTANDO A QUANT LINHAS
	   
	   j for
	   
linhacerta: addi $11, $0, 0	#REINICIANDO AS COLUNAS

vericoluna: beq $11, $7, colunacerta
	    
	    addi $4, $4, 4	#PULANDO PARA O PROX ENDERE�O
	    
	    addi $11, $11, 1
	    
	    j vericoluna
	    
colunacerta: add $2, $4, $0
	    
fimfunc:	jr $31

#CRIADO POR: JOS� VINICIUS TARGINO MUNIZ