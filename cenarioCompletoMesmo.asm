.text
#NOTA DE VINICIUS: NA HORA DE DESENHAR AS PEÇAS, SEMPRE SOME O ENDEREÇO DA ÚLTIMA +64 PARA O DESENHO DA PRÓXIMA PEÇA
#EX.: O DESENHO DA TORRE COMEÇOU NO ENDEREÇO 1552, ENTÃO O DO CAVALO COMEÇARÁ NO 1616, O DO BISPO NO 1680 E ASSIM EM DIANTE



main:	lui $25, 0x1001		#INICIALIZANDO O ENDEREÇO DE MEMÓRIA INICIAL
	addi $25, $25, 16
	addi $25, $25, 2048
	addi $10, $0, 0xf3ddcf	#INICIALIZANDO A COR VERDE
	addi $11, $0, 0x1b7a47	#INICIALIZANDO A COR AMARELO CLARO
	addi $16, $0, 0x000000	#INICIALIZANDO A COR PRETA EM HEXA
	addi $17, $0, 0x92b1f0	#INICIALIZANDO A COR BRANCA EM HEXA
        addi $12, $0, 0         #CONTADOR DE CHAMADA DE FUNÇÃO    
        
        addi $18, $0, 10	#VARIAVEL FIXA
        
        addi $15, $0, 0		#CONTADOR	
	
	addi $9, $0, 596	#UNIDADES GRÁFICAS
	addi $13, $0, 1436	#ALTURA DO QUADRADO
	
for:	slt $14, $13, $0	#SE $14 = 1, ENTÃO PULA PRA MUDACOR TAMBÉM
	beq $15, $18, faz
        bne $15, $18, faz2
	 
faz:	addi $25, $25, 32
	 
	addi $15, $0, 0
	 
faz2:  	addi $15, $15, 1
	beq $13, $0, mantercor	#SE UMA LINHA INTEIRA FOR PINTADA, ENTÃO PULA-SE PARA PRÓXIMA LINHA COM A MESMA COR DA ANTIGA
	bne $14, $0, mantercor	#SE UMA LINHA INTEIRA FOR PINTADA, ENTÃO PULA-SE PARA PRÓXIMA LINHA COM A MESMA COR DA ANTIGA
	beq $9, $0, continua		
	
	addi $9, $9, -1
	
	addi $12, $0, 12	#VERIFICANDO A QUANTIDADE DE PIXEIS A SEREM PINTADOS POR COR
	

		
formar: beq $12, $0, next	#VERIFICAÇÃO DO FIM DO FOR

	sw $10, 0($25)		#DESENHANDO NO BITMAP
	sw $10, 65536($25)	#DESENHANDO NA SHADOW
	
	addi $25, $25, 4	#PASSANDO PARA O PRÓXIMO ENDEREÇO DE MEMÓRIA
	
	addi $12, $12, -1
	
	addi $13, $13, -1	#REDUZINDO UMA UNIDADE GRÁFICA DA LINHA
	
	add $8, $0, $10		#ADICIONANDO A COR NA VARIÁVEL AUXILIAR
	
	j formar

next:	addi $12, $0, 12	#REINICIALIZANDO A QUANTIDADE DE UNIDADES GRÁFICAS A SEREM PINTADAS

	beq $15, $18, faz3
        bne $15, $18, faz4

faz3:	addi $25, $25, 32
	 
	addi $15, $0, 0
	 
faz4:  	addi $15, $15, 1
	
forpre: beq $12, $0, for	#VERIFICAÇÃO DO FIM DO FOR

	sw $11, 0($25)		#DESENHANDO NO BITMAP
	sw $11, 65536($25)	#DESENHANDO NA SHADOW
	
	addi $25, $25, 4	#PASSANDO PARA O PRÓXIMO ENDEREÇO DE MEMÓRIA
	addi $12, $12, -1
	
	addi $13, $13, -1	#REDUZINDO UMA UNIDADE GRÁFICA DA LINHA
	
	add $8, $0, $11		#ADICIONANDO A COR NA VARIÁVEL AUXILIAR
	
	j forpre
	
mantercor: addi $12, $0, 12	#REINICIALIZANDO A QUANTIDADE DE UNIDADES GRÁFICAS A SEREM PINTADAS
	 addi $13, $0, 1436	#REINICIALIZANDO A QUANTIDADE DE UNIDADES GRÁFICAS POR LINHA
	 
	 beq $8, $11, forpre
	 beq $8, $10, formar
	 
continua: lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL

	  addi $4, $25, 9296	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHATORRE
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHATORRE

	  jal funcDesenhaTorre	#FUNÇÃO DESENHA TORRE
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 9340	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHACAVALO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHACAVALO
	  
	  jal funcDesenhaCavalo	#FUNÇÃO DESENHA CAVALO

	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 9388	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHACAVALO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHABISPO
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 9436	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHARAINHA
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHARAINHA
	  
	  jal funcDesenhaRainha
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 9492	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHAREI
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHAREI
	  
	  jal funcDesenhaRei
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 9532	#ADICIONANDO PARA ENVIAR PARA A FUNC REI
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC REI
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 9580	#ADICIONANDO PARA ENVIAR PARA A FUNC BISPO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC BISPO
	  
	  jal funcDesenhaCavalo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 9628	#ADICIONANDO PARA ENVIAR PARA A FUNC CAVALO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC CAVALO
	  
	  jal funcDesenhaTorre
	  
	  addi $10, $0, 15956	#ADICIONANDO PARA CONTAR OS ENDEREÇOS DE MEMÓRIA DO PEÃO
	  
	  addi $15, $0, 8	#ADICIONANDO PARA O FOR
	  
