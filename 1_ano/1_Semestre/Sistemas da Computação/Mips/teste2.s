            .data
vector:        .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
nl:            .asciiz "\n"
            .text
            
main: 

        la $t0, vector    # Vetor constituido por 12 numeros
        li $t1, 0        # Contador 
        li $t2, 12        # Limite do Vetor
        li $t3, 3        # Registo com o valor de 3
        li $t4, 7        # Registo com o valor de 7
        
cicle: 

        lw $s1,($t0)
        bgt $s1, $t3, maior3
        
contador:
            
            addi $t1, $t1, 1
            addi $t0, $t0, 4
            beq $t1, $t2, fim
            j cicle
        
maior3: 

            blt $s1, $t4, menor7
            j contador
        
menor7:

        move $a0, $s1
        li $v0, 1
        syscall
        
        la $a0, nl
        li $v0, 4
        syscall
        j contador

fim:

        li $v0, 10
        syscall