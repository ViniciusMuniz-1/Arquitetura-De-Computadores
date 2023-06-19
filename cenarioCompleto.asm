.text
#NOTA DE VINICIUS: NA HORA DE DESENHAR AS PE�AS, SEMPRE SOME O ENDERE�O DA �LTIMA +64 PARA O DESENHO DA PR�XIMA PE�A
#EX.: O DESENHO DA TORRE COME�OU NO ENDERE�O 1552, ENT�O O DO CAVALO COME�AR� NO 1616, O DO BISPO NO 1680 E ASSIM EM DIANTE



main:	lui $25, 0x1001		#INICIALIZANDO O ENDERE�O DE MEM�RIA INICIAL
	addi $10, $0, 0xf3ddcf	#INICIALIZANDO A COR MARROM EM HEXA
	addi $11, $0, 0x613d3d	#INICIALIZANDO A COR MARROM CLARO
	addi $16, $0, 0x000000	#INICIALIZANDO A COR PRETA EM HEXA
	addi $17, $0, 0x708090	#INICIALIZANDO A COR BRANCA EM HEXA
        addi $12, $0, 0         #CONTADOR DE CHAMADA DE FUN��O     
	
	addi $9, $0, 512	#UNIDADES GR�FICAS
	addi $13, $0, 2048	#TAMANHO DE UMA LINHA
	
	addi $12, $0, 16	#QUANT DE UNIDADES GR�FICAS POR CORS
	
for:	slt $14, $13, $0	#SE $14 = 1, ENT�O PULA PRA MUDACOR TAMB�M
	beq $13, $0, mudacor	#SE UMA LINHA INTEIRA FOR PINTADA, ENT�O PULA-SE PARA PR�XIMA LINHA COM A MESMA COR DA ANTIGA
	bne $14, $0, mudacor	#SE UMA LINHA INTEIRA FOR PINTADA, ENT�O PULA-SE PARA PR�XIMA LINHA COM A MESMA COR DA ANTIGA
	beq $9, $0, continua		
	
	addi $9, $9, -1
	
	addi $12, $0, 16
	
formar: beq $12, $0, next	#VERIFICA��O DO FIM DO FOR

	sw $10, 0($25)		#DESENHANDO NO BITMAP
	
	addi $25, $25, 4	#PASSANDO PARA O PR�XIMO ENDERE�O DE MEM�RIA
	addi $12, $12, -1
	
	addi $13, $13, -1	#REDUZINDO UMA UNIDADE GR�FICA DA LINHA
	
	add $8, $0, $10		#ADICIONANDO A COR NA VARI�VEL AUXILIAR
	
	j formar

next:	addi $12, $0, 16	#REINICIALIZANDO A QUANTIDADE DE UNIDADES GR�FICAS A SEREM PINTADAS
	
forpre: beq $12, $0, for	#VERIFICA��O DO FIM DO FOR

	sw $11, 0($25)		#DESENHANDO NO BITMAP
	
	addi $25, $25, 4	#PASSANDO PARA O PR�XIMO ENDERE�O DE MEM�RIA
	addi $12, $12, -1
	
	addi $13, $13, -1	#REDUZINDO UMA UNIDADE GR�FICA DA LINHA
	
	add $8, $0, $11		#ADICIONANDO A COR NA VARI�VEL AUXILIAR
	
	j forpre
	
mudacor: addi $12, $0, 16	#REINICIALIZANDO A QUANTIDADE DE UNIDADES GR�FICAS A SEREM PINTADAS
	 addi $13, $0, 2048	#REINICIALIZANDO A QUANTIDADE DE UNIDADES GR�FICAS POR LINHA
	 
	 beq $8, $11, forpre
	 beq $8, $10, formar


continua: lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL

	  addi $4, $25, 1552	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHATORRE
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHATORRE

	  jal funcDesenhaTorre	#FUN��O DESENHA TORRE
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 1616	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHACAVALO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHACAVALO
	  
	  jal funcDesenhaCavalo	#FUN��O DESENHA CAVALO

	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 1680	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHACAVALO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHABISPO
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 1760	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHARAINHA
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHARAINHA
	  
	  jal funcDesenhaRainha
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 1824	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHAREI
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHAREI
	  
	  jal funcDesenhaRei
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 1876	#ADICIONANDO PARA ENVIAR PARA A FUNC REI
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC REI
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 1936	#ADICIONANDO PARA ENVIAR PARA A FUNC BISPO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC BISPO
	  
	  jal funcDesenhaCavalo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 2000	#ADICIONANDO PARA ENVIAR PARA A FUNC CAVALO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC CAVALO
	  
	  jal funcDesenhaTorre
	  
	  addi $10, $0, 9240	#ADICIONANDO PARA CONTAR OS ENDERE�OS DE MEM�RIA DO PE�O
	  
	  addi $15, $0, 8	#ADICIONANDO PARA O FOR
	  
