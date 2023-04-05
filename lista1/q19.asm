.text

main:  addi $2, $0, 5
       syscall
       add $8, $0, $2
       addi $18, $0, 8
       div $8, $18
       mflo $9	#extra
       add $10, $8, $9	#mes+extra
       andi $11, $10, 1	#par ou impar
       addi $4, $11, 30
       addi $2, $0, 1
       syscall
       addi $2, $0, 10
       syscall
