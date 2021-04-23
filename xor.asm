# Declare the listed label(s) as global to enable referencing from other files
.globl max_xor

max_xor:

	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register) 
	# save other registers to stack if needed
	
	# body of the function, write your code here
	#each element is 32bits long, shift 4 to shift 1 element
	
	#get array size
	addi t0, x11, 0
	
	#copy array to t1 & t2
	addi t1, x10, 0
	
	
	#declare max and max_prev
	addi t3, zero, 0
	addi t4, zero, 0
	
	#declare i
	addi s0, zero, 0 #i
	

	LOOP1:	bge s0, t0, BREAK1
		lw a3 0(t1)
		addi t1, t1, 4
		addi s0, s0, 1
		addi s1, zero, 0 #j
		addi t2, x10, 0
		
	LOOP2:	bge s1, t0, LOOP1
			
		lw a4, 0(t2)
		
		xor a5, a3, a4
		blt a5, t3, LESS
		addi t4, t3, 0
		addi t3, a5, 0
		LESS: 	
		addi t3, t3, 0
		
		addi t2, t2, 4
		addi s1, s1, 1
		j LOOP2
	BREAK1:
	addi x10, t3, 0
	# restore registers from stack if needed
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point
