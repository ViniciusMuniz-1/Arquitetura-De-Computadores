.text

main:  addi $2, $0, 5
       syscall		#le o primeiro numero
       add $8, $0, $2	#move o num1 para o reg 8
       addi $2, $0, 5
       syscall		#le o segundo numero
       add $9, $0, $2	#move o num2 para o reg 9
       
       sub $10, $9, $8	
       #subtração entre os 2 num, se for positivo num 2 é maior que num 1, caso não, num 1 é maior
       add $11, $10, $0
       not $11, $11
       
       srl $10, $10, 31
       srl $11, $11, 31
       
       mul $12, $10, $9
       mul $13, $11, $8
       add $4, $12, $13
       addi $2, $0, 1
       syscall
       
       addi $2, $0, 10
       syscall