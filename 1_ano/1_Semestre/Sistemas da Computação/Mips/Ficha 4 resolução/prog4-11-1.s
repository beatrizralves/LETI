# Ficheiro: 4_11.s
#Faça um novo programa que leia uma sequência de números inteiros, introduzidos na consola
#pelo utilizador. A quantidade de números introduzidos não é conhecida. O utilizador quando não
#quiser introduzir mais valores deverá introduzir o valor -1. Em seguida, o programa mostra na
#consola o número total de números lidos.

	.data	
Q: 	.asciiz 	"-> "
TEXTO1: 	.asciiz 	"Foram Lidos um total de: "
TEXTO2:		.asciiz     "A soma e:"
TEXTOMAIOR:  .asciiz	"	MAIOR valor introduzido"
TextoMenor:  .asciiz	"	Menor valor introduzido"
C: 	.word	0
NEWLINE: .asciiz   "\n"

	.text

main:
	li $s0, -1
	li $s1, 0    #contador
	li $s2, 0	#soma deos valores introduzidos
	li $s3, 0   #maior valor introduzido
	li $s4,50000#menor dos valores 
	li $v0, 4 			
	la $a0, Q #escreve a seta			
	syscall 
	li $v0, 5 			
	syscall #ler um inteiro			
	move $t1,$v0 #obter o valor introduzido
	beq $t1,$s0 ,FIM
	move $s3,$t1
	move $s4,$t1
	addi $s1,$s1,1  #incrementar o contador
	add $s2,$s2,$t1  #acumula a soma dos valorws lidos em s2
	# fim de introducao do primeiro numero
	
	
ler:
	li $v0, 4 			
	la $a0, Q #escreve a seta			
	syscall 			

	li $v0, 5 			
	syscall #ler um inteiro			
	move $t1,$v0 #obter o valor introduzido
	
	beq $t1,$s0 ,FIM
	addi $s1,$s1,1  #incrementar o contador
	add $s2,$s2,$t1  #acumula a soma dos valorws lidos em s2
	bgt $t1,$s3,novoMaior  #testar se e maior do que o maior numero conhecido
	
	
TESTE2:
	blt $t1, $s4,novoMenor  # testar se e menor do que o menor dos valores ja lidos
    j ler	



novoMaior:
	move $s3, $t1
	j TESTE2


novoMenor:
	move $s4, $t1
	j ler

	
FIM:
    li $v0, 4 			
	la $a0, TEXTO1  #escreve a seta			
	syscall 
	
	li $v0,1
	move $a0,$s1
	syscall    	# escree o valor do conatdor
	
	li $v0, 4 			
	la $a0, NEWLINE #escreve UMA LINHA 	
	syscall 
	
	li $v0, 4 			
	la $a0, TEXTO  #escreve a seta			
	syscall 
	
	
	

# FIM