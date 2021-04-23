# Declare the listed label(s) as global to enable referencing from other files

.globl atoi

str2int:
	lb t0, 0(s0) #load 1st byte into t1
	
	addi t6, x0, 10 #10, needed for math
	addi t5, x0, 48 #ascii 48 = '0'
	addi t4, x0, 57 #ascii 57 = '9'
	addi s11, x0, 95
	
	# 43 = '+', 45 = '-'
	addi t2, x0, 45
	beq t0, t2, NEG #check if first digit is -
	addi t2, x0, 43
	beq t0, t2, POS #check if fisrt digit is +
	j POS
	NEG: 
		addi t1, x0, 1 #flag as -
		addi s0, s0, 1
		j CONV
	POS: 
		addi t1, x0, 0 #flag as +
		addi s0, s0, 1
		j CONV
	CONV: 
		li s1, 0 #sum = 0
	LOOP:
		lb t0, 0(s0)
		beqz t0, EXIT
		
		blt t0, t5, FAIL
		bgt t0, t4, FAIL
		addi t0, t0, -48
		mul s1, s1, t6
		add s1, s1, t0
		addi s0, s0, 1
		j LOOP
	EXIT:
		beq t1, x0, CPY
		neg s1, s1
	CPY:
		mv t1, s1
		j RET
	FAIL:
		li t1, -1
	RET:
		ret
	
atoi:

	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register) 
	# save other registers to stack if needed
	
	addi s0, x10, 0
	jal str2int
	mv x10, t1
		
	# restore registers from stack if needed
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point
