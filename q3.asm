.text

main: addi $2, $0, 5
      syscall		#le o numero
      add $8, $0, $2	#passa o num lido para o reg $8
      
mut:  mul $4, $2, $8    #multiplica o num lido consigo mesmo
      addi $2, $0, 1
      syscall		#imprime o quadrado do num lido
fim:  addi $2, $0, 10
      syscall		#fim do programa