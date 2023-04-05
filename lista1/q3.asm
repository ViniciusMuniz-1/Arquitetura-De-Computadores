.text

main: addi $2, $0, 5
      syscall		#le o primeiro numero
      add $8, $0, $2	#passa o numero lido para o reg $8
      addi $2, $0, 5
      syscall		#le o segundo numero
mult: mul $4, $2, $8	#multiplica os 2 numeros lidos
      addi $2, $0, 1
      syscall		#imprime o resultado da multiplicação
fim:  addi $2, $0, 10
      syscall		#fim do programa
      
