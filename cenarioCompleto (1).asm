.text
#NOTA DE VINICIUS: NA HORA DE DESENHAR AS PE�AS, SEMPRE SOME O ENDERE�O DA �LTIMA +64 PARA O DESENHO DA PR�XIMA PE�A
#EX.: O DESENHO DA TORRE COME�OU NO ENDERE�O 1552, ENT�O O DO CAVALO COME�AR� NO 1616, O DO BISPO NO 1680 E ASSIM EM DIANTE



main:	lui $25, 0x1001		#INICIALIZANDO O ENDERE�O DE MEM�RIA INICIAL
	addi $25, $25, 16
	addi $25, $25, 2048
	addi $10, $0, 0xf3ddcf	#INICIALIZANDO A COR VERDE
	addi $11, $0, 0x1b7a47	#INICIALIZANDO A COR AMARELO CLARO
	addi $16, $0, 0x000000	#INICIALIZANDO A COR PRETA EM HEXA
	addi $17, $0, 0x92b1f0	#INICIALIZANDO A COR BRANCA EM HEXA
        addi $12, $0, 0         #CONTADOR DE CHAMADA DE FUN��O    
        
        addi $18, $0, 10	#VARIAVEL FIXA
        
        addi $15, $0, 0		#CONTADOR	
	
	addi $9, $0, 596		#UNIDADES GR�FICAS
	addi $13, $0, 1436	#ALTURA DO QUADRADO
	
for:	slt $14, $13, $0	#SE $14 = 1, ENT�O PULA PRA MUDACOR TAMB�M
	beq $15, $18, faz
        bne $15, $18, faz2
	 
faz:	addi $25, $25, 32
	 
	addi $15, $0, 0
	 
faz2:  	addi $15, $15, 1
	beq $13, $0, mantercor	#SE UMA LINHA INTEIRA FOR PINTADA, ENT�O PULA-SE PARA PR�XIMA LINHA COM A MESMA COR DA ANTIGA
	bne $14, $0, mantercor	#SE UMA LINHA INTEIRA FOR PINTADA, ENT�O PULA-SE PARA PR�XIMA LINHA COM A MESMA COR DA ANTIGA
	beq $9, $0, continua		
	
	addi $9, $9, -1
	
	addi $12, $0, 12	#VERIFICANDO A QUANTIDADE DE PIXEIS A SEREM PINTADOS POR COR
	

		
formar: beq $12, $0, next	#VERIFICA��O DO FIM DO FOR

	sw $10, 0($25)		#DESENHANDO NO BITMAP
	
	addi $25, $25, 4	#PASSANDO PARA O PR�XIMO ENDERE�O DE MEM�RIA
	
	addi $12, $12, -1
	
	addi $13, $13, -1	#REDUZINDO UMA UNIDADE GR�FICA DA LINHA
	
	add $8, $0, $10		#ADICIONANDO A COR NA VARI�VEL AUXILIAR
	
	j formar

next:	addi $12, $0, 12	#REINICIALIZANDO A QUANTIDADE DE UNIDADES GR�FICAS A SEREM PINTADAS

	beq $15, $18, faz3
        bne $15, $18, faz4

faz3:	addi $25, $25, 32
	 
	addi $15, $0, 0
	 
faz4:  	addi $15, $15, 1
	
forpre: beq $12, $0, for	#VERIFICA��O DO FIM DO FOR

	sw $11, 0($25)		#DESENHANDO NO BITMAP
	
	addi $25, $25, 4	#PASSANDO PARA O PR�XIMO ENDERE�O DE MEM�RIA
	addi $12, $12, -1
	
	addi $13, $13, -1	#REDUZINDO UMA UNIDADE GR�FICA DA LINHA
	
	add $8, $0, $11		#ADICIONANDO A COR NA VARI�VEL AUXILIAR
	
	j forpre
	
