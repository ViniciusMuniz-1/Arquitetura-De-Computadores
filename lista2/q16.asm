.text

main:	addi $2, $0, 5	#leitura do cpf
	syscall
	
	
	addi $8, $0, 100000000	#adi��o para divis�o
	div $2, $8
	mflo $9			#$9 possui o 1� d�gito
	mfhi $26		#$26 possui o resto
	add  $27, $26, $0
	
	addi $8, $0, 10000000	#adi��o para divis�o
	div $26, $8		
	mflo $10		#10 possui o 2� d�gito
	mfhi $26		#$26 possui o resto
	
	addi $8, $0, 1000000	#adi��o para divis�o
	div $26, $8
	mflo $11		#$11 possui o 3� d�gito
	mfhi $26		#$26 possui o resto
	
	addi $8, $0, 100000	#adi��o para divis�o
	div $26, $8
	mflo $12		#$12 possui o 4� d�gito
	mfhi $26		#$26 possui o resto
	
	addi $8, $0, 10000	#adi��o para divis�o
	div $26, $8
	mflo $13		#$13 possui o 5� d�gito
	mfhi $26		#$26 possui o resto
	
	addi $8, $0, 1000	#adi��o para divis�o
	div $26, $8
	mflo $14		#$14 possui o 6� d�gito
	mfhi $26		#$26 possui o resto
	
	addi $8, $0, 100	#adi��o para divis�o
	div $26, $8
	mflo $15		#$15 possui o 7� d�gito
	mfhi $26		#$26 possui o resto
	
	addi $8, $0, 10		#adi��o para divis�o
	div $26, $8
	mflo $16		#$16 possui o 8� d�gito
	mfhi $26		#$26 possui o 9� d�gito
	
	
calculodig1:	addi $17, $0, 10	#adi��o para multiplica��o
		mul $9, $9, $17		#resultado da multiplica��o do 1� d�gito no reg 9
		
		addi $17, $0, 9		#adi��o para multiplica��o
		mul $10, $10, $17	#resultado da multiplica��o do 2� d�gito no reg 10
		
		addi $17, $0, 8		#adi��o para multiplica��o
		mul $11, $11, $17	#resultado da multiplica��o do 3� d�gito no reg 11
		
		addi $17, $0, 7		#adi��o para multiplica��o
		mul $12, $12, $17	#resultado da multiplica��o do 4� d�gito no reg 12
		
		addi $17, $0, 6		#adi��o para multiplica��o
		mul $13, $13, $17	#resultado da multiplica��o do 5� d�gito no reg 13
		
		addi $17, $0, 5		#adi��o para multiplica��o
		mul $14, $14, $17	#resultado da multiplica��o do 6� d�gito no reg 14
		
		addi $17, $0, 4		#adi��o para multiplica��o
		mul $15, $15, $17	#resultado da multiplica��o do 7� d�gito no reg 15
		
		addi $17, $0, 3		#adi��o para multiplica��o
		mul $16, $16, $17	#resultado da multiplica��o do 8� d�gito no reg 16
		
		addi $17, $0, 2		#adi��o para multiplica��o
		mul $26, $26, $17	#resultado da multiplica��o do 9� d�gito no reg 26
		
		
somadetodos: 	add $18, $9, $10	#in�cio da soma
		add $18, $18, $11
		add $18, $18, $12
		add $18, $18, $13
		add $18, $18, $14
		add $18, $18, $15
		add $18, $18, $16
		add $18, $18, $26	#soma entre todos guardada no $18
		
		addi $8, $0, 11		#adi��o para divis�o
		div $18, $8
		mfhi $20		#mover o resto para o $20
		
		addi $21, $0, 1		#adi��o para verifica��o
		beq $20, $0, digitoeh0	
		beq $20, $21, digitoeh0	#se o resto for = 0 ou = 1, ent�o o digito verificador � 0, se n�o ele vai para o 2� caso
		j digitoneh0
		
digitoeh0:	addi $24, $0, 0		#1� digito verificador no $24
		j divisaodenovo
		
