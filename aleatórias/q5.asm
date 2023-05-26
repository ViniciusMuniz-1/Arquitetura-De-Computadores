#Questão 5: Faça uma função que receba um endereço de início de uma matriz (endereço do primeiro dado) de
#inteiros; a quantidade de colunas da matriz; uma linha; e uma coluna e retorne o endereço do dado. Por exemplo,
#uma matriz 3x4 (3 linhas e 4 colunas) ocupa os endereços mostrados na tabela a seguir.

.data

.text
main:	addi $2, $0, 5
	syscall		#RECEBENDO O ENDEREÇO DE MEMÓRIA; O USUÁRIO DEVE DIGITAR 10010000, IGNORANDO O 0x
	
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
	syscall		#O ÚNICO PROBLEMA DA FUNÇÃO FEITA É O SEGUINTE: NÃO SEI COMO CONVERTER OS DÍGITOS PARA HEXADECIMAL, APÓS A SOMA
			#MAS, QUANDO SE RECEBE 10010000 4 2 1, TEMOS COMO RETORNO 10010036, 36 EM HEXA É 24, QUE FICARIA 10010024 QUE
			#SERIA O RESULTADO CERTO. ESCREVO ESSA MENSAGEM ÀS 23:09 E TRISTE :( !
	
fim:	addi $2, $0, 10
	syscall
	
#====================================
#Nome: retornaEndereco
#Utilidade: recebe $4 (endereço) e retorna o $2 com o endereço de memória
#Parâmetro: $4 (endereço), $5(Qtd colunas), $6(Linha), $7(Coluna)
#Retorno: $2 com o endereço desejado
retornaEndereco:
#INICIALIZAÇÃO DE VARIÁVEIS:
add $10, $0, $7	#VERIFICADOR PARA VER SE CHEGUEI NO LUGAR
add $11, $0, $0	#CONTADOR DAS COLUNAS PARA PULAR LINHA
add $12, $0, $0	#CONTALINHAS

for:	beq $11, $5, pulalinha	#VERIFICADOR SE DEVE PASSAR DE LINHA
	beq $12, $6, linhacerta	#VERIFICANDO SE CHEGAMOS NA LINHA CORRETA
	
	addi $4, $4, 4		#PULANDO PARA O PROX ENDEREÇO
	
	addi $11, $11, 1	#AUMENTANDO A QUANTIDADE DE COLUNAS
	
	j for

pulalinha: addi $11, $0, 0	#AUMENTANDO A QUANTIDADE DE COLUNAS
	   
	   addi $12, $12, 1	#INCREMENTANDO A QUANT LINHAS
	   
	   j for
	   
linhacerta: addi $11, $0, 0	#REINICIANDO AS COLUNAS

vericoluna: beq $11, $7, colunacerta
	    
	    addi $4, $4, 4	#PULANDO PARA O PROX ENDEREÇO
	    
	    addi $11, $11, 1
	    
	    j vericoluna
	    
colunacerta: add $2, $4, $0
	    
fimfunc:	jr $31

#CRIADO POR: JOSÉ VINICIUS TARGINO MUNIZ