mantercor: addi $12, $0, 12	#REINICIALIZANDO A QUANTIDADE DE UNIDADES GR�FICAS A SEREM PINTADAS
	 addi $13, $0, 1436	#REINICIALIZANDO A QUANTIDADE DE UNIDADES GR�FICAS POR LINHA
	 
	 beq $8, $11, forpre
	 beq $8, $10, formar
	 
continua: lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL

	  addi $4, $25, 9296	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHATORRE
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHATORRE

	  jal funcDesenhaTorre	#FUN��O DESENHA TORRE
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 9340	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHACAVALO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHACAVALO
	  
	  jal funcDesenhaCavalo	#FUN��O DESENHA CAVALO

	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 9388	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHACAVALO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHABISPO
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 9436	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHARAINHA
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHARAINHA
	  
	  jal funcDesenhaRainha
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 9492	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHAREI
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHAREI
	  
	  jal funcDesenhaRei
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 9532	#ADICIONANDO PARA ENVIAR PARA A FUNC REI
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC REI
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 9580	#ADICIONANDO PARA ENVIAR PARA A FUNC BISPO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC BISPO
	  
	  jal funcDesenhaCavalo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 9628	#ADICIONANDO PARA ENVIAR PARA A FUNC CAVALO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC CAVALO
	  
	  jal funcDesenhaTorre
	  
	  addi $10, $0, 15956	#ADICIONANDO PARA CONTAR OS ENDERE�OS DE MEM�RIA DO PE�O
	  
	  addi $15, $0, 8	#ADICIONANDO PARA O FOR
	  
forpeaomain: beq $15, $0, saiForDesenhaPeao 
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  add $4, $25, $10	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHSAPEAO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHSAPEAO
	  
	  addi $10, $10, 48
	  
	  addi $15, $15, -1
	  
	  jal funcDesenhaPeao
	  
	  j forpeaomain


saiForDesenhaPeao:

	  addi $10, $0, 46676	#ADICIONANDO PARA CONTAR OS ENDERE�OS DE MEM�RIA DO PE�O
	  
	  addi $15, $0, 8	#ADICIONANDO PARA O FOR

forDesenhaPeao2:  
	
	  beq $15, $0, saiForDesenhaPeao2
	  
	  addi $15, $15, -1
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  add $4, $25, $10	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHSAPEAO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRANCA PARA A FUNC DESENHSAPEAO
	  
	  jal funcDesenhaPeao
	  
	  addi $10, $10, 48
	  
	  j forDesenhaPeao2

saiForDesenhaPeao2:

	  lui $25, 0x1001	#REINICIANDO PARA O ENDERE�O DE MEM�RIA INICIAL

	  addi $4, $25, 52816	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHATORRE
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRANCA PARA A FUNC DESENHATORRE

	  jal funcDesenhaTorre	#FUN��O DESENHA TORRE

	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 52864	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHACAVALO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRANCA PARA A FUNC DESENHACAVALO
	  
	  jal funcDesenhaCavalo	#FUN��O DESENHA CAVALO
	  
	   lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 52908	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHABISPO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRAMCA PARA A FUNC DESENHABISPO
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 52960	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHARAINHA
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHARAINHA
	  
	  jal funcDesenhaRainha
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 53016	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHAREI
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHAREI
	  
	  jal funcDesenhaRei
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 53052	#ADICIONANDO PARA ENVIAR PARA A FUNC REI

	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC REI
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 53104	#ADICIONANDO PARA ENVIAR PARA A FUNC BISPO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC BISPO
	  
	  jal funcDesenhaCavalo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 53152	#ADICIONANDO PARA ENVIAR PARA A FUNC CAVALO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC CAVALO
	  
	  jal funcDesenhaTorre
	  
	  #DESENHANDO AS LETRAS:
	  
	  #LETRA A DE AMOR
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL

	  addi $4, $25, 3156	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA A
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA A

	  jal funcDesenhaA	#FUN��O DESENHA A
	  
	  #LETRA B DE BOLA
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL

	  addi $4, $25, 3200	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA B
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA B

	  jal funcDesenhaB	#FUN��O DESENHA B
	  
	  #LETRA C DE CAMALE�O
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL

	  addi $4, $25, 3248	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA C
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA C

	  jal funcDesenhaC	#FUN��O DESENHA C
	  
	  #LETRA D DE DADO
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 3292	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA D
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA D

	  jal funcDesenhaD	#FUN��O DESENHA D
	  
	  
	  	                                                  
	  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
