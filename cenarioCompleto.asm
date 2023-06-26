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
	
	addi $9, $0, 596		#UNIDADES GRÁFICAS
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
	
	addi $25, $25, 4	#PASSANDO PARA O PRÓXIMO ENDEREÇO DE MEMÓRIA
	
	addi $12, $12, -1
	
	addi $13, $13, -1	#REDUZINDO UMA UNIDADE GRÁFICA DA LINHA
	
	add $8, $0, $10		#ADICIONANDO A COR NA VARIÁVEL AUXILIAR
	
	j formar

next:	addi $12, $0, 12		#REINICIALIZANDO A QUANTIDADE DE UNIDADES GRÁFICAS A SEREM PINTADAS

	beq $15, $18, faz3
        bne $15, $18, faz4

faz3:	addi $25, $25, 32
	 
	addi $15, $0, 0
	 
faz4:  	addi $15, $15, 1
	
forpre: beq $12, $0, for	#VERIFICAÇÃO DO FIM DO FOR

	sw $11, 0($25)		#DESENHANDO NO BITMAP
	
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

	  addi $4, $25, 1572	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHATORRE
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHATORRE

	  jal funcDesenhaTorre	#FUNÇÃO DESENHA TORRE
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 1616	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHACAVALO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHACAVALO
	  
	  jal funcDesenhaCavalo	#FUNÇÃO DESENHA CAVALO

	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 1680	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHACAVALO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHABISPO
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 1752	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHARAINHA
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHARAINHA
	  
	  jal funcDesenhaRainha
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 1820	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHAREI
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHAREI
	  
	  jal funcDesenhaRei
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 1876	#ADICIONANDO PARA ENVIAR PARA A FUNC REI
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC REI
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 1936	#ADICIONANDO PARA ENVIAR PARA A FUNC BISPO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC BISPO
	  
	  jal funcDesenhaCavalo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 2000	#ADICIONANDO PARA ENVIAR PARA A FUNC CAVALO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC CAVALO
	  
	  jal funcDesenhaTorre
	  
	  addi $10, $0, 9240	#ADICIONANDO PARA CONTAR OS ENDEREÇOS DE MEMÓRIA DO PEÃO
	  
	  addi $15, $0, 8	#ADICIONANDO PARA O FOR
	  
forDesenhaPeao:  
	
	  beq $15, $0, saiForDesenhaPeao
	  
	  addi $15, $15, -1
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  add $4, $25, $10	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHSAPEAO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHSAPEAO
	  
	  jal funcDesenhaPeao
	  
	  addi $10, $10, 64
	  
	  j forDesenhaPeao

saiForDesenhaPeao:

	  addi $10, $0, 50712	#ADICIONANDO PARA CONTAR OS ENDEREÇOS DE MEMÓRIA DO PEÃO
	  
	  addi $15, $0, 8	#ADICIONANDO PARA O FOR

forDesenhaPeao2:  
	
	  beq $15, $0, saiForDesenhaPeao2
	  
	  addi $15, $15, -1
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  add $4, $25, $10	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHSAPEAO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRANCA PARA A FUNC DESENHSAPEAO
	  
	  jal funcDesenhaPeao
	  
	  addi $10, $10, 64
	  
	  j forDesenhaPeao2