digitoneh0:	sub $24, $8, $20	#1� digito verificador no $24

divisaodenovo:	addi $8, $0, 10000000	#adi��o para divis�o
		div $27, $8		
		mflo $10		#10 possui o 2� d�gito
		mfhi $27		#$27 possui o resto
	
		addi $8, $0, 1000000	#adi��o para divis�o
		div $27, $8
		mflo $11		#$11 possui o 3� d�gito
		mfhi $27		#$27 possui o resto
	
		addi $8, $0, 100000	#adi��o para divis�o
		div $27, $8
		mflo $12		#$12 possui o 4� d�gito
		mfhi $27		#$27 possui o resto
	
		addi $8, $0, 10000	#adi��o para divis�o
		div $27, $8
		mflo $13		#$13 possui o 5� d�gito
		mfhi $27		#$27 possui o resto
	
		addi $8, $0, 1000	#adi��o para divis�o
		div $27, $8
		mflo $14		#$14 possui o 6� d�gito
		mfhi $27		#$27 possui o resto
	
		addi $8, $0, 100	#adi��o para divis�o
		div $27, $8
		mflo $15		#$15 possui o 7� d�gito
		mfhi $27		#$27 possui o resto
	
		addi $8, $0, 10		#adi��o para divis�o
		div $27, $8
		mflo $16		#$16 possui o 8� d�gito
		mfhi $27		#$27 possui o 9� d�gito
		
calculodig2: 	addi $17, $0, 10	#adi��o para multiplica��o
		mul  $10, $10, $17	#resultado da multiplica��o do 1� d�gito no reg 10
		
		addi $17, $0, 9		#adi��o para multiplica��o
		mul $11, $11, $17	#resultado da multiplica��o do 2� d�gito no reg 11
		
		addi $17, $0, 8		#adi��o para multiplica��o
		mul $12, $12, $17	#resultado da multiplica��o do 3� d�gito no reg 12
		
		addi $17, $0, 7		#adi��o para multiplica��o
		mul  $13 $13, $17	#resultado da multiplica��o do 4� d�gito no reg 13
		
		addi $17, $0, 6		#adi��o para multiplica��o
		mul  $14, $14, $17	#resultado da multiplica��o do 5� d�gito no reg 14
		
		addi $17, $0, 5		#adi��o para multiplica��o
		mul  $15, $15, $17	#resultado da multiplica��o do 6� d�gito no reg 15
		
		addi $17, $0, 4		#adi��o para multiplica��o
		mul  $16, $16, $17	#resultado da multiplica��o do 7� d�gito no reg 16
		
		addi $17, $0, 3		#adi��o para multiplica��o
		mul  $27, $27, $17	#resultado da multiplica��o do 8� d�gito no reg 27
		
		addi $17, $0, 2		#adi��o para multiplica��o
		mul  $25, $24, $17	#resultado da multiplica��o do 9� d�gito no reg 25
		
somadetodos2:   add  $25, $25, $10
		add  $25, $25, $11
		add  $25, $25, $12
		add  $25, $25, $13
		add  $25, $25, $14
		add  $25, $25, $15
		add  $25, $25, $16
		add  $25, $25, $27	#soma de todos no reg 25
		
		addi $8, $0, 11		#adi��o para divis�o
		div  $25, $8		#divis�o
		mfhi $25
		
		addi $21, $0, 1		#adi��o para verifica��o
		beq $25, $0, digitoeh02	
		beq $25, $21, digitoeh02	#se o resto for = 0 ou = 1, ent�o o digito verificador � 0, se n�o ele vai para o 2� caso
		j digitoneh02
		
digitoeh02:	addi $25, $0, 0		#1� digito verificador no $24
		j impressao
		
digitoneh02:	sub $25, $8, $25	#1� digito verificador no $24

impressao:	addi $4, $24, 0
		addi $2, $0, 1
		syscall
		
		addi $4, $25, 0
		addi $2, $0, 1
		syscall
		
fim:	addi $2, $0, 10
	syscall