forpeaomain: beq $15, $0, saiForDesenhaPeao 
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  add $4, $25, $10	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHSAPEAO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHSAPEAO
	  
	  addi $10, $10, 48
	  
	  addi $15, $15, -1
	  
	  jal funcDesenhaPeao
	  
	  j forpeaomain


saiForDesenhaPeao:

	  addi $10, $0, 46676	#ADICIONANDO PARA CONTAR OS ENDEREÇOS DE MEMÓRIA DO PEÃO
	  
	  addi $15, $0, 8	#ADICIONANDO PARA O FOR

forDesenhaPeao2:  
	
	  beq $15, $0, saiForDesenhaPeao2
	  
	  addi $15, $15, -1
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  add $4, $25, $10	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHSAPEAO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRANCA PARA A FUNC DESENHSAPEAO
	  
	  jal funcDesenhaPeao
	  
	  addi $10, $10, 48
	  
	  j forDesenhaPeao2

saiForDesenhaPeao2:

	  lui $25, 0x1001	#REINICIANDO PARA O ENDEREÇO DE MEMÓRIA INICIAL

	  addi $4, $25, 52816	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHATORRE
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRANCA PARA A FUNC DESENHATORRE

	  jal funcDesenhaTorre	#FUNÇÃO DESENHA TORRE

	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 52864	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHACAVALO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRANCA PARA A FUNC DESENHACAVALO
	  
	  jal funcDesenhaCavalo	#FUNÇÃO DESENHA CAVALO
	  
	   lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 52908	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHABISPO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRAMCA PARA A FUNC DESENHABISPO
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 52960	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHARAINHA
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHARAINHA
	  
	  jal funcDesenhaRainha
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 53016	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHAREI
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHAREI
	  
	  jal funcDesenhaRei
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 53052	#ADICIONANDO PARA ENVIAR PARA A FUNC REI

	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC REI
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 53104	#ADICIONANDO PARA ENVIAR PARA A FUNC BISPO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC BISPO
	  
	  jal funcDesenhaCavalo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 53152	#ADICIONANDO PARA ENVIAR PARA A FUNC CAVALO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC CAVALO
	  
	  jal funcDesenhaTorre
	  
	  #DESENHANDO AS LETRAS:
	  
	  #LETRA A DE AMOR
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL

	  addi $4, $25, 3156	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA A
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA A

	  jal funcDesenhaA	#FUNÇÃO DESENHA A
	  
	  #LETRA B DE BOLA
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL

	  addi $4, $25, 3200	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA B
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA B

	  jal funcDesenhaB	#FUNÇÃO DESENHA B
	  
	  #LETRA C DE CAMALEÃO
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL

	  addi $4, $25, 3248	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA C
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA C

	  jal funcDesenhaC	#FUNÇÃO DESENHA C
	  
	  #LETRA D DE DADO
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 3292	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA D
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA D

	  jal funcDesenhaD	#FUNÇÃO DESENHA D
	  
	  #LETRA E DE ELEFANTE
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 3344	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA E
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA E

	  jal funcDesenhaE	#FUNÇÃO DESENHA E
	  
	  #LETRA F DE FINICIUS
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 3392	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA F
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA F
	  
	  jal funcDesenhaF	#FUNÇÃO DESENHA F
	  
	  #LETRA G DE GAVALO
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 3440	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA G
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA G
	  
	  jal funcDesenhaG	#FUNÇÃO DESENHA G
	  
	  #LETRA H DE HIPOTOTOMO
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 3488	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA H
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA H
	  
	  jal funcDesenhaH	#FUNÇÃO DESENHA H
	  
	  #DESENHO DOS NUMEROS
	  
	  #NUM1
	  lui $25 0x1001
	  
	  addi $4 $25 52780
	  
	  add $5 $0 $16
	  
	  jal funcDesenha1
	  
	  #NUM 2
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 46624	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA 2
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA 2
	  
	  jal funcDesenha2	#FUNÇÃO DESENHA 2
	  
	  #NUM 3
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 40480	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA 3
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA 3
	  
	  jal funcDesenha3	#FUNÇÃO DESENHA 3
	  
	  #NUM 4
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 34336	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA 4
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA 4
	  
	  jal funcDesenha4	#FUNÇÃO DESENHA 4
	  
	  #NUM 5
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 28192	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA 6
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA 6
	  
	  jal funcDesenha5	#FUNÇÃO DESENHA 6
	  
	  #NUM 6
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 22048	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA 6
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA 6
	  
	  jal funcDesenha6	#FUNÇÃO DESENHA 6
	  
	  #NUM 7
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 15904	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA 7
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA 7
	  
	  jal funcDesenha7	#FUNÇÃO DESENHA 7
	  
	  #NUM 8
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 9760	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHA 8
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHA 8
	  
	  jal funcDesenha8	#FUNÇÃO DESENHA 8
	  
	  #MOVIMENTO----------------------------------------
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA
	  
	  addi $9, $0, 3	#CONTAGEM DA QUANTIDADE DE UNIDADES GRÁFICASS
	  
	  addi $14, $0, 5
	  
	  addi $25, $25, 46676	#LOCAL ONDE O PEÃO AZUL É DESENHADO

forcabeca: beq $9, $0, proxMove
	  
	  lw $23, 65536($25)	#CARREGANDO O ENDEREÇO DA SHADOW PARA O $23
	  
	  addi $25, $25, -512	#PEGANDO O ELEMENTO DA LINHA DE BAIXO E MOVENDO PARA CIMA
	  
	  sw $23, 0($25)	#DESENHANDO ESSE ELEMENTO NA TELA
	  
	  addi $25, $25, 4
	  
	  addi $25, $25, 512
	  
	  addi $9, $9, -1
	  
	  j forcabeca 
	     