forDesenhaPeao:  
	
	  beq $15, $0, saiForDesenhaPeao
	  
	  addi $15, $15, -1
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  add $4, $25, $10	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHSAPEAO
	  
	  add $5, $0, $16	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHSAPEAO
	  
	  jal funcDesenhaPeao
	  
	  addi $10, $10, 64
	  
	  j forDesenhaPeao

saiForDesenhaPeao:

	  addi $10, $0, 50712	#ADICIONANDO PARA CONTAR OS ENDERE�OS DE MEM�RIA DO PE�O
	  
	  addi $15, $0, 8	#ADICIONANDO PARA O FOR

forDesenhaPeao2:  
	
	  beq $15, $0, saiForDesenhaPeao2
	  
	  addi $15, $15, -1
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  add $4, $25, $10	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHSAPEAO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRANCA PARA A FUNC DESENHSAPEAO
	  
	  jal funcDesenhaPeao
	  
	  addi $10, $10, 64
	  
	  j forDesenhaPeao2

saiForDesenhaPeao2:

	  lui $25, 0x1001	#REINICIANDO PARA O ENDERE�O DE MEM�RIA INICIAL

	  addi $4, $25, 58900	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHATORRE
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRANCA PARA A FUNC DESENHATORRE

	  jal funcDesenhaTorre	#FUN��O DESENHA TORRE

	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 58960	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHACAVALO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRANCA PARA A FUNC DESENHACAVALO
	  
	  jal funcDesenhaCavalo	#FUN��O DESENHA CAVALO
	  
	   lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 59024	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHABISPO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR BRAMCA PARA A FUNC DESENHABISPO
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 59104	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHARAINHA
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHARAINHA
	  
	  jal funcDesenhaRainha
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 59168	#ADICIONANDO PARA ENVIAR PARA A FUNC DESENHAREI
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC DESENHAREI
	  
	  jal funcDesenhaRei
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 59220	#ADICIONANDO PARA ENVIAR PARA A FUNC REI
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC REI
	  
	  jal funcDesenhaBispo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 59284	#ADICIONANDO PARA ENVIAR PARA A FUNC BISPO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC BISPO
	  
	  jal funcDesenhaCavalo
	  
	  lui $25, 0x1001	#REINICIANDO O ENDERE�O DE MEM�RIA INICIAL
	  
	  addi $4, $25, 59344	#ADICIONANDO PARA ENVIAR PARA A FUNC CAVALO
	  
	  add $5, $0, $17	#ADICIONANDO PARA ENVIAR COR PRETA PARA A FUNC CAVALO
	  
	  jal funcDesenhaTorre
	  
	  
	  	                                                  
	  	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
fim:	addi $2, $0, 10
	syscall
	
#ESPA�O DAS FUN��ES DE DESENHOS DE PE�AS >:(
#>=====================================================================

#====================================
#Nome: funcDesenhaTorre
#Utilidade: desenha a torre a partir de um endere�o de mem�ria previamente iniciado
#Par�metro: $4 (ENDERE�O DE MEM�RIA), $5(COR DE DESENHO)
#Retorno: 
funcDesenhaTorre:	  

addi $9, $0, 4	#REINICIALIZANDO O $9 PARA USO
  
t1:	  add $25, $4, $0	#PULANDO PARA A PR�XIMA LINHA, ONDE INICIAREMOS O DESENHO DA TORRE

fortorre: beq $9, $0, sait1	#SE $9 = 0, ENT�O SAI DESSE FOR

	  sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	  
	  addi $9, $9, -1	#DECREMENTANDO $9
	  
	  addi $25, $25, 8	#PULANDO 2 ESPA�OS DE MEM�RIA
	  
	  j fortorre
	  
sait1:	  addi $25, $25, 480	#PULANDO PARA A PR�XIMA LINHA, ONDE SER� CONTINUADA A PINTURA DA TORRE
	  
	  addi $9, $0, 7	#REINICIALIZANDO PARA O USO NO FOR
	  
