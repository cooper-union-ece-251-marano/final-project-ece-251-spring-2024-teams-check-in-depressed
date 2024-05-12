addi $s2, $zero, 10
move $a0, $s2      
jal fib
beq $zero, $zero, END


fib: 

addi $sp, $sp, -12  
sw $ra, 0($sp)  
sw $s0, 4($sp) 
sw $a0, 8($sp)  

beq $a0, $zero, isZero
beq $a0, 1, isOne

#else if case
addi $a0, $a0, -1
jal fib
move $s0, $v0

lw $a0, 8($sp)
addi $a0, $a0, -2
jal fib
add $v0, $v0, $s0

lw $s0, 8($sp)
lw $ra, 0($sp)
addi $sp, $sp, 12
jr $ra


isZero:
lw $s0, 4($sp)
lw $ra, 0($sp)
addi $sp, $sp, 12
add $v0, $zero, $zero
jr $ra


isOne:
lw $s0, 4($sp)
lw $ra, 0($sp)
addiu $sp, $sp, 12
addi $v0, $zero, 1
jr $ra