proxMove:
	  addi $25, $25, 1524
	  
	  addi $9, $0, 3	#CONTAGEM DA QUANTIDADE DE UNIDADES GRÁFICASS
	  
movepixel: beq $9, $0, proxMove1

	  lw $23, 65536($25)	#CARREGANDO O ENDEREÇO DA SHADOW PARA O $23
	  
	  addi $25, $25, -512	#PEGANDO O ELEMENTO DA LINHA DE BAIXO E MOVENDO PARA CIMA
	  
	  sw $23, 0($25)	#DESENHANDO ESSE ELEMENTO NA TELA 
	  
	  addi $25, $25, 4
	  
	  addi $25, $25, 512
	  
	  addi $9, $9, -1
	  
	  j movepixel
proxMove1:
	  addi $25, $25, 500

	  addi $9, $0, 3
	  
movepixel2: beq $9, $0, proxMove2

	  lw $23, 65536($25)	#CARREGANDO O ENDEREÇO DA SHADOW PARA O $23
	  
	  addi $25, $25, -512	#PEGANDO O ELEMENTO DA LINHA DE BAIXO E MOVENDO PARA CIMA
	  
	  sw $23, 0($25)	#DESENHANDO ESSE ELEMENTO NA TELA 
	  
	  addi $25, $25, 4
	  
	  addi $25, $25, 512
	  
	  addi $9, $9, -1
	  
	  j movepixel2	 
	 
proxMove2:
	  addi $25, $25, 496

	  addi $9, $0, 5
	  
movebase: beq $9, $0, saibase
	
	  lw $23, 65536($25)	#CARREGANDO O ENDEREÇO DA SHADOW PARA O $23
	  
	  addi $25, $25, -512	#PEGANDO O ELEMENTO DA LINHA DE BAIXO E MOVENDO PARA CIMA
	  
	  sw $23, 0($25)	#DESENHANDO ESSE ELEMENTO NA TELA 
	  
	  addi $25, $25, 4
	  
	  addi $25, $25, 512
	  
	  addi $9, $9, -1
	  
	  j movebase
saibase:  addi $25, $25, -20
	  
	  addi $9, $0, 5
	  
pintaprox:beq $9, $0, fim

	 addi $25, $25, 512

	 lw $23, 65536($25)	#CARREGANDO O ENDEREÇO DA SHADOW PARA O $23
	 
	 addi $25, $25, -512	#PEGANDO O ELEMENTO DA LINHA DE BAIXO E MOVENDO PARA CIMA
	  
	  sw $23, 0($25)	#DESENHANDO ESSE ELEMENTO NA TELA 
	  
	  addi $25, $25, 4
	  
	  addi $9, $9, -1
	  
	  j pintaprox
	                                                                                  		                                                                                  
	  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
fim:	addi $2, $0, 10
	syscall

#ESPAÇO DAS FUNÇÕES DE DESENHOS DE NÚMEROS >:(
#>=====================================================================
#Nome: funcDesenha1
#Utilidade: desenha a 1 a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenha1:
           add $25 $0 $4
           addi $9 $0 7
   for1num:beq $9 $0 sai1num      
           sw $5, 0($25)
           sw $5, 65536($25)
            		 		
	   addi $25 $25 512
	   
	   addi $9 $9 -1
           j for1num
   sai1num: jr $31
 
#====================================
#Nome: funcDesenha2
#Utilidade: desenha o num 2 a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenha2:
	add $25, $4, $0	#ENDEREÇO EM QUE COMEÇARÁ O DESENHO DO NUM 2
	
	addi $9, $0,4
	
forDois1: beq $9, $0, saiForDois1

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forDois1

saiForDois1:
	addi $25, $25, 508
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 512
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 500
	
	addi $9, $0, 4
	
forDois2: beq $9, $0, saiForDois2

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forDois2

saiForDois2:
	addi $25, $25, 496
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 512
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 512
	
	addi $9, $0, 4
	
forDois3: beq $9, $0, saiForDois3

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forDois3

saiForDois3:

saiFuncDesenha2:
	jr $31
	
#====================================
#Nome: funcDesenha3
#Utilidade: desenha o num 3 a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenha3:
	add $25, $4, $0	#ENDEREÇO EM QUE COMEÇARÁ O DESENHO DA LETRA A
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $9, $0, 4
	
forTres1: beq $9, $0, saiForTres1

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $9, $9, -1
	
	addi $25, $25, 4
	
	j forTres1

saiForTres1:
	addi $25, $25, 508
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 512
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 504
	
	addi $9, $0, 3
	
forTres2: beq $9, $0, saiForTres2

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $9, $9, -1
	
	addi $25, $25, 4
	
	j forTres2
	
saiForTres2:
	addi $25, $25, 508
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 512
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 500
	
	addi $9, $0, 4
	
forTres3: beq $9, $0, saiForTres3

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $9, $9, -1
	
	addi $25, $25, 4
	
	j forTres3
	
saiForTres3:
	
saiFuncDesenha3:
	jr $31
	
#====================================
#Nome: funcDesenha4
#Utilidade: desenha o num 4 a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenha4:

	add $25, $4, $0	#ENDEREÇO EM QUE COMEÇARÁ O DESENHO DA LETRA A
	
	addi $9, $0, 3
	
forQuatro1: beq $9, $0, saiForQuatro1
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $9, $9, -1
	
	addi $25, $25, 500
	
	j forQuatro1

saiForQuatro1:
	addi $9,$0, 4
	
forQuatro2: beq $9, $0, saiForQuatro2
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forQuatro2

