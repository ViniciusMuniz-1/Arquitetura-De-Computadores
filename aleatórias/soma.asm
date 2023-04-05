.text 

main: addi $2, $0, 5 
      syscall        #le o primeiro int
      add $8, $2, $0 #move 1 int lido para o reg $8
      addi $2, $0, 5 
      syscall        #le o segundo int
soma: add $9, $2, $8 #soma os dois números
      add $4, $0, $9 #move o resultado para reg $4
      addi $2, $0, 1 
      syscall        #imprime a soma
fim:  addi $2, $0, 10
      syscall        #termina a execução do programa