fortorre2: beq $9, $0, sait2	#SE $9 = 0, ENT�O SAI DESSE FOR

	   sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	   
	   addi $9, $9, -1
	   
	   addi $25, $25, 4
	   
	   j fortorre2
	  
sait2:     addi $25, $25, 488	#PULANDO PARA A PR�XIMA LINHA, ONDE SER� CONTINUADA A PINTURA DA TORRE
	   
	   addi $9, $0, 5	#ADICIONANDO PARA SER O CONTA COLUNAS DO FOR
	   addi $13, $0, 4	#ADICIONANDO PARA SER O CONTA LINHAS DO FOR
	   
fortorre3: beq $9, $0, pulaLtorre #SE $9=0, ENT�O DEVE-SE PULAR A LINHA PARA CONTINUAR A PINTURA DA TORRE
	   
	   sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	   
	   addi $9, $9, -1	#DECREMENTANDO DO $9 QUE � O N�MERO DE COLUNAS
	   
	   addi $25, $25, 4	#PULANDO PARA O PR�XIMO ENDERE�O
	   
	   j fortorre3
	   
pulaLtorre: beq $13, $0, sait3	#SE $13 = 0, ENT�O A PINTURA TERMINOU
	    
	    addi $13, $13, -1   #DECREMENTA O N�MERO DE LINHAS ($13)
	    
	    addi $25, $25, 492	#PULA PARA A PR�XIMA LINHA
	    
	    addi $9, $0, 5	#REINICIA A QUANTIDADE DE COLUNAS
	    
	    j fortorre3
	    
sait3:	    addi $25, $25, 488	#PULA PARA A PR�XIMA LINHA
	
	    addi $9, $0, 7
	    
fortorre4:  beq $9, $0, sait4

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	    addi $9, $9, -1	#DECREMENTANDO A QUANTIDADE DE COLUNAS
	    
	    addi $25, $25, 4	#PULANDO PARA O PR�XIMO ENDERE�O
	    
	    j fortorre4

sait4:	    addi $25, $25, 484	#PULA PARA A PR�XIMA LINHA
	
	    addi $9, $0, 7
	    
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

addi $9, $0, 5	#REINICIALIZANDO O $9 PARA USO

c1:	    add $25, $4, $0	#PULANDO PARA ONDE INICIAREMOS O DESENHO DO CAVALO

forcavalo:  beq $9, $0, saic1

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	    addi $9, $9, -1	#DECREMENTANDO $9
	    
	    addi $25, $25, 4
	    
	    j forcavalo
	    
saic1:	    addi $25, $25, 496	#PULANDO PARA A PR�XIMA LINHA, ONDE SER� CONTINUADA A PINTURA DO CAVALO

	    addi $9, $0, 5	#REINICIANDO PARA UTILIZAR NA CONSTRU��O DO CAVALO
	    
forcavalo2: beq $9, $0, saic2

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	    addi $9, $9, -1	#DECREMENTANDO $9
	    
	    addi $25, $25, 4
	    
	    j forcavalo2
	    
saic2:	    addi $25, $25, 496	#PULANDO PARA A PR�XIMA LINHA, ONDE SER� CONTINUADA A PINTURA DO CAVALO

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	    addi $25, $25, 8	#PULANDO PARA DEIXAR UM PONTO EM BRANCO (OLHO DO CAVALO)
	    
	    addi $9, $0, 3	#REINICIANDO PARA UTILIZAR NA CONSTRU��O DO CAVALO
	    
forcavalo3: beq $9, $0, saic3

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	    addi $9, $9, -1	#DECREMENTANDO $9
	    
	    addi $25, $25, 4
	    
	    j forcavalo3

saic3:      addi $25, $25, 492	#PULANDO PARA A PR�XIMA LINHA, ONDE SER� CONTINUADA A PINTURA DO CAVALO

	    addi $9, $0, 6	#REINICIANDO PARA UTILIZAR NA CONSTRU��O DO CAVALO
	    
	    addi $13, $0, 1	#ADICIONANDO PARA CONTAGEM DE LINHAS
	    
forcavalo4: beq $9, $0, pulaLcavalo

	    sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	    addi $9, $9, -1	#DECREMENTANDO $9
	    
	    addi $25, $25, 4
	    
	    j forcavalo4