saiForQuatro2:
	addi $9, $0, 3
	
	addi $25, $25, 508
	
forQuatro3: beq $9, $0, saiForQuatro3

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 512
	
	addi $9, $9, -1
	
	j forQuatro3
	
saiForQuatro3:

saiFuncDesenha4:
	jr $31
#====================================
#Nome: funcDesenha5
#Utilidade: desenha o num 5 a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenha5: add $25 $0 $4
              addi $9 $0 4
              
for5num: beq $9 $0 sai5num
         sw $5 0($25)
         sw $5, 65536($25)
         addi $25 $25 4
         addi $9 $9 -1
         j for5num
                 
sai5num: addi $25 $25 496
         addi $9 $0 2
         
for5num2: beq $9 $0 sai5num1
          sw $5 0($25)
          sw $5, 65536($25)
          addi $9 $9 -1
          
          addi $25, $25, 512
          j for5num2
          
sai5num1: addi $9, $0, 4

for5num3:  beq $9, $0, sai5num2
	   sw $5 0($25)
	   sw $5, 65536($25)
	   addi $9 $9 -1
          
          addi $25, $25, 4
          j for5num3
	
sai5num2: addi $25 $25 508
          addi $9 $0 2
         
for5num4: beq $9 $0 sai5num3
          sw $5 0($25)
          sw $5, 65536($25)
          addi $9 $9 -1
          
          addi $25, $25, 512
          j for5num4
          
sai5num3: addi $25 $25 -12
	  addi $9, $0, 4
	  
for5num5: beq $9, $0, sai5num4
	  sw $5 0($25)
	  sw $5, 65536($25)
          addi $9 $9 -1
          
          addi $25, $25, 4
          
          j for5num5

sai5num4:
            
sai53num: jr $31
	
#====================================
#Nome: funcDesenha6
#Utilidade: desenha o num 6 a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenha6:

	add $25, $4, $0	#ENDEREÇO EM QUE COMEÇARÁ O DESENHO DO NUM 6
	
	addi $9, $0, 4
	
forSeis1: beq $9, $0, saiForSeis1

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forSeis1

saiForSeis1:
	addi $25, $25, 496
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 512
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25) 
	
	addi $25, $25, 512
	
	addi $9, $0, 4
	
	addi $13, $0, 1
	
forSeis2: beq $13, $0, saiForSeis2
	  beq $9, $0, pulaLinhasSeis	 
	  
	  sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	  sw $5, 65536($25)
	  
	  addi $9, $9, -1
	  
	  addi $25, $25, 4
	  
	  j forSeis2
	  
pulaLinhasSeis:
	  addi $9, $0, 4
	  
	  addi $13, $13, -1
	  
	  addi $25, $25, 496
	  
	  sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	  sw $5, 65536($25)
	  
	  addi $25, $25, 12
	  
	  sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	  sw $5, 65536($25)
	  
	  addi $25, $25, 500
	  
	  sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	  sw $5, 65536($25)
	  
	  addi $25, $25, 12
	  
	  sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	  sw $5, 65536($25)
	  
	  addi $25, $25, 500
	  
	  j forSeis2
	  
saiForSeis2:
	  addi $9, $0, 4
	  
forSeis3: beq $9, $0, saiForSeis3
	  
	  sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	  sw $5, 65536($25)
	  
	  addi $25, $25, 4
	  
	  addi $9, $9, -1
	  
	  j forSeis3
	
saiForSeis3:
	
saiFuncDesenha6:
	jr $31
	
#====================================
#Nome: funcDesenha7
#Utilidade: desenha o num 7 a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenha7:

	add $25, $4, $0	#ENDEREÇO EM QUE COMEÇARÁ O DESENHO DO NUM 6
	
	addi $9, $0, 3
	
forSete1: beq $9, $0, saiForSete1

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forSete1

saiForSete1:
	addi $9, $0, 3
	
forSete2: beq $9, $0, saiForSete2

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 512
	
	addi $9, $9, -1
	
	j forSete2

saiForSete2:
	addi $25, $25, -4
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 508
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 512
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 512
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)

saiFuncDesenha7:
	jr $31
	
#====================================
#Nome: funcDesenha8
#Utilidade: desenha o num 8 a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenha8:

	add $25, $4, $0	#ENDEREÇO EM QUE COMEÇARÁ O DESENHO DO NUM 6
	
	addi $9, $0, 4	
	
forOito1: beq $9, $0, saiForOito1

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forOito1

saiForOito1:
	addi $25, $25, 496

	addi $9, $0, 2
	
forOito2: beq $9, $0, saiForOito2

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $9, $9, -1
	
	addi $25, $25, 500
	
	j forOito2

saiForOito2:
	addi $9, $0, 4	
	
forOito3: beq $9, $0, saiForOito3

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forOito3

saiForOito3:
	addi $25, $25, 496

	addi $9, $0, 2
	
forOito4: beq $9, $0, saiForOito4

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $9, $9, -1
	
	addi $25, $25, 500
	
	j forOito4

saiForOito4:
	addi $9, $0, 4	
	
forOito5: beq $9, $0, saiForOito5

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forOito5

saiForOito5:
	
saiFuncDesenha8:
	jr $31
			
#ESPAÇO DAS FUNÇÕES DE DESENHOS DE LETRAS >:(
#>=====================================================================
#====================================
#Nome: funcDesenhaA
#Utilidade: desenha a letra A a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenhaA:
	add $25, $4, $0	#ENDEREÇO EM QUE COMEÇARÁ O DESENHO DA LETRA A
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25) 
	
	addi $9, $0, 2
	
	addi $25, $25, 504
	
