# Declare the listed label(s) as global to enable referencing from other files

.globl division

division:

    addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
    sw ra, 0(sp) # save the return address (ra register) 
    # save other registers to stack if needed
    
    # body of the function, write your code here
    #get dividend
    addi t0, x10, 0
    
    #get divisor
    addi t1, x11, 0
    
    #quotient
    addi t2, x0, 1

    WHILE:
    	ble t0, t1, WHILE2	
    	slli t1, t1, 1
        slli t2, t2, 1
        j WHILE
	
	
    WHILE2:
   	ble t1, t0, END
    	sub t1, t1, x11
    	addi t2, t2, -1
    	j WHILE2
    	 
    END:
    sub x11, x10, t1
    addi x10, t2, 0
    
    
    # restore registers from stack if needed
    lw ra, 0(sp) # Restore return address register
    addi sp, sp, 4 # deallocate space for stack frame
    ret # return to calling point
