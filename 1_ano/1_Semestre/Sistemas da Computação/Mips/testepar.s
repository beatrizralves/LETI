# Ficheiro: contar.s

	.data	
I:		 .word 	0
LIMIT:	 .word	10
NEWLINE: .asciiz "\n"
msg1:    .asciiz "PAR"
msg2:    .asciiz "IMPAR"

	.text

main:
	lw $s1, I
	li $s2, 1
	lw $s3, LIMIT
	li $s4,0 
	li $t1,2
	li $t2,0 

start: 
	beq $s1,$s3,check
	li  $v0, 5			# identificador da chamada ao sistema para ler um inteiro
	syscall				# chamada ao sistema
	move $s1, $v0
	
	add $s4, $s4, $s1 #contador
	addi $s1, $s1, 1
	
	j start


check:
	div $s4,$t1
	mfhi $s5
	beq $s5,$t2,par
	li $v0, 4			# identificador da chamada ao sistema para escrever uma string
	la $a0, msg2	# carrega endere,co de A para $a0 (argumento necessa'rio para a fun,ca~o print_str)
	syscall	
	j end


par:
	li $v0, 4			# identificador da chamada ao sistema para escrever uma string
	la $a0, msg1	# carrega endere,co de A para $a0 (argumento necessa'rio para a fun,ca~o print_str)
	syscall	
	j end
	
end:
	li $v0,10
	syscall



			# chamada ao sistema

# FIM DO PROGRAMA