pulaLcavalo: beq $13, $0, saic4

             addi $13, $13, -1
             
             addi $9, $0, 6
             
             addi $25, $25, 488	#PULANDO PARA A PR�XIMA LINHA, ONDE SER� CONTINUADA A PINTURA DO CAVALO
             
             j forcavalo4

saic4:	     addi $25, $25, 488	#PULANDO PARA A PR�XIMA LINHA, ONDE SER� CONTINUADA A PINTURA DO CAVALO

	     addi $9, $0, 3	#REINICIANDO PARA UTILIZAR NA CONSTRU��O DO CAVALO
	     
	     addi $13, $0, 2	#REINICIANOD PARA UTILIZAR NO FOR5
	    
forcavalo5:  beq $13, $0, saic5 	#SE $13 = 0 ACABOU O FOR
	     beq $9, $0, condcavalo	#SE $9 = 0, DEVEMOS APENAS PULAR PARA O PR�XIMO ESPA�O
	     
	     sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	     addi $9, $9, -1	#DECREMENTANDO $9
	    
	     addi $25, $25, 4
	     
	     j forcavalo5
	    
condcavalo:  addi $25, $25, 4		#PULANDO PARA O PR�XIMA ENDERE�O
	     
	     addi $13, $13, -1
	     
	     addi $9, $0, 2

	     j forcavalo5

saic5: 	     addi $25, $25, 484		#PULA LINHA PARA CONTINUAR O DESENHO DO CAVALO

       	     addi $9, $0, 3	        #ADICIONA PARA O FOR
       
             addi $13 $0 2
             
forcavalo6:  beq $13, $0, saic6 	#SE $13 = 0 ACABOU O FOR
	     beq $9, $0, condcavalo2	#SE $9 = 0, DEVEMOS APENAS PULAR PARA O PR�XIMO ESPA�O
	     
	     sw $5, 0($25)	#PINTANDO O PRETO NESSA POSI��O
	    
	     addi $9, $9, -1	#DECREMENTANDO $9
	    
	     addi $25, $25, 4
	     
	     j forcavalo6
	         
condcavalo2: addi $25, $25, 4		#PULANDO PARA O PR�XIMA ENDERE�O
	       
	     addi $13, $13, -1
	     
	     addi $9, $0, 2
              
	     j forcavalo6 
	                  
saic6:	     addi $25, $25, 496

       	     addi $9, $0, 3
      
        
forcavalo7:  beq $9 $0 saic7
             sw $5, 0($25)
                  
             addi $25 $25 4
                  
             addi $9 $9 -1
                  
             j forcavalo7
             
saic7: 	     addi $25 $25 484
	     addi $9 $0 7
	     
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
	    
	    addi $25, $25, 500  #PULANDO PARA A PR�XIMA LINHA
	    
	    addi $9, $0, 3	#ADICIONANOD PARA O FOR 2 DO BISPO
	    
	    addi $13, $0, 2	#ADICIONANDO CONTADOR DE LINHAS PARA O FOR 2 DO BISPO
	    
forb2:	    beq $13, $0, saib2
	    beq $9, $0, pulaLbispo	#SE $9=0 SAI DO FOR
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 4	#PULANDO PARA O PROX ENDERE�O DE MEM�RIA
	    
	    addi $9, $9, -1
	    
	    j forb2

pulaLbispo: addi $13, $13, -1	#DECREMENTA A QUANT DE LINHAS
            
            addi $25, $25, 500	#PULA PARA PROX LINHA
            
            addi $9, $0, 3	#REINICIA AS COLUNAS
            
            j forb2

saib2:	    addi $25, $25, -4	#VOLTA UM ENDERE�O DE MEM�RIA

	    addi $9, $0, 5	#ADICIONANOD PARA O FOR 2 DO BISPO
	    	    
forb3:	    beq $9, $0, saib3	#SE $9 = 0, SAI DO FOR
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 4	#PULANDO PARA O PROX ENDERE�O DE MEM�RIA
	    
	    addi $9, $9, -1
	    
	    j forb3
	    
saib3:	    addi $25, $25, 488	  #PULANDO PARA A PR�XIMA LINHA
	    
	    addi $9, $0, 7	#ADICIONANOD PARA O FOR 2 DO BISPO
	    
	    addi $13, $0, 2	#ADICIONANDO CONTADOR DE LINHAS PARA O FOR 2 DO BISPO
	    
