	.data
contador: .word 0
textosaida: .asciiz "Numeros maiores que 10:"

	.text
	
main: 
	li $s0,0 #Inicalizar o contador

ciclo:
	li $v0,5 #Leitura de um inteiro fica guardado em v0
	syscall
	
	li $s1,0   #carregar "imediatamente" para s1 o zero
	beq $v0,$s1 fim #comparar se v0 e igual a s1 ou seja se o numero lido e igual a zero se sim o programa salta para o fim 
	
	li $s2,10	#carregar "imediatamente" para s1 o dez
	bgt $v0,$s2 contador_num #comparar se v0 e maior a s2 ou seja se o numero lido e maior q dez se sim o programa salta para contador_num 
	j ciclo
	
	
contador_num:
	addi $s0, $s0, 1
	sw $s0, contador
	j ciclo
	
	
fim:
	li $v0, 4
	la $a0,textosaida
	syscall
	
	li $v0, 1
	lw $a0,contador
	syscall
	