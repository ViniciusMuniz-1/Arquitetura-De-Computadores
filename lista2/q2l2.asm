.text


main:addi $2, $0, 5
     syscall
     
     srl $8, $2, 31
     
     addi $9, $0, 1 
     beq $8, $0, positivo
     beq $8, $9, negativo
     
     positivo: add $4, $2, $2
     	       addi $2, $0, 1
     	       syscall
     	       addi $2, $0, 10
     	       syscall
     	       
     negativo: mul $4, $2, $2
     	       addi $2, $0, 1
     	       syscall
     	       addi $2, $0, 10
     	       syscall
