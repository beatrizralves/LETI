# Ficheiro:  vector01.s

	.data	
vector:	.space 40
nl:		.asciiz "\n"

prompt: .asciiz"->"


	.text

main:			# In'icio da sec,ca~o 
	
	la $t0, vector	
	li $t1 ,0  #contador
	li $t2, 10 # limite 
	
cicloler:

	la $a0, prompt
	li$v0,4
	syscall
	
	
	li $v0,5
	syscall  #ler inteiro
	
	sw $v0, ($t0)   #guardarno vetor
	
	addi $t1,$t1,1  #incrementar o contador
	addi $t0,$t0,4 # incrementar  para passar para a 
	beq $t1,$t2, escrever 
	j cicloler
	
	
escrever:

	li $t1,0
	la $t0, vector
	
	
	
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