fim:	addi $2, $0, 10
	syscall
	
#ESPA�O DAS FUN��ES DE DESENHOS DE LETRAS >:(
#>=====================================================================
#====================================
#Nome: funcDesenhaA
#Utilidade: desenha a letra A a partir de um endere�o de mem�ria previamente iniciado
#Par�metro: $4 (ENDERE�O DE MEM�RIA), $5(COR DE DESENHO)
#Retorno:
funcDesenhaA:
	add $25, $4, $0	#ENDERE�O EM QUE COME�AR� O DESENHO DA LETRA A
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O 
	
	addi $25, $25, 4
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O 
	
	addi $9, $0, 2
	
	addi $25, $25, 504
	
for1LetraA:
	beq $9, $0, saiForA1
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O 
	
	addi $25, $25, 12
	
	addi $9, $9, -1
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O 
	
	addi $25, $25, 500
	
	j for1LetraA
	

saiForA1:
	addi $9, $0, 4
	
for2LetraA:
	beq $9, $0, saiForA2
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O 
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j for2LetraA
	
saiForA2:
	addi $25, $25, 496
	
	addi $9, $9, 3
	
for3LetraA:
	beq $9, $0, saiForA3
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 500
	
	addi $9, $9, -1
	
	j for3LetraA

saiForA3:

saiFuncDesenhaA: 
	jr $31
#====================================

#====================================
#Nome: funcDesenhaB
#Utilidade: desenha a letra B a partir de um endere�o de mem�ria previamente iniciado
#Par�metro: $4 (ENDERE�O DE MEM�RIA), $5(COR DE DESENHO)
#Retorno:	
funcDesenhaB:
	add $25, $4, $0	#ENDERE�O EM QUE COME�AR� O DESENHO DA LETRA B
	
	addi $9, $0, 3	#ADICIONANDO I PARA O FOR
	
forDesenhaB1: 
	beq $9, $0, saiForB1
	
	addi $9, $9, -1
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 4
	
	j forDesenhaB1
	
saiForB1:
	addi $25, $25, 500
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 500
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 500
	
	addi $9, $0, 3	#ADICIONANDO I PARA O FOR
	
forDesenhaB2:
	beq $9, $0, saiForB2
	
	addi $9, $9, -1
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 4
	
	j forDesenhaB2
	
saiForB2:
	addi $25, $25, 500
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 500
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 500
	
	addi $9, $0, 3	#ADICIONANDO I PARA O FOR
	
forDesenhaB3:
	beq $9, $0, saiForB3
	
	addi $9, $9, -1
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 4
	
	j forDesenhaB3
	
saiForB3:
	
saiFuncDesenhaLetraB:
	jr $31
	
#====================================

#====================================
#Nome: funcDesenhaC
#Utilidade: desenha a letra C a partir de um endere�o de mem�ria previamente iniciado
#Par�metro: $4 (ENDERE�O DE MEM�RIA), $5(COR DE DESENHO)
#Retorno:
funcDesenhaC:
	add $25, $4, $0	#ENDERE�O EM QUE COME�AR� O DESENHO DA LETRA C
	
	addi $9, $0, 4	#ADICIONANDO I PARA O FOR

forC1:	beq $9, $0, saiforC1

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $9, $9, -1
	
	addi $25, $25, 4
	
	j forC1
	
saiforC1:
	addi $25, $25, 492
	
	addi $9, $0, 5
	
forC2:  beq $9, $0, saiforC2

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 512

	addi $9, $9, -1
	
	j forC2

saiforC2:
	addi $25, $25, 4	

	addi $9, $0, 4
	
forC3:  beq $9, $0, saiforC3

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O

	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forC3

