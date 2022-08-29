# Ficheiro:  vector01.s

	.data	
nl:		.asciiz "\n"
vector:	.word 	70, 602, 102, 18, 15, -4, 89, 8078, -475, 289



	.text

main:			# In'icio da sec,ca~o 
	
	la $t0, vector	
	li $t1 ,0  #contador
	li $t2, 10 # limite 
	
	
ciclo:	
	# escreve o inteiro qu esta na memoria no enderenco que esta em t0 
	lw $s1, ($t0)	
	move $a0, $s1	
	li $v0, 1
	syscall
  # mudar linha
	la $a0,nl	
	li $v0,4	
	syscall
	
	
	addi $t1,$t1,1 #incrementa o contador 	
	addi $t0,$t0,4 #avancar na memoria
	beq $t1,$t2, FIM
	j ciclo
	
	
	


FIM:
    li $v0, 10 		# terminar programa
	syscall