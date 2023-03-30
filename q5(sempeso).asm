.text

main: addi $2, $0, 5
      syscall		#le a primeira nota
      add $8, $0, $2	#move 1 nota para reg $8
      addi $2, $0, 5
      syscall		#le a segunda nota
      
soma: add $9, $8, $2	#soma entre as duas notas
      addi $10, $0, 2

divisao: div $9, $10

imprimir: mflo $4	#move o resultado da divisão para o reg $4
          addi $2, $0 1 
          syscall       #imprime a media
          
fim:	  addi $2, $0, 10
	  syscall	#fim do programa