saiForDesenhaPeao2:

	  lui $25, 0x1001	#REINICIANDO PARA O ENDEREÇO DE MEMÓRIA INICIAL

	  addi $4, $25, 58900	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHATORRE
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRANCA PARA A FUNC DESENHATORRE

	  jal funcDesenhaTorre	#FUNÇÃO DESENHA TORRE

	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 58960	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHACAVALO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRANCA PARA A FUNC DESENHACAVALO
	  
	  jal funcDesenhaCavalo	#FUNÇÃO DESENHA CAVALO
	  
	   lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 59024	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHABISPO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRAMCA PARA A FUNC DESENHABISPO
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 59096	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHARAINHA
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHARAINHA
	  
	  jal funcDesenhaRainha
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 59168	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHAREI
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHAREI
	  
	  jal funcDesenhaRei
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 59220	#ADICIONANDO PARA ENVIAR PARA A FUNC REI
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC REI
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 59284	#ADICIONANDO PARA ENVIAR PARA A FUNC BISPO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC BISPO
	  
	  jal funcDesenhaCavalo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDEREÇO DE MEMÓRIA INICIAL
	  
	  addi $4, $25, 59344	#ADICIONANDO PARA ENVIAR PARA A FUNC CAVALO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC CAVALO
	  
	  jal funcDesenhaTorre
	  
	  
	  	                                                  
	  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
fim:	addi $2, $0, 10
	syscall
	
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
	  
	  addi $9, $9, -1	#DECREMENTANDO $9
	  
	  addi $25, $25, 8	#PULANDO 2 ESPAÇOS DE MEMÓRIA
	  
	  j fortorre
	  
sait1:	  addi $25, $25, 488	#PULANDO PARA A PRÓXIMA LINHA, ONDE SERÁ CONTINUADA A PINTURA DA TORRE
	  
	  addi $9, $0, 5	#REINICIALIZANDO PARA O USO NO FOR
	  
	  addi $13, $0, 1	#USANDO PARA PULAR LINHA
	   
fortorre2: beq $9, $0, pulaLtorre #SE $9=0, ENTÃO DEVE-SE PULAR A LINHA PARA CONTINUAR A PINTURA DA TORRE
	   
	   sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	   
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
	    
	    addi $9, $9, -1	#DECREMENTANDO $9
	    
	    addi $25, $25, 4
	    
	    j forcavalo
	    
saic1:	    addi $25, $25, 500	#PULANDO PARA A PRÓXIMA LINHA, ONDE SERÁ CONTINUADA A PINTURA DO CAVALO

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    
	    addi $25, $25, 8	#PULANDO PARA DEIXAR UM PONTO EM BRANCO (OLHO DO CAVALO)
	    
	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    
	    addi $25, $25, 504	#PULANDO PARA A PRÓXIMA LINHA, ONDE SERÁ CONTINUADA A PINTURA DO CAV
	    
	    addi $9, $0, 4	#REINICIANDO PARA UTILIZAR NA CONSTRUÇÃO DO CAVALO
	    
forcavalo3: beq $9, $0, saic3

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    
	    addi $9, $9, -1	#DECREMENTANDO $9
	    
	    addi $25, $25, 4
	    
	    j forcavalo3

saic3:      addi $25, $25, 496	#PULANDO PARA A PRÓXIMA LINHA, ONDE SERÁ CONTINUADA A PINTURA DO CAVALO

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    
	    addi $25, $25, 4
	    
	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    
	    addi $25, $25, 8
	    
	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    
	    addi $25, $25, 512
	    
	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSIÇÃO
	    
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
#Utilidade: desenha um bispo a partir de um endereço de memória previamente iniciado
#Parâmetro: $4 (ENDEREÇO DE MEMÓRIA), $5(COR DE DESENHO)
#Retorno: 

funcDesenhaBispo:

		
b1:	    add $25, $4, $0	#INDO PARA ONDE INICIAREMOS O DESENHO DA TORRE

	    addi $25, $25, 8	#PULANDO 2 ENDEREÇOS DE MEMÓRIA PARA FICAR BONITINHO O DESENHO
	    
	    addi $9, $0, 3	#ADICIONANOD PARA O FOR DO BISPO

forbispo1:  beq $9, $0, saib1	#SE $9 = 0 SAI DO FOR
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    
	    addi $25, $25, 4	#PULANDO PARA O PROX ENDEREÇO DE MEMÓRIA
	    
	    addi $9, $9, -1	#DECREMENTANDO $9
	    
	    j forbispo1
	    