for1LetraA:
	beq $9, $0, saiForA1
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 12
	
	addi $9, $9, -1
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 500
	
	j for1LetraA
	

saiForA1:
	addi $9, $0, 4
	
for2LetraA:
	beq $9, $0, saiForA2
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO 
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j for2LetraA
	
saiForA2:
	addi $25, $25, 496
	
	addi $9, $9, 3
	
for3LetraA:
	beq $9, $0, saiForA3
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 500
	
	addi $9, $9, -1
	
	j for3LetraA

saiForA3:

saiFuncDesenhaA: 
	jr $31
#====================================

#====================================
#Nome: funcDesenhaB
#Utilidade: desenha a letra B a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:	
funcDesenhaB:
	add $25, $4, $0	#ENDEREÇO EM QUE COMEÇARÁ O DESENHO DA LETRA B
	
	addi $9, $0, 3	#ADICIONANDO I PARA O FOR
	
forDesenhaB1: 
	beq $9, $0, saiForB1
	
	addi $9, $9, -1
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	j forDesenhaB1
	
saiForB1:
	addi $25, $25, 500
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 500
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 500
	
	addi $9, $0, 3	#ADICIONANDO I PARA O FOR
	
forDesenhaB2:
	beq $9, $0, saiForB2
	
	addi $9, $9, -1
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	j forDesenhaB2
	
saiForB2:
	addi $25, $25, 500
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 500
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 500
	
	addi $9, $0, 3	#ADICIONANDO I PARA O FOR
	
forDesenhaB3:
	beq $9, $0, saiForB3
	
	addi $9, $9, -1
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	j forDesenhaB3
	
saiForB3:
	
saiFuncDesenhaLetraB:
	jr $31
	
#====================================

#====================================
#Nome: funcDesenhaC
#Utilidade: desenha a letra C a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenhaC:
	add $25, $4, $0	#ENDEREÇO EM QUE COMEÇARÁ O DESENHO DA LETRA C
	
	addi $9, $0, 4	#ADICIONANDO I PARA O FOR

forC1:	beq $9, $0, saiforC1

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $9, $9, -1
	
	addi $25, $25, 4
	
	j forC1
	
saiforC1:
	addi $25, $25, 492
	
	addi $9, $0, 5
	
forC2:  beq $9, $0, saiforC2

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 512

	addi $9, $9, -1
	
	j forC2

saiforC2:
	addi $25, $25, 4	

	addi $9, $0, 4
	
forC3:  beq $9, $0, saiforC3

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)

	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forC3

saiforC3:
	
	
saiFuncDesenhaC:
	jr $31
	
#====================================

#====================================
#Nome: funcDesenhaD
#Utilidade: desenha a letra D a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenhaD:
	add $25, $4, $0	#ENDEREÇO EM QUE COMEÇARÁ O DESENHO DA LETRA D
	
	addi $9, $0, 3
	
forD1:  beq $9, $0, saiD1

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forD1

saiD1:  addi $25, $25, 500
	
	addi $9, $0, 5

forD2:	beq $9, $0, saiD2

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $9, $9, -1
	
	addi $25, $25, 500
	
	j forD2

saiD2:	addi $9, $0, 3

forD3:  beq $9, $0, saiD3

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forD3
	
saiD3:

saiFuncDesenhad: 
	jr $31
	
#====================================

#====================================
#Nome: funcDesenhaE
#Utilidade: desenha a letra E a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenhaE:
	add $25, $4, $0	#ENDEREÇO EM QUE COMEÇARÁ O DESENHO DA LETRA ES

	addi $9, $0, 4	
	
forE1:  beq $9, $0, saiE1

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forE1

saiE1:	addi $25, $25, 496

	addi $9, $0, 2

forE2:	beq $9, $0, saiE2

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 512
	
	addi $9, $9, -1
	
	j forE2
	
saiE2:	addi $9, $0, 4
	
forE3:  beq $9, $0, saiE3

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forE3

saiE3:	addi $25, $25, 496

	addi $9, $0, 2
	
forE4:	beq $9, $0, saiE4

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 512
	
	addi $9, $9, -1
	
	j forE4
	
saiE4:	addi $9, $0, 4

forE5:  beq $9, $0, saiE5

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forE5

saiE5:
	
saiFuncDesenhaE:
	jr $31
	
#====================================
#Nome: funcDesenhaF
#Utilidade: desenha a letra F a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenhaF:
	add $25, $4, $0	#ENDEREÇO EM QUE COMEÇARÁ O DESENHO DA LETRA F

	addi $9, $0, 4	
	
forF1:  beq $9, $0, saiF1

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forF1

saiF1:	addi $25, $25, 496

	addi $9, $0, 2

forF2:	beq $9, $0, saiF2

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 512
	
	addi $9, $9, -1
	
	j forF2
	
saiF2:	addi $9, $0, 4
	
forF3:  beq $9, $0, saiF3

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forF3

saiF3:	addi $25, $25, 496

	addi $9, $0, 3
	
forF4:	beq $9, $0, saiF4

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 512
	
	addi $9, $9, -1
	
	j forF4
	
saiF4:
	
saiFuncDesenhaF:
	jr $31	
	
#====================================
#Nome: funcDesenhaG
#Utilidade: desenha a letra G a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenhaG:
	add $25, $4, $0	#ENDEREÇO EM QUE COMEÇARÁ O DESENHO DA LETRA G
	
	addi $9, $0, 4

forG1:	beq $9, $0, saiG1

	 sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	 sw $5, 65536($25)
	 
	 addi $25, $25, 4
	 
	 addi $9, $9, -1
	 
	 j forG1
	 
