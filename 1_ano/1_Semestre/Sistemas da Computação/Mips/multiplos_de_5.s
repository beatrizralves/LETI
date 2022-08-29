            .data
n:			.half 8
vector:     .word 10, 4 , 87 , 120 , 80 , 2 , 50 , 30
msg:		.asciiz "MULTIPLOS DE CINCO:"
nl:         .asciiz "\n"

            .text
            
main: 

        la $t0, vector    # Vetor constituido por 6 numeros
        li $t1, 0        # Contador 
        lh $t2, n        # Limite do Vetor
        li $t3, 5        # dividir por 5 
        li $t4, 0       # resto
        
cicle: 

        lw $s1,($t0) # carregar vetor
        bgt $s1, $t3, div5
        
contador:
            
            addi $t1, $t1, 1 #incrementar o contador
            addi $t0, $t0, 4 # mudar para a posicao seguinte do vetor
            beq $t1, $t2, fim
            j cicle
        
div5: 

            div $s1, $t3
			mfhi $s0
			beq $s0,$t4,escrever
            j contador
        
escrever:

        move $a0, $s1 # escrever inteiro
        li $v0, 1
        syscall
        
        la $a0, nl  #escrever o enter
        li $v0, 4
        syscall
        j contador

fim:

        li $v0, 10
        syscall