saib1:	    addi $25, $25, 500  #PULANDO PARA A PRÓXIMA LINHA

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    
	    addi $25, $25, 8	#DEIXANDO UM PIXEL EM "BRANCO"
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    
	    addi $25, $25, 500	#PULANDO PARA A PRÓXIMA LINHA
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    
	    addi $25, $25, 16	#DEIXANDO 3 PIXEIS EM BRANCO
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    
	    addi $25, $25, 496  #PULANDO PARA A PRÓXIMA LINHA

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    
	    addi $25, $25, 4	#PULANDO ENDEREÇO DE MEMÓRIA
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    
	    addi $25, $25, 8	#DEIXANDO UM PIXEL EM "BRANCO"
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    
	    addi $25, $25, 4	#PULANDO ENDEREÇO DE MEMÓRIA
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL

saib3:	    addi $25, $25, 500	  #PULANDO PARA A PRÓXIMA LINHA
	   
	    addi $9, $0, 3	#ADICIONANOD PARA O FOR 2 DO BISPO
	    
	    addi $13, $0, 2	#ADICIONANDO CONTADOR DE LINHAS PARA O FOR 2 DO BISPO
	    
forb4:	    beq $13, $0, saibispo
	    beq $9, $0, pulaLbispo2
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    
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
	    
	    addi $25, $25, 8
	    
	    sw $5 0($25)
	    
	    addi $25, $25, 8
	    
	    sw $5 0($25)
	    
	    addi $25, $25, 500	#PULANDO PARA A PRÓXIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA
	    
	    
	    
	    addi $9, $0, 3	#ADICIONANDO PARA O FOR DA RAINHA
	    
forrainha:  beq $9, $0, sair1   #QUANDO $9 = 0 SAI DO FOR

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    
	    addi $25, $25, 4	#PULANDO PARA O PROX ENDEREÇO DE MEMÓRIA
	    
	    addi $9, $9 -1
	    
	    j forrainha
	    
sair1:	    addi $25, $25, 504	#PULANDO PARA A PRÓXIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    
	    addi $25, $25, 508	#PULANDO PARA A PRÓXIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA
	    
	    addi $9, $0, 3	#ADICIONANDO PARA O FOR
	    
	    addi $13, $0, 2	#ADICIONANDO PARA CONTAGEM DE COLUNAS
	    
forrainha3: beq $13, $0, sair3	    #SE $13 = 0, SAI DO FOR
	    beq $9, $0, pulaLrainha #SE $9 = 0, DEVE-SE PULAR A LINHA
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	    
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
	     
	     addi $25, $25, 508	#PULANDO PARA A PRÓXIMA LINHA, ONDE CONTINUAREMOS O DESENHO DO REI
	     
	     addi $9, $0, 3	#ADICIONANDO PARA O FOR
	    
forrei1:     beq $9, $0, saire1	#QUANDO $9 = 0, SAI DO FOR

	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	     
	     addi $25, $25, 4	#ADICIONANDO PARA O PROX ENDEREÇO DE MEMORIA
	     
	     addi $9, $9, -1
	     
	     j forrei1
	     
saire1:	     addi $25, $25, 504	#PULANDO PARA A PRÓXIMA LINHA, ONDE CONTINUAREMOS O DESENHO DO REI
	     
	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL

	     addi $25, $25, 508	#PULANDO PARA A PRÓXIMA LINHA, ONDE CONTINUAREMOS O DESENHO DO REI
	     
	     addi $9, $0, 3
	     
	     addi $13, $0, 2	#ADICIONANDO A QUANT DE LNIHA E COL DO FOR
	     
forrei2:     beq $13, $0, saire2 #SE $13 = 0 SAI DO FOR
	     beq $9, $0, pulaLrei1 #SE $9 = 0, PULA PARA PROX LINHA
	     
	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSIÇÃO ATUAL
	     
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
