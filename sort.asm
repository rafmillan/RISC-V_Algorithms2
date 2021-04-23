# Declare the listed label(s) as global to enable referencing from other files

.globl sort

swap:
	addi s0, x10, 0 #arr
	mv t4, s1 #i 
	mv t5, s2 #j
	
	slli t4, t4, 2 # i*4
	slli t5, t5, 2  # j*4
	
	add t3, s0, t4 #shift t3 to index i - arr[i]
	lw s4, 0(t3) #s4 = arr[i]
	
	add t3, s0, t5 #shift t3 to index j - arr[j]
	lw s5, 0(t3) #s5 = arr[j]
	
	sw s4, 0(t3) 	#arr[j] = s4
	add t3, s0, t4
	sw s5, 0(t3)	#arr[j] = s5
	
	jr ra

recur:
	addi s1, x0, 0 # min
	addi s6, s2, 1 # j
	addi s1, s2, 0 #int min = i
	FOR1:	bge s6, x11, BREAK1 #for(j = i + 1; j < n; j++)
		slli s7, s6, 2 #j * 4 to get index
		slli s8, s1, 2 #min * 4 to get index
		
		#if(arr[j] < arr[min])
		add s9, x10, s7 #get jth index of x10
		lw t0, 0(s9) #t0 = arr[j]
		add s9, x10, s8 #get minth index of x10
		lw t1, 0(s9) #t1 = arr[min]
		bge t0, t1, NOMIN #if arr[j] < arr[min] then min = j;
		addi s1, s6, 0 #min = j
		NOMIN:
		addi s6, s6, 1 #j + 1
		j FOR1
		
	BREAK1: 
		jal swap
		 
		addi s10, s2, 1 #i + 1 = temp
		bge s10, x11, NOREC
		addi s2, s2, 1 #i + 1 for recur
		
		jal recur
		
	NOREC:
		lw ra, 0(sp) # Restore return address register
		addi sp, sp, 4 # deallocate space for stack frame
		ret # return to calling point
sort:
	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register) 
	addi a6, ra, 0
	# save other registers to stack if needed
	addi s2, x0, 0 # i
	jal recur
	
	# restore registers from stack if needed
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point
