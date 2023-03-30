.text

main: addi $2, $0, 5
      syscall		#le o número
      add $8, $0, $2	#passa o num para o reg $8
      
dobro:add $4, $2, $8	#soma o num consigo mesmo
      addi $2, $0, 1
      syscall		#imprime o dobro do número
      
fim:  addi $2, $0, 10
      syscall