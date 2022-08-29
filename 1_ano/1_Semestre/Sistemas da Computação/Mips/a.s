# UNTITLED PROGRAM

	.data		# Data declaration section

porto:	.word 70 , 602 , 102 , 18	# array com 4 words
gil:	.space 20		# array de 20 bytes vazio
nl:	.asciiz "\n"		# declara um array com mudança de linha

	.text

main:		# Start of code section
	la $s0, porto 		# carregar array porto
	la $s1, gil		# carregar array gil
	add $s3, $s0, 12	# controlo de ciclo
	add $s4, $s1, 12	# controlo escrever
	li, $t0, 0		# carrega para t0 o valor de 0

ciclo:	lw $t0, ($s0) 		# carregar valor do endereço s0 para t0
	sw $t0, 0($s1)		# guardar valor de t0 em s1
	addi $s0, 4		# array porto passa para word seguinte
	addi $s1, 4		# array gil passa para word seguinte
	bgt $s0, $s3, GIL_0	# quando o valor o endereço de s0 for maior que s3, salta para GIL_0
	j ciclo			# repete 'ciclo'

GIL_0: la $s1, gil	# carrega primeira posição do array gil para s1

escrever: 	li $v0, 1	# carrega o código de chamada apropriada sistema em registo $v0
		lw $a0, ($s1)	# escrever na consola o valor contido no endereço de s1
		syscall		# chamada de sistema operacional para executar a operação

		la $a0, nl	# escreve na consola a string nl(acrescenta uma linha)
		li $v0, 4	# carrega o código de chamada apropriada sistema em registo $v0
		syscall

		add $s1, $s1, 4		# array gil passa para word seguinte	
		bgt $s1, $s4, end	# quando o valor o endereço de s1 for maior que s4, salta para end
		j escrever		# repete 'escrever'

end:		# END OF PROGRAM