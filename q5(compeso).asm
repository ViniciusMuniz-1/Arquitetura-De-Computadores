.text

main: addi $2, $0, 5
      syscall		#le a primeira nota
      add $8, $0, $2	#move 1 nota para reg $8
      addi $2, $0, 5
      syscall		#le a segunda nota
      
multpesos: addi $10, $0, 2	#adiciona peso 2 para o reg $10
	   addi $11, $0, 3	#adiciona peso 3 para o reg $11
	   mul $12, $8, $10	#multiplica primeira nota por 2
	   mul $13, $2, $11	#multiplica segunda nota por 3
	   add $14, $12, $13	#soma as notas multiplicadas pelos pesos
      	   addi $15, $0, 5	#adiciona valor para a divisão

divisao: div $14, $15

imprimir: mflo $4	#move o resultado da divisão para o reg $4
          addi $2, $0 1 
          syscall       #imprime a media
          
fim:	  addi $2, $0, 10
	  syscall	#fim do programa