saiforC3:
	
	
saiFuncDesenhaC:
	jr $31
	
#====================================

#====================================
#Nome: funcDesenhaD
#Utilidade: desenha a letra D a partir de um endere�o de mem�ria previamente iniciado
#Par�metro: $4 (ENDERE�O DE MEM�RIA), $5(COR DE DESENHO)
#Retorno:
funcDesenhaD:
	add $25, $4, $0	#ENDERE�O EM QUE COME�AR� O DESENHO DA LETRA D
	
	addi $9, $0, 3
	
forD1:  beq $9, $0, saiD1

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forD1

saiD1:  addi $25, $25, 500
	
	addi $9, $0, 5

forD2:	beq $9, $0, saiD2

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $9, $9, -1
	
	addi $25, $25, 500
	
	j forD2

saiD2:	addi $9, $0, 3

forD3:  beq $9, $0, saiD3

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forD3
	
saiD3:

saiFuncDesenhad: 
	jr $31
	
#ESPA�O DAS FUN��ES DE DESENHOS DE PE�AS >:(
#>=====================================================================

#====================================
#Nome: funcDesenhaTorre
#Utilidade: desenha a torre a partir de um endere�o de mem�ria previamente iniciado
#Par�metro: $4 (ENDERE�O DE MEM�RIA), $5(COR DE DESENHO)
#Retorno: 
funcDesenhaTorre:	  

addi $9, $0, 3	#REINICIALIZANDO O $9 PARA USO
  
t1:	  add $25, $4, $0	#PULANDO PARA A PR�XIMA LINHA, ONDE INICIAREMOS O DESENHO DA TORRE

fortorre: beq $9, $0, sait1	#SE $9 = 0, ENT�O SAI DESSE FOR

	  sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	  
	  addi $9, $9, -1	#DECREMENTANDO $9
	  
	  addi $25, $25, 8	#PULANDO 2 ESPA�OS DE MEM�RIA
	  
	  j fortorre
	  
sait1:	  addi $25, $25, 488	#PULANDO PARA A PR�XIMA LINHA, ONDE SER� CONTINUADA A PINTURA DA TORRE
	  
	  addi $9, $0, 5	#REINICIALIZANDO PARA O USO NO FOR
	  
	  addi $13, $0, 1	#USANDO PARA PULAR LINHA
	   
fortorre2: beq $9, $0, pulaLtorre #SE $9=0, ENT�O DEVE-SE PULAR A LINHA PARA CONTINUAR A PINTURA DA TORRE
	   
	   sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	   
	   addi $9, $9, -1	#DECREMENTANDO DO $9 QUE � O N�MERO DE COLUNAS
	   
	   addi $25, $25, 4	#PULANDO PARA O PR�XIMO ENDERE�O
	   
	   j fortorre2
	   
pulaLtorre: beq $13, $0, sait3	#SE $13 = 0, ENT�O A PINTURA TERMINOU
	    
	    addi $13, $13, -1   #DECREMENTA O N�MERO DE LINHAS ($13)
	    
	    addi $25, $25, 492	#PULA PARA A PR�XIMA LINHA
	    
	    addi $9, $0, 5	#REINICIA A QUANTIDADE DE COLUNAS
	    
	    j fortorre2
	    
sait3:	    addi $25, $25, 496	#PULA PARA A PR�XIMA LINHA
	
	    addi $9, $0, 3	#REINICIALIZANDO PARA O USO NO FOR
	  
	    addi $13, $0, 1	#USANDO PARA PULAR LINHA
	    
fortorre3: beq $9, $0, pulaLtorre2 #SE $9=0, ENT�O DEVE-SE PULAR A LINHA PARA CONTINUAR A PINTURA DA TORRE
	   
	   sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	   
	   addi $9, $9, -1	#DECREMENTANDO DO $9 QUE � O N�MERO DE COLUNAS
	   
	   addi $25, $25, 4	#PULANDO PARA O PR�XIMO ENDERE�O
	   
	   j fortorre3
	   