forb4:	    beq $13, $0, saibispo
	    beq $9, $0, pulaLbispo2
	    
	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 4	#PULANDO PARA O PROX ENDERE�O DE MEM�RIA
	    
	    addi $9, $9, -1
	    
	    j forb4

pulaLbispo2: addi $13, $13, -1	#DECREMENTA A QUANT DE LINHAS
            
            addi $25, $25, 484	#PULA PARA PROX LINHA
            
            addi $9, $0, 7	#REINICIA AS COLUNAS
            
            j forb4

saibispo: jr $31
#====================================

#====================================
#Nome: funcDesenhaRainha
#Utilidade: desenha uma rainha a partir de um endere�o de mem�ria previamente iniciado
#Par�metro: $4 (ENDERE�O DE MEM�RIA), $5(COR DE DESENHO)
#Retorno:

funcDesenhaRainha:

rainha:     add $25, $4, $0	#PULANDO PARA A PR�XIMA LINHA, ONDE INICIAREMOS O DESENHO DA RAINHA

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 504	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA
	    
	    addi $9, $0, 5	#ADICIONANDO PARA O FOR DA RAINHA
	    
forrainha:  beq $9, $0, sair1   #QUANDO $9 = 0 SAI DO FOR

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 4	#PULANDO PARA O PROX ENDERE�O DE MEM�RIA
	    
	    addi $9, $9 -1
	    
	    j forrainha
	    
sair1:	    addi $25, $25, 496	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA

	    addi $9, $0, 3	#ADICIONANDO PARA O FOR DA RAINHA
	    
forrainha2:  beq $9, $0, sair2   #QUANDO $9 = 0 SAI DO FOR

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 4	#PULANDO PARA O PROX ENDERE�O DE MEM�RIA
	    
	    addi $9, $9 -1
	    
	    j forrainha2
	   
sair2:      addi $25, $25, 504	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA

	    sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	    
	    addi $25, $25, 508	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA
	    
	    addi $9, $0, 3	#ADICIONANDO PARA O FOR
	    
	    addi $13, $0, 3	#ADICIONANDO PARA CONTAGEM DE COLUNAS
	    
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

forrainha4:  beq $9, $0, sair4	#$9 = 0 SAI DO FOR
	     
	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	     
	     addi $25, $25, 4
	     
	     addi $9, $9, -1	
	     
	     j forrainha4
	     
sair4:	     addi $25, $25, 488	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DA RAINHA

	     addi $9, $0, 7	#ADICIONANDO PARA O FOR
	     
forrainha5:  beq $9, $0, sairrainha	#$9 = 0 SAI DO FOR

	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	     
	     addi $25, $25, 4
	     
	     addi $9, $9, -1	
	     
	     j forrainha5

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

	     addi $25, $25, 504	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DO REI
	     
	     addi $9, $0, 5
	     
	     addi $13, $0, 2	#ADICIONANDO A QUANT DE LNIHA E COL DO FOR
	     
forrei2:     beq $13, $0, saire2 #SE $13 = 0 SAI DO FOR
	     beq $9, $0, pulaLrei1 #SE $9 = 0, PULA PARA PROX LINHA
	     
	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	     
	     addi $25, $25, 4
	     
	     addi $9, $9, -1
	     
	     j forrei2
	    
pulaLrei1:   addi $13, $13, -1	#REDUZINDO A QUANT DE LINHAS
 	     
 	     addi $25, $25, 492	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DO REI
 	     
 	     addi $9, $0, 5
 	     
 	     j forrei2
 	     
saire2:      addi $25, $25, 4
 
 	     addi $9, $0, 3
 	     
 	     addi $13, $0, 2
 	     
forrei3:     beq $13, $0, saire3 #SE $13 = 0 SAI DO FOR
	     beq $9, $0, pulaLrei2 #SE $9 = 0, PULA PARA PROX LINHA
	     
	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	     
	     addi $25, $25, 4
	     
	     addi $9, $9, -1
	     
	     j forrei3
	    
pulaLrei2:   addi $13, $13, -1	#REDUZINDO A QUANT DE LINHAS
 	     
 	     addi $25, $25, 500	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DO REI
 	     
 	     addi $9, $0, 3
 	     
 	     j forrei3
 	     
saire3:	     addi $25, $25, -4
	     
	     addi $9, $0, 5
	     
forrei4:     beq $9, $0, saire4
	     
	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	     
	     addi $25, $25, 4	#PULANDO PARA O PROX ENDERE�O DE MEMORIA
	     
	     addi $9, $9, -1	#DECREMENTANDO DO I DO FOR
	     
	     j forrei4
	     
