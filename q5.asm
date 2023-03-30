.text

main: addi $2, $0, 5
      syscall		#le o numero
      
divpor100: addi $8, $0, 100 #adiciona 100 ao reg 8
	   div $2, $8       #div entre num por 100
	   mflo $10	    #move o resultado para o reg 10
	   mfhi $11         #move o resto para o reg 11
	   
divpor10:  addi $9, $0, 10  #adiciona 10 ao reg 9
	   div $11, $9	    #div entre resto do num lido por 10
	   mflo $11	    #move o resultado para o reg 11
	   mfhi $12         #move o resto para o reg 12
	   
soma:      add $13, $11, $12 #soma entre unidade e dezena
	   add $4, $13, $10 #soma com centena

imprime:   addi $2, $0, 1
	   syscall	   #imprime o resultado

fim: 	   addi $2, $0, 10
	   syscall	  #fim