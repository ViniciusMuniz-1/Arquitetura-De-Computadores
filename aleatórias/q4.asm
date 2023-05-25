#Questão 4: Faça uma função que receba uma data (dia, mês e ano em inteiro) e retorne se a data é válida (retorne 1)
#ou inválida (retorna 0). Crie também uma rotina main que faz uso da função criada.

.text

main:	#LENDO O DIA E O MOVENDO PARA O $4
	addi $2, $0, 5
     	syscall
     	
     	add $4, $0, $2
     	
     	#LENDO O MÊS E O MOVENDO PARA O $5
     	addi $2, $0, 5
     	syscall
     	
     	add $5, $0, $2
     	
     	#LENDO O ANO E O MOVENDO PARA O $6
     	addi $2, $0, 5
     	syscall
     	
     	add $6, $2, $0
     	
     	jal verificaData
     	
     	add $4, $2, $0
     	addi $2, $0, 1
     	syscall
fim:
     	addi $2 $0 10
     	syscall


#====================================
#Nome: verificaData
#Utilidade: recebe $4 (dia), $5(mês) e $6(ano) e retorna 1 se a data for válida e 0 se for inválida
#Parâmetro: $4 (dia), $5(mês) e $6(ano)
#Retorno: $2 com 1 se a data for válida ou 0 se for inválida

verificaData: #VERIFICAÇÕES DE RANGE EXCEPTION:
	      	      
	      #VERIFICAÇÃO DO ANO POSITIVO:
	      srl $10, $6, 31
	      andi $10, $10, 1	#SE $10 = 1, ENTÃO É INVALIDO
	      bne $10, $0, invalido

	      #VERIFICAÇÃO DO DIA POSITIVO E SE MENOR QUE 32:
	      srl $10, $4, 31
	      andi $10, $10, 1	#SE $10 = 1, ENTÃO É INVALIDO
	      bne $10, $0, invalido
	      
	      addi $10, $0, 32
	      slt $10, $4, $10	#SE $4<$10 $10=1, SE NÃO $10=0
	      beq $10, $0, invalido
	      
	      #VERIFICAÇÃO DO MÊS POSITIVO:
	      
	      srl $10, $5, 31
	      andi $10, $10, 1	#SE $10 = 1, ENTÃO É INVALIDO
	      bne $10, $0, invalido

	      addi $10, $0, 13	#ADICIONANDO PARA VERIFICAÇÃO DO MÊS
	      slt $10, $5, $10	#SE $5 < $10, $10=1, SE NÃO $10=0
	      beq $10, $0, invalido
      
	      #VERIFICAÇÃO DO MÊS FEVEREIRO:
	      
	      addi $10, $0, 2	#ADIÇÃO PARA VERIFICAÇÃO SE O MÊS É FEVEREIRO
	      beq $5, $10, casofevereiro
	      
	      #VERIFICAÇÃO DOS OUTROS MESES:
	      addi $10, $0, 8	#ADIÇÃO PARA VERIFICAR QUAL O MÊS
	      
	      div $6, $10	#FAZENDO A DIVISÃO DO MÊS POR 8
	      mflo $10		
	      mfhi $11		
	      
	      add $10, $10, $11 #SOMA ENTRE O RESTO E QUOCIENTE DA DIV POR 8
	      andi $11, $10, 1	#ANDI PARA VERIFICAR SE É 1 OU 0, SE 0 MÊS = 30, SE 1 MÊS = 31
	      
	      beq $11, $0, mespar
	      
	      #CASO DIAS 31
	      addi $12, $0, 32
	      slt $12, $4, $12 #SE $4<$12 $12 = 1, SE NÃO $12=0
	      beq $12, $0, invalido
	      
	      j valido
	      
mespar:	      addi $12, $0, 31
	      slt $12, $4, $12	#SE $4<$12 $12 = 1, SE NÃO $12=0
	      beq $12, $0, invalido
	      
	      j valido

	      #VERIFICAÇÃO SE O ANO É BISSEXTO PARA CASO O MÊS FOR FEVEREIRO
casofevereiro:addi $12, $0, 30
	      slt $12, $4, $12	#SE $4<$12, $12=1, SENÃO $12 = 0
	      beq $12, $0, invalido

	      addi $11, $0, 400	#ADICIONANDO PARA VERIFICAÇÃO SE O ANO É BISSEXTO
	      div $6, $11
	      mfhi $12		#SE $12 = 0, ENTÃO ELE É BISSEXTO
	      beq $12, $0, bissexto
	      
	      addi $11, $0, 4
	      div $6, $11
	      mfhi $12		#SE $12 = 0, DEVEMOS FAZER A DIVISÃO POR 100
	      bne $12, $0, nbissexto
	      
	      addi $11, $0, 100
	      div $6, $11
	      mfhi $12		#SE $12 = 0 N É BISSEXTO, SE FOR DIFERENTE É
	      beq $12, $0, nbissexto
	      bne $12, $0, bissexto
	      
bissexto:     j valido
	      
nbissexto:    addi $12, $0, 29
	      slt $12, $4, $12	#SE $4<$12, $12=1, SENÃO $12 = 0
	      beq $12, $0, invalido
	      
	      j valido

invalido: addi $2, $0, 0
	  jr $31
	  
valido: addi $2, $0, 1
	jr $31