saiG1:	 addi $25, $25, 496

	 addi $9, $0, 3
	 
forG2:	beq $9, $0, saiG2

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 512
	
	addi $9, $9, -1
	
	j forG2
	
saiG2:	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)

	
	addi $25, $25, 8
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 500
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 500
	
	addi $9, $0, 4
	
forG3:	beq $9, $0, saiG3

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forG3
	
saiG3:
	
saiFuncDesenhaG:
	jr $31
	
#====================================
#Nome: funcDesenhaH
#Utilidade: desenha a letra H a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenhaH:	
	add $25, $4, $0	#ENDEREÇO EM QUE COMEÇARÁ O DESENHO DA LETRA H
	
	addi $9, $0, 3
	
forH1:	beq $9, $0, saiH1

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 500
	
	addi $9, $9, -1
	
	j forH1
	
saiH1:	addi $9, $0, 4
	
forH2:	beq $9, $0, saiH2

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	addi $9, $9, -1
	
	j forH2

saiH2:	addi $9, $0, 3

	addi $25, $25, 496
	
forH3:	beq $9, $0, saiH3

	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 12
	
	sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	sw $5, 65536($25)
	
	addi $25, $25, 500
	
	addi $9, $9, -1
	
	j forH3
	
saiH3:	

saiFuncDesenhaH:
	jr $31
	
#ESPAÇO DAS FUNÇÕES DE DESENHOS DE PEÇAS >:(
#>=====================================================================

#====================================
#Nome: funcDesenhaTorre
#Utilidade: desenha a torre a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno: 
funcDesenhaTorre:	  

addi $9, $0, 3	#REINICIALIZANDO O $9 PARA USO
  
t1:	  add $25, $4, $0	#PULANDO PARA A PRÓXIMA LINHA, ONDE INICIAREMOS O DESENHO DA TORRE

fortorre: beq $9, $0, sait1	#SE $9 = 0, ENTÃO SAI DESSE FOR

	  sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	  sw $5, 65536($25)
	  
	  addi $9, $9, -1	#DECREMENTANDO $9
	  
	  addi $25, $25, 8	#PULANDO 2 ESPAÇOS DE MEMÓRIA
	  
	  j fortorre
	  
sait1:	  addi $25, $25, 488	#PULANDO PARA A PRÓXIMA LINHA, ONDE SERÁ CONTINUADA A PINTURA DA TORRE
	  
	  addi $9, $0, 5	#REINICIALIZANDO PARA O USO NO FOR
	  
	  addi $13, $0, 1	#USANDO PARA PULAR LINHA
	   
fortorre2: beq $9, $0, pulaLtorre #SE $9=0, ENTÃO DEVE-SE PULAR A LINHA PARA CONTINUAR A PINTURA DA TORRE
	   
	   sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	   sw $5, 65536($25)
	   
	   addi $9, $9, -1	#DECREMENTANDO DO $9 QUE É O NÚMERO DE COLUNAS
	   
	   addi $25, $25, 4	#PULANDO PARA O PRÓXIMO ENDEREÇO
	   
	   j fortorre2
	   
pulaLtorre: beq $13, $0, sait3	#SE $13 = 0, ENTÃO A PINTURA TERMINOU
	    
	    addi $13, $13, -1   #DECREMENTA O NÚMERO DE LINHAS ($13)
	    
	    addi $25, $25, 492	#PULA PARA A PRÓXIMA LINHA
	    
	    addi $9, $0, 5	#REINICIA A QUANTIDADE DE COLUNAS
	    
	    j fortorre2
	    
sait3:	    addi $25, $25, 496	#PULA PARA A PRÓXIMA LINHA
	
	    addi $9, $0, 3	#REINICIALIZANDO PARA O USO NO FOR
	  
	    addi $13, $0, 1	#USANDO PARA PULAR LINHA
	    
fortorre3: beq $9, $0, pulaLtorre2 #SE $9=0, ENTÃO DEVE-SE PULAR A LINHA PARA CONTINUAR A PINTURA DA TORRE
	   
	   sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	   sw $5, 65536($25)
	   
	   addi $9, $9, -1	#DECREMENTANDO DO $9 QUE É O NÚMERO DE COLUNAS
	   
	   addi $25, $25, 4	#PULANDO PARA O PRÓXIMO ENDEREÇO
	   
	   j fortorre3
	   
pulaLtorre2: beq $13, $0, sait4	#SE $13 = 0, ENTÃO A PINTURA TERMINOU
	    
	    addi $13, $13, -1   #DECREMENTA O NÚMERO DE LINHAS ($13)
	    
	    addi $25, $25, 500	#PULA PARA A PRÓXIMA LINHA
	    
	    addi $9, $0, 3	#REINICIA A QUANTIDADE DE COLUNAS
	    
	    j fortorre3

sait4:	    addi $25, $25, 496	#PULA PARA A PRÓXIMA LINHA
	
	    addi $9, $0, 5
	    
fortorre5:  beq $9, $0, saitorre

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    sw $5, 65536($25)
	    
	    addi $9, $9, -1	#DECREMENTANDO A QUANTIDADE DE COLUNAS
	    
	    addi $25, $25, 4	#PULANDO PARA O PRÓXIMO ENDEREÇO
	    
	    j fortorre5
	    
saitorre:   jr $31

#====================================

#====================================
#Nome: funcDesenhaCavalo
#Utilidade: desenha um cavalo a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno: 
funcDesenhaCavalo:	  

addi $9, $0, 4	#REINICIALIZANDO O $9 PARA USO

c1:	    add $25, $4, $0	#PULANDO PARA ONDE INICIAREMOS O DESENHO DO CAVALO

