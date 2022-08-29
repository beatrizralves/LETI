#este programa escreve todos os numeros do vector
#falta colocar uma condicao para verificar se o numero e multiplo de 2 e 4 ao mesmo tempo

	.data	

vector:	.word 	1, 2 , 4 , 5 , 6 ,  8 , 9 , 12 , 14 , 16 
nl:		.asciiz "\n"


	.text

main:			# In'icio da sec,ca~o 
	
	la $t0, vector	
	li $t1 ,0  #contador # posicao
	li $t2, 10 # limite 
	li $t3,0 
	li $s2,2
	li $s0,4
	
ciclo:	
	# escreve o inteiro qu esta na memoria no enderenco que esta em t0 
	lw $s1, ($t0)	
	move $a0, $s1	
	li $v0, 1
	syscall
	
multiplo2:
	div  $s1 ,$s2 
	mfhi $t4
	beq $t4,$t3,multiplo4

multiplo4:	
	div  $s1 ,$s0 
	mfhi $t5
	beq $t5,$t3,proximo
	
	
proximo:	
  # mudar linha
	la $a0,nl	
	li $v0,4	
	syscall
	
	
	addi $t1,$t1,1 #incrementa o contador 	
	addi $t0,$t0,4 #avancar na memoria
	beq $t1,$t2, FIM
	j ciclo
	
	
escrever:

	li $t1,0
	la $t0, vector	


FIM:
    li $v0, 10 		# terminar programa
	syscall