pulaLtorre2: beq $13, $0, sait4	#SE $13 = 0, ENT�O A PINTURA TERMINOU
	    
	    addi $13, $13, -1   #DECREMENTA O N�MERO DE LINHAS ($13)
	    
	    addi $25, $25, 500	#PULA PARA A PR�XIMA LINHA
	    
	    addi $9, $0, 3	#REINICIA A QUANTIDADE DE COLUNAS
	    
	    j fortorre3

sait4:	    addi $25, $25, 496	#PULA PARA A PR�XIMA LINHA
	
	    addi $9, $0, 5
	    
fortorre5:  beq $9, $0, saitorre

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	    addi $9, $9, -1	#DECREMENTANDO A QUANTIDADE DE COLUNAS
	    
	    addi $25, $25, 4	#PULANDO PARA O PR�XIMO ENDERE�O
	    
	    j fortorre5
	    
saitorre:   jr $31

#====================================

#====================================
#Nome: funcDesenhaCavalo
#Utilidade: desenha um cavalo a partir de um endere�o de mem�ria previamente iniciado
#Par�metro: $4 (ENDERE�O DE MEM�RIA), $5(COR DE DESENHO)
#Retorno: 
funcDesenhaCavalo:	  

addi $9, $0, 4	#REINICIALIZANDO O $9 PARA USO

c1:	    add $25, $4, $0	#PULANDO PARA ONDE INICIAREMOS O DESENHO DO CAVALO

forcavalo:  beq $9, $0, saic1

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	    addi $9, $9, -1	#DECREMENTANDO $9
	    
	    addi $25, $25, 4
	    
	    j forcavalo
	    
saic1:	    addi $25, $25, 500	#PULANDO PARA A PR�XIMA LINHA, ONDE SER� CONTINUADA A PINTURA DO CAVALO

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	    addi $25, $25, 8	#PULANDO PARA DEIXAR UM PONTO EM BRANCO (OLHO DO CAVALO)
	    
	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	    addi $25, $25, 504	#PULANDO PARA A PR�XIMA LINHA, ONDE SER� CONTINUADA A PINTURA DO CAV
	    
	    addi $9, $0, 4	#REINICIANDO PARA UTILIZAR NA CONSTRU��O DO CAVALO
	    
forcavalo3: beq $9, $0, saic3

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	    addi $9, $9, -1	#DECREMENTANDO $9
	    
	    addi $25, $25, 4
	    
	    j forcavalo3

saic3:      addi $25, $25, 496	#PULANDO PARA A PR�XIMA LINHA, ONDE SER� CONTINUADA A PINTURA DO CAVALO

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	    addi $25, $25, 4
	    
	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	    addi $25, $25, 8
	    
	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	    addi $25, $25, 512
	    
	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	    addi $25, $25, 496

	    addi $9, $0, 5	#ADICIONANDO PARA O FOR	     
	    
forcavalo8:  beq $9 $0 saicavalo

             sw $5, 0($25) 

	     addi $25 $25 4
          
             addi $9 $9 -1
             j forcavalo8
  

saicavalo:   jr $31

#====================================

#====================================
#Nome: funcDesenhaBispo
#Utilidade: desenha um bispo a partir de um endere�o de mem�ria previamente iniciado
#Par�metro: $4 (ENDERE�O DE MEM�RIA), $5(COR DE DESENHO)
#Retorno: 

funcDesenhaBispo:

		
b1:	    add $25, $4, $0	#INDO PARA ONDE INICIAREMOS O DESENHO DA TORRE

	    addi $25, $25, 8	#PULANDO 2 ENDERE�OS DE MEM�RIA PARA FICAR BONITINHO O DESENHO
	    
	    addi $9, $0, 3	#ADICIONANOD PARA O FOR DO BISPO

forbispo1:  beq $9, $0, saib1	#SE $9 = 0 SAI DO FOR
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 4	#PULANDO PARA O PROX ENDERE�O DE MEM�RIA
	    
	    addi $9, $9, -1	#DECREMENTANDO $9
	    
	    j forbispo1
	    