forcavalo:  beq $9, $0, saic1

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    sw $5, 65536($25)
	    
	    addi $9, $9, -1	#DECREMENTANDO $9
	    
	    addi $25, $25, 4
	    
	    j forcavalo
	    
saic1:	    addi $25, $25, 500	#PULANDO PARA A PRÓXIMA LINHA, ONDE SERÁ CONTINUADA A PINTURA DO CAVALO

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    sw $5, 65536($25)
	    
	    addi $25, $25, 8	#PULANDO PARA DEIXAR UM PONTO EM BRANCO (OLHO DO CAVALO)
	    
	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    sw $5, 65536($25)
	    
	    addi $25, $25, 504	#PULANDO PARA A PRÓXIMA LINHA, ONDE SERÁ CONTINUADA A PINTURA DO CAV
	    
	    addi $9, $0, 4	#REINICIANDO PARA UTILIZAR NA CONSTRUÇÃO DO CAVALO
	    
forcavalo3: beq $9, $0, saic3

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    sw $5, 65536($25)
	    
	    addi $9, $9, -1	#DECREMENTANDO $9
	    
	    addi $25, $25, 4
	    
	    j forcavalo3

saic3:      addi $25, $25, 496	#PULANDO PARA A PRÓXIMA LINHA, ONDE SERÁ CONTINUADA A PINTURA DO CAVALO

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    sw $5, 65536($25)
	    
	    addi $25, $25, 4
	    
	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    sw $5, 65536($25)
	    
	    addi $25, $25, 8
	    
	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    sw $5, 65536($25)
	    
	    addi $25, $25, 512
	    
	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    sw $5, 65536($25)
	    
	    addi $25, $25, 496

	    addi $9, $0, 5	#ADICIONANDO PARA O FOR	     
	    
forcavalo8:  beq $9 $0 saicavalo

             sw $5, 0($25) 
             sw $5, 65536($25)

	     addi $25 $25 4
          
             addi $9 $9 -1
             j forcavalo8
  

saicavalo:   jr $31

#====================================

#====================================
#Nome: funcDesenhaBispo
#Utilidade: desenha um bispo a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno: 

funcDesenhaBispo:

		
b1:	    add $25, $4, $0	#INDO PARA ONDE INICIAREMOS O DESENHO DA TORRE

	    addi $25, $25, 8	#PULANDO 2 ENDEREÇOS DE MEMÓRIA PARA FICAR BONITINHO O DESENHO
	    
	    addi $9, $0, 3	#ADICIONANOD PARA O FOR DO BISPO

forbispo1:  beq $9, $0, saib1	#SE $9 = 0 SAI DO FOR
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    sw $5, 65536($25)
	    
	    addi $25, $25, 4	#PULANDO PARA O PROX ENDEREÇO DE MEMÓRIA
	    
	    addi $9, $9, -1	#DECREMENTANDO $9
	    
	    j forbispo1
	    
saib1:	    addi $25, $25, 500  #PULANDO PARA A PRÓXIMA LINHA

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    sw $5, 65536($25)
	    
	    addi $25, $25, 8	#DEIXANDO UM PIXEL EM "BRANCO"
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    sw $5, 65536($25)
	    
	    addi $25, $25, 500	#PULANDO PARA A PRÓXIMA LINHA
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    sw $5, 65536($25)
	    
	    addi $25, $25, 16	#DEIXANDO 3 PIXEIS EM BRANCO
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    sw $5, 65536($25)
	    
	    addi $25, $25, 496  #PULANDO PARA A PRÓXIMA LINHA

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    sw $5, 65536($25)
	    
	    addi $25, $25, 4	#PULANDO ENDEREÇO DE MEMÓRIA
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    sw $5, 65536($25)
	    
	    addi $25, $25, 8	#DEIXANDO UM PIXEL EM "BRANCO"
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    sw $5, 65536($25)
	    
	    addi $25, $25, 4	#PULANDO ENDEREÇO DE MEMÓRIA
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    sw $5, 65536($25)
	    
saib3:	    addi $25, $25, 500	  #PULANDO PARA A PRÓXIMA LINHA
	   
	    addi $9, $0, 3	#ADICIONANOD PARA O FOR 2 DO BISPO
	    
	    addi $13, $0, 2	#ADICIONANDO CONTADOR DE LINHAS PARA O FOR 2 DO BISPO
	    
forb4:	    beq $13, $0, saibispo
	    beq $9, $0, pulaLbispo2
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    sw $5, 65536($25)
	    
	    addi $25, $25, 4	#PULANDO PARA O PROX ENDEREÇO DE MEMÓRIA
	    
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
#Utilidade: desenha uma rainha a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:

funcDesenhaRainha:

rainha:     

	    add $25, $4, $0	#PULANDO PARA A PRÓXIMA LINHA, ONDE INICIAREMOS O DESENHO DA RAINHA

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    sw $5, 65536($25)
	    
	    addi $25, $25, 8
	    
	    sw $5 0($25)
	    sw $5, 65536($25)
	    
	    addi $25, $25, 8
	    
	    sw $5 0($25)
	    sw $5, 65536($25)
	    
	    addi $25, $25, 500	#PULANDO PARA A PRÓXIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA
	    
	    
	    
	    addi $9, $0, 3	#ADICIONANDO PARA O FOR DA RAINHA
	    
forrainha:  beq $9, $0, sair1   #QUANDO $9 = 0 SAI DO FOR

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    sw $5, 65536($25)
	    
	    addi $25, $25, 4	#PULANDO PARA O PROX ENDEREÇO DE MEMÓRIA
	    
	    addi $9, $9 -1
	    
	    j forrainha
	    