saire4:	     addi $25, $25, 488	#PULANDO PARA A PR�XIMA LINHA, ONDE CONTINUAREMOS O DESENHO DO REI

	     addi $9, $0, 7
	     
forrei5:     beq $9, $0, sairei
	     
	     sw $5 0($25) 	#PINTANDO O PIXEL DE PRETO NA POSI��O ATUAL
	     
	     addi $25, $25, 4	#PULANDO PARA O PROX ENDERE�O DE MEMORIA
	     
	     addi $9, $9, -1	#DECREMENTANDO DO I DO FOR
	     
	     j forrei5

sairei:		jr $31
#====================================

#====================================
#Nome: funcDesenhaPe�o
#Utilidade: desenha um pe�o a partir de um endere�o de mem�ria previamente iniciado
#Par�metro: $4 (ENDERE�O DE MEM�RIA), $5(COR DE DESENHO)
#Retorno:
funcDesenhaPeao:add $25 $0 $4 #COME�O DA FUNCDOPEAO
           
           addi $9 $0 4 #iN�CIO DA CABE�A DO PE�O QUE TER� 4 UNIDADES GR�FICAS
 
   forp1: beq $9 $0 saip1       
         addi $9 $9 -1
        
        sw $5 0($25)   # PINTA COM A COR DE ENTRADA O PIXEL
        
        addi $25 $25 4
        j forp1
        
 saip1: addi $9 $0 4 
        addi $25 $25 496
        
 forp2: beq $9 $0 saip2    
        addi $9 $9 -1
        sw $5 0($25)  
        addi $25 $25 4
        j forp2
        
 saip2: addi $9 $0 4 
        addi $25 $25 496
        
 forp3: beq $9 $0 saip3
        addi $9 $9 -1
        sw $5 0($25)
        addi $25 $25 4
        j forp3
 saip3: addi $9 $0 4
        addi $25 $25 496
        
 forp4: beq $9 $0 saip4
        addi $9 $9 -1
        sw $5 0($25)
        addi $25 $25 4
        j forp4
        
  saip4: addi $25 $25 500 #FIM DA CABE�A DO PE�O E PULA LINHA PARA COME�AR O PESCO�O DA PE�A
         addi $9 $0 2     #2 UNI. GR�FICAS(CONTADOR,OU SEJA, N�O IMPLEMENTA, MAS SERVE DE PASSO PARA O SW ALOCAR AS UNI. GR�FICAS) 
  forpe5: beq $9 $0 saip5
          addi $9 $9 -1
          sw $5 0($25)
          addi $25 $25 4 
          j forpe5       
                                                                                                                           
   saip5: addi $25 $25 500
          addi $9 $0 4
  forpe6: beq $9 $0 saip6
          
          addi $9 $9 -1
          
          sw $5 0($25)
          
          addi $25 $25 4
          
          j forpe6
 
   saip6: addi $25 $25 496
          addi $9 $0 4
          
   forpe7:beq $9 $0 saip7
          addi $9 $9 -1
          sw $5 0($25)
          addi $25 $25 4
          j forpe7
          
     saip7:addi $25 $25 496
           addi $9 $0 4
          
   forpe8:beq $9 $0 saip8
          addi $9 $9 -1
          sw $5 0($25)
          addi $25 $25 4
          j forpe8 
 
   saip8: addi $9 $0 8
          addi $25 $25 488
   forpe9:beq $9 $0 saip9
          addi $9 $9 -1
          sw $5 0($25) 
          addi $25 $25 4
          j forpe9
    saip9:addi $9 $0 8
          addi $25 $25 480
   forpe10:beq $9 $0 saip10
   
          addi $9 $9 -1
          
          sw $5 0($25) 
          
          addi $25 $25 4
          
          j forpe10
             
   saip10: addi $9 $0 10
   
           addi $25 $25 476
          
   forpe11:beq $9 $0 saip11
   
           addi $9 $9 -1
           
           sw $5 0($25) 
           
           addi $25 $25 4
           
           j forpe11
                  
    saip11: addi $9 $0 10
   
           addi $25 $25 472
          
   forpe12:beq $9 $0 saip12
   
           addi $9 $9 -1
           
           sw $5 0($25) 
           
           addi $25 $25 4
           
           j forpe12  
    saip12: jr $31
#====================================

#<=====================================================================
