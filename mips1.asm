.text 

main: addi $8, $0, 56
      addi $9, $0, 37
      add $10, $8, $9
      
      sub $11, $8, $9
      sub $12, $9, $8
      
      mul $13, $8, $9
      
      mult $8, $13
      mflo $14
      
      div $13, $8
