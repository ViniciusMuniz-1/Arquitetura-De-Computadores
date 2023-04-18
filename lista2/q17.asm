.text

main:	addi $2, $0, 5
	syscall
	add $8, $0, $2		#primeiro num no reg 10
	
	addi $25, $0, 10
	
decompondonum1: div $8, $25		#decompondo o num
		mfhi $10		#reg 8 possui dig menos sig do país
		mflo $8		
		div $8, $25
		mfhi $9			#reg 9 possui dig do meio do pais
		mflo $8			#reg 10 possui dig mais significativo
	
decompondonum2: addi $2, $0, 5
		syscall
		add $11, $0, $2
		
		div $11, $25
		mfhi $15		#menos sig empresa
		mflo $11
		
		div $11, $25
		mfhi $14		#meio da empresa
		mflo $11
		
		div $11, $25
		mfhi $13		#meio da empresa
		mflo $11
		
		div $11, $25
		mfhi $12		#meio da empresa
		mflo $11		#mais significativo
		
		
decompondonum3: addi $2, $0, 5
		syscall
		add $16, $0, $2
		
		div $16, $25
		mfhi $19		#menos sig
		mflo $16
		
		div $16, $25
		mfhi $18		#meio
		mflo $16
		
		div $16, $25
		mfhi $17		#meio
		mflo $16		#mais sig
	
somadeimpares:  add $20, $9, $11
		add $20, $20, $13
		add $20, $20, $15
		add $20, $20, $17
		add $20, $20, $19
		sll $21, $20, 1
		add $20, $21, $20
		
		add $21, $8, $10
		add $21, $21, $12
		add $21, $21, $14
		add $21, $21, $16
		add $21, $21, $18
		
		add $20, $20, $21
		
		
		div $20, $25
		
		mfhi $21
		sub $21, $0, $21
		srl $21, $21, 31
		
		mflo $22
		add $21, $21, $22
		mul $21, $21, $25
		
		sub $4, $21, $20
		addi $2, $0, 1
		syscall
		
		
imprimir:	add $4, $0, $21
		
fim: 	addi $2, $0, 10
	syscall