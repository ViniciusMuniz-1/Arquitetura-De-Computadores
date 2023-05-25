#Quest�o 4: Fa�a uma fun��o que receba uma data (dia, m�s e ano em inteiro) e retorne se a data � v�lida (retorne 1)
#ou inv�lida (retorna 0). Crie tamb�m uma rotina main que faz uso da fun��o criada.

.text

main:	#LENDO O DIA E O MOVENDO PARA O $4
	addi $2, $0, 5
     	syscall
     	
     	add $4, $0, $2
     	
     	#LENDO O M�S E O MOVENDO PARA O $5
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
#Utilidade: recebe $4 (dia), $5(m�s) e $6(ano) e retorna 1 se a data for v�lida e 0 se for inv�lida
#Par�metro: $4 (dia), $5(m�s) e $6(ano)
#Retorno: $2 com 1 se a data for v�lida ou 0 se for inv�lida

verificaData: #VERIFICA��ES DE RANGE EXCEPTION:
	      	      
	      #VERIFICA��O DO ANO POSITIVO:
	      srl $10, $6, 31
	      andi $10, $10, 1	#SE $10 = 1, ENT�O � INVALIDO
	      bne $10, $0, invalido

	      #VERIFICA��O DO DIA POSITIVO E SE MENOR QUE 32:
	      srl $10, $4, 31
	      andi $10, $10, 1	#SE $10 = 1, ENT�O � INVALIDO
	      bne $10, $0, invalido
	      
	      addi $10, $0, 32
	      slt $10, $4, $10	#SE $4<$10 $10=1, SE N�O $10=0
	      beq $10, $0, invalido
	      
	      #VERIFICA��O DO M�S POSITIVO:
	      
	      srl $10, $5, 31
	      andi $10, $10, 1	#SE $10 = 1, ENT�O � INVALIDO
	      bne $10, $0, invalido

	      addi $10, $0, 13	#ADICIONANDO PARA VERIFICA��O DO M�S
	      slt $10, $5, $10	#SE $5 < $10, $10=1, SE N�O $10=0
	      beq $10, $0, invalido
      
	      #VERIFICA��O DO M�S FEVEREIRO:
	      
	      addi $10, $0, 2	#ADI��O PARA VERIFICA��O SE O M�S � FEVEREIRO
	      beq $5, $10, casofevereiro
	      
	      #VERIFICA��O DOS OUTROS MESES:
	      addi $10, $0, 8	#ADI��O PARA VERIFICAR QUAL O M�S
	      
	      div $6, $10	#FAZENDO A DIVIS�O DO M�S POR 8
	      mflo $10		
	      mfhi $11		
	      
	      add $10, $10, $11 #SOMA ENTRE O RESTO E QUOCIENTE DA DIV POR 8
	      andi $11, $10, 1	#ANDI PARA VERIFICAR SE � 1 OU 0, SE 0 M�S = 30, SE 1 M�S = 31
	      
	      beq $11, $0, mespar
	      
	      #CASO DIAS 31
	      addi $12, $0, 32
	      slt $12, $4, $12 #SE $4<$12 $12 = 1, SE N�O $12=0
	      beq $12, $0, invalido
	      
	      j valido
	      
mespar:	      addi $12, $0, 31
	      slt $12, $4, $12	#SE $4<$12 $12 = 1, SE N�O $12=0
	      beq $12, $0, invalido
	      
	      j valido

	      #VERIFICA��O SE O ANO � BISSEXTO PARA CASO O M�S FOR FEVEREIRO
casofevereiro:addi $12, $0, 30
	      slt $12, $4, $12	#SE $4<$12, $12=1, SEN�O $12 = 0
	      beq $12, $0, invalido

	      addi $11, $0, 400	#ADICIONANDO PARA VERIFICA��O SE O ANO � BISSEXTO
	      div $6, $11
	      mfhi $12		#SE $12 = 0, ENT�O ELE � BISSEXTO
	      beq $12, $0, bissexto
	      
	      addi $11, $0, 4
	      div $6, $11
	      mfhi $12		#SE $12 = 0, DEVEMOS FAZER A DIVIS�O POR 100
	      bne $12, $0, nbissexto
	      
	      addi $11, $0, 100
	      div $6, $11
	      mfhi $12		#SE $12 = 0 N � BISSEXTO, SE FOR DIFERENTE �
	      beq $12, $0, nbissexto
	      bne $12, $0, bissexto
	      
bissexto:     j valido
	      
nbissexto:    addi $12, $0, 29
	      slt $12, $4, $12	#SE $4<$12, $12=1, SEN�O $12 = 0
	      beq $12, $0, invalido
	      
	      j valido

invalido: addi $2, $0, 0
	  jr $31
	  
valido: addi $2, $0, 1
	jr $31