saib1:	    addi $25, $25, 500  #PULANDO PARA A PR�XIMA LINHA

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 8	#DEIXANDO UM PIXEL EM "BRANCO"
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 500	#PULANDO PARA A PR�XIMA LINHA
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 16	#DEIXANDO 3 PIXEIS EM BRANCO
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 496  #PULANDO PARA A PR�XIMA LINHA

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 4	#PULANDO ENDERE�O DE MEM�RIA
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 8	#DEIXANDO UM PIXEL EM "BRANCO"
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 4	#PULANDO ENDERE�O DE MEM�RIA
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL

saib3:	    addi $25, $25, 500	  #PULANDO PARA A PR�XIMA LINHA
	   
	    addi $9, $0, 3	#ADICIONANOD PARA O FOR 2 DO BISPO
	    
	    addi $13, $0, 2	#ADICIONANDO CONTADOR DE LINHAS PARA O FOR 2 DO BISPO
	    
forb4:	    beq $13, $0, saibispo
	    beq $9, $0, pulaLbispo2
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 4	#PULANDO PARA O PROX ENDERE�O DE MEM�RIA
	    
	    addi $9, $9, -1
	    
	    j forb4

pulaLbispo2: addi $13, $13, -1	#DECREMENTA A QUANT DE LINHAS
            
            addi $25, $25, 496	#PULA PARA PROX LINHA
            
            addi $9, $0, 5	#REINICIA AS COLUNAS
            
            j forb4

saibispo: jr $31
#====================================

#====================================
#Nome: funcDesenhaRainha
#Utilidade: desenha uma rainha a partir de um endere�o de mem�ria previamente iniciado
#Par�metro: $4 (ENDERE�O DE MEM�RIA), $5(COR DE DESENHO)
#Retorno:

funcDesenhaRainha:

rainha:     

	    add $25, $4, $0	#PULANDO PARA A PR�XIMA LINHA, ONDE INICIAREMOS O DESENHO DA RAINHA

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 8
	    
	    sw $5 0($25)
	    
	    addi $25, $25, 8
	    
	    sw $5 0($25)
	    
	    addi $25, $25, 500	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA
	    
	    
	    
	    addi $9, $0, 3	#ADICIONANDO PARA O FOR DA RAINHA
	    
forrainha:  beq $9, $0, sair1   #QUANDO $9 = 0 SAI DO FOR

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 4	#PULANDO PARA O PROX ENDERE�O DE MEM�RIA
	    
	    addi $9, $9 -1
	    
	    j forrainha
	    
sair1:	    addi $25, $25, 504	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 508	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA
	    
	    addi $9, $0, 3	#ADICIONANDO PARA O FOR
	    
	    addi $13, $0, 2	#ADICIONANDO PARA CONTAGEM DE COLUNAS
	    
forrainha3: beq $13, $0, sair3	    #SE $13 = 0, SAI DO FOR
	    beq $9, $0, pulaLrainha #SE $9 = 0, DEVE-SE PULAR A LINHA
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25 4	#PULANDO PARA O PROX ENDERE�O DE MEM�RIA
	    
	    addi $9, $9, -1
	    
	    j forrainha3
	    
pulaLrainha: addi $13, $13, -1	#DECREMENTA O $13

	     addi $25, $25, 500	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA
	     
	     addi $9, $9, 3	#REINICIANDO A QUANT COLUNAS
	     
	     j forrainha3
	     
sair3:	     addi $25, $25, -4	#VOLTANDO UM ENDERE�O DE MEM�RIA

	     addi $9, $0, 5	#ADICIONANDO PARA O FOR

forrainha4:  beq $9, $0, sairrainha	#$9 = 0 SAI DO FOR
	     
	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	     
	     addi $25, $25, 4
	     
	     addi $9, $9, -1	
	     
	     j forrainha4
	
sairrainha:	jr $31

#====================================

