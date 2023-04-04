.text

main:  addi $2, $0, 5
       syscall		#le
       andi $8, $2, 1	#faz o and do numero com 1, se o resultado for 1 é impar, se for 0 é par
       mul  $4, $8, -1  #multiplica por -1
       addi $2, $0, 1
       syscall		#imprime
       addi $2, $0, 10
       syscall