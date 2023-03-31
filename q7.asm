.text

main: addi $2, $0, 5
      syscall
      
divpor1000: addi $8, $0, 1000 #adiciona 1000 ao reg 8
	    div $2, $8        #divide o numero por 1000
	    mflo $9	      #move a casa do milhar para o reg 9
	    mfhi $10	      #move o resto do num para o reg 10
	   
divpor100:  sub $8, $0, 900  #deixa 100 no reg 8
            div $10, $8      #divide o numero por 100
            mflo $11         #move a centena para o reg 11
            mfhi $12         #move o resto do num para o reg 12
            
divpor10:   sub $8, $0, 890  #deixa 10 no reg 8
	    div $12, $8      #divide o num por 10
	    mflo $13	     #move a dezena para o reg 13
	    mfhi $14	     #move a unidade para o reg 14
	    
imprimir:   add $4, $0, $8
	    addi $2, $0, 1
	    syscall
	    
	    add $4, $0, $11
	    syscall
	    
	    add $4, $0, $13
	    syscall
	    
	    add $4, $0, $14
	    syscall
	    
fim:        addi $2, $0 10
	    syscall
	    
	    
	
	   
	   
	   