sair1:	    addi $25, $25, 504	#PULANDO PARA A PRÓXIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    sw $5, 65536($25)
	    
	    addi $25, $25, 508	#PULANDO PARA A PRÓXIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA
	    
	    addi $9, $0, 3	#ADICIONANDO PARA O FOR
	    
	    addi $13, $0, 2	#ADICIONANDO PARA CONTAGEM DE COLUNAS
	    
forrainha3: beq $13, $0, sair3	    #SE $13 = 0, SAI DO FOR
	    beq $9, $0, pulaLrainha #SE $9 = 0, DEVE-SE PULAR A LINHA
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    sw $5, 65536($25)
	    
	    addi $25, $25 4	#PULANDO PARA O PROX ENDEREÇO DE MEMÓRIA
	    
	    addi $9, $9, -1
	    
	    j forrainha3
	    
pulaLrainha: addi $13, $13, -1	#DECREMENTA O $13

	     addi $25, $25, 500	#PULANDO PARA A PRÓXIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA
	     
	     addi $9, $9, 3	#REINICIANDO A QUANT COLUNAS
	     
	     j forrainha3
	     
sair3:	     addi $25, $25, -4	#VOLTANDO UM ENDEREÇO DE MEMÓRIA

	     addi $9, $0, 5	#ADICIONANDO PARA O FOR

forrainha4:  beq $9, $0, sairrainha	#$9 = 0 SAI DO FOR
	     
	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	     sw $5, 65536($25)
	     
	     addi $25, $25, 4
	     
	     addi $9, $9, -1	
	     
	     j forrainha4
	
sairrainha:	jr $31

#====================================

#====================================
#Nome: funcDesenhaRei
#Utilidade: desenha um rei a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:

funcDesenhaRei:
rei:	     add $25, $4, $0 #MOVENDO PARA A CASA DE POSIÇÃO DO REI

	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	     sw $5, 65536($25)
	     
	     addi $25, $25, 508	#PULANDO PARA A PRÓXIMA LINHA, ONDE CONTINUAREMOS O DESENHO DO REI
	     
	     addi $9, $0, 3	#ADICIONANDO PARA O FOR
	    
forrei1:     beq $9, $0, saire1	#QUANDO $9 = 0, SAI DO FOR

	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	     sw $5, 65536($25)
	     
	     addi $25, $25, 4	#ADICIONANDO PARA O PROX ENDEREÇO DE MEMORIA
	     
	     addi $9, $9, -1
	     
	     j forrei1
	     
saire1:	     addi $25, $25, 504	#PULANDO PARA A PRÓXIMA LINHA, ONDE CONTINUAREMOS O DESENHO DO REI
	     
	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	     sw $5, 65536($25)
	     
	     addi $25, $25, 508	#PULANDO PARA A PRÓXIMA LINHA, ONDE CONTINUAREMOS O DESENHO DO REI
	     
	     addi $9, $0, 3
	     
	     addi $13, $0, 2	#ADICIONANDO A QUANT DE LNIHA E COL DO FOR
	     
forrei2:     beq $13, $0, saire2 #SE $13 = 0 SAI DO FOR
	     beq $9, $0, pulaLrei1 #SE $9 = 0, PULA PARA PROX LINHA
	     
	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	     sw $5, 65536($25)
	     
	     addi $25, $25, 4
	     
	     addi $9, $9, -1
	     
	     j forrei2
	    
pulaLrei1:   addi $13, $13, -1	#REDUZINDO A QUANT DE LINHAS
 	     
 	     addi $25, $25, 500	#PULANDO PARA A PRÓXIMA LINHA, ONDE CONTINUAREMOS O DESENHO DO REI
 	     
 	     addi $9, $0, 3
 	     
 	     j forrei2
 	     
saire2:	     addi $25, $25, -4

	     addi $9, $0, 5
	     
forrei3:     beq $9, $0, sairei
	     
	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	     sw $5, 65536($25)
	     
	     addi $25, $25, 4	#PULANDO PARA O PROX ENDEREÇO DE MEMORIA
	     
	     addi $9, $9, -1	#DECREMENTANDO DO I DO FOR
	     
	     j forrei3

sairei:	     jr $31
#====================================

#====================================
#Nome: funcDesenhaPeão
#Utilidade: desenha um peão a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno:
funcDesenhaPeao:
	add $25 $0 $4 #COMEÇO DA FUNCDOPEAO
           
        addi $9 $0 3 #iNÍCIO DA CABEÇA DO PEÃO QUE TERÁ 4 UNIDADES GRÁFICAS
        
        addi $13, $0, 3	#ADICIONANDO PARA O PULALINHA
 
forp1: 	beq $13 $0 saiforpeao1  
	beq $9, $0, pulaLinhaPeao     
        addi $9 $9 -1
        
        sw $5 0($25)   # PINTA COM A COR DE ENTRADA O PIXEL
        sw $5, 65536($25)
        
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
	sw $5, 65536($25)
	
	addi $25, $25, 508
	
	addi $9, $0, 3
	
forp2:	beq $9, $0, saiforpeao2
	
	addi $9, $9, -1
	
	sw $5 0($25)   # PINTA COM A COR DE ENTRADA O PIXEL
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	j forp2
	
saiforpeao2:
	addi $25, $25, 496
	
	addi $9, $0, 5
	
forp3:	beq $9, $0, saipeaofunc
	
	addi $9, $9, -1
	
	sw $5 0($25)   # PINTA COM A COR DE ENTRADA O PIXEL
	sw $5, 65536($25)
	
	addi $25, $25, 4
	
	j forp3

saipeaofunc: 
	jr $31
#====================================

#<=====================================================================