#====================================
#Nome: funcDesenhaRei
#Utilidade: desenha um rei a partir de um endere�o de mem�ria previamente iniciado
#Par�metro: $4 (ENDERE�O DE MEM�RIA), $5(COR DE DESENHO)
#Retorno:

funcDesenhaRei:
rei:	     add $25, $4, $0 #MOVENDO PARA A CASA DE POSI��O DO REI

	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	     
	     addi $25, $25, 508	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DO REI
	     
	     addi $9, $0, 3	#ADICIONANDO PARA O FOR
	    
forrei1:     beq $9, $0, saire1	#QUANDO $9 = 0, SAI DO FOR

	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	     
	     addi $25, $25, 4	#ADICIONANDO PARA O PROX ENDERE�O DE MEMORIA
	     
	     addi $9, $9, -1
	     
	     j forrei1
	     
saire1:	     addi $25, $25, 504	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DO REI
	     
	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL

	     addi $25, $25, 508	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DO REI
	     
	     addi $9, $0, 3
	     
	     addi $13, $0, 2	#ADICIONANDO A QUANT DE LNIHA E COL DO FOR
	     
forrei2:     beq $13, $0, saire2 #SE $13 = 0 SAI DO FOR
	     beq $9, $0, pulaLrei1 #SE $9 = 0, PULA PARA PROX LINHA
	     
	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	     
	     addi $25, $25, 4
	     
	     addi $9, $9, -1
	     
	     j forrei2
	    
pulaLrei1:   addi $13, $13, -1	#REDUZINDO A QUANT DE LINHAS
 	     
 	     addi $25, $25, 500	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DO REI
 	     
 	     addi $9, $0, 3
 	     
 	     j forrei2
 	     
saire2:	     addi $25, $25, -4

	     addi $9, $0, 5
	     
forrei3:     beq $9, $0, sairei
	     
	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	     
	     addi $25, $25, 4	#PULANDO PARA O PROX ENDERE�O DE MEMORIA
	     
	     addi $9, $9, -1	#DECREMENTANDO DO I DO FOR
	     
	     j forrei3

sairei:	     jr $31
#====================================

#====================================
#Nome: funcDesenhaPe�o
#Utilidade: desenha um pe�o a partir de um endere�o de mem�ria previamente iniciado
#Par�metro: $4 (ENDERE�O DE MEM�RIA), $5(COR DE DESENHO)
#Retorno:
funcDesenhaPeao:
	add $25 $0 $4 #COME�O DA FUNCDOPEAO
           
        addi $9 $0 3 #iN�CIO DA CABE�A DO PE�O QUE TER� 4 UNIDADES GR�FICAS
        
        addi $13, $0, 3	#ADICIONANDO PARA O PULALINHA
 
forp1: 	beq $13 $0 saiforpeao1  
	beq $9, $0, pulaLinhaPeao     
        addi $9 $9 -1
        
        sw $5 0($25)   # PINTA COM A COR DE ENTRADA O PIXEL
        
        addi $25 $25 4
        j forp1
        
pulaLinhaPeao:
	addi $9, $0, 3
	
	addi $25, $25, 500
	
	addi $13, $13, -1
	
	j forp1
        
saiforpeao1:
	addi $25, $25, 4
	
	sw $5 0($25)   # PINTA COM A COR DE ENTRADA O PIXEL
	
	addi $25, $25, 508
	
	addi $9, $0, 3
	
forp2:	beq $9, $0, saiforpeao2
	
	addi $9, $9, -1
	
	sw $5 0($25)   # PINTA COM A COR DE ENTRADA O PIXEL
	
	addi $25, $25, 4
	
	j forp2
	
saiforpeao2:
	addi $25, $25, 496
	
	addi $9, $0, 5
	
forp3:	beq $9, $0, saipeaofunc
	
	addi $9, $9, -1
	
	sw $5 0($25)   # PINTA COM A COR DE ENTRADA O PIXEL
	
	addi $25, $25, 4
	
	j forp3

saipeaofunc: 
	jr $31
#====================================

#<=====================================================================
