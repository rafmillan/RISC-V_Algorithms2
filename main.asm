.data
str: # input for atoi function
	.asciz "-170\2"

space : .asciz " "

arr_sort: .word 5,3,2,1,4,-8,-4,0	
#arr_sort: .word 2,3,5,7,1,-1,0,9

#arr_xor: .word 25,10,25,10,25,10
#arr_xor: .word 25,10,2,8,5,3
arr_xor: .word 1,2,3,4,5,6,7

.text

# macro to terminate the simualtion
.macro exit ()
.text
li a7,10
ecall
.end_macro

# macro to print a integer value
.macro print_int (%reg)
.text
li a7,1
add x10, %reg, x0 
ecall
.end_macro

# marco to print a hexadecimal value
.macro print_hex (%reg)
.text
li a7,34
add x10, %reg, x0 
ecall
.end_macro

# macro to print a string
.macro print_str (%str)
.data
str_label: .string %str
.text
li a7, 4
la x10, str_label
ecall
.end_macro

.macro print_array(%arr, %size)

	addi t1,zero,0
	li t5,4
	mul t5,t5,%size
	
while:
	lw t4, 0(%arr)

	addi %arr,%arr,4
	
	addi t1,t1,4
	
	li a7,1
	add x10, t4, x0 
	ecall
		
	li a7, 4
	la x10, space
	ecall

	blt t1, t5, while

.end_macro


.globl main
main: 

# Use the following labels for functions
	# problem 1: atoi
	# problem 2: sort
	# problem 3: division
	# problem 4: max_xor
	
	
	#to test atoi function
	print_str("\nOutput of atoi function\n")
	la x10, str # load addres of the input
	call atoi
	mv t0, a0
	print_str("Value stored in x10:")
	print_int(t0)
	
	#to test selection sort function
	print_str("\nOutput of sort function\n")
	la t2,arr_sort
	li x11, 8
	print_str("Unsorted Array:")
	print_array(t2,x11)
	print_str("\n")
	la x10,arr_sort
	call sort
	print_str("Sorted Array:")
	la t2, arr_sort
	print_array(t2,x11)
	
	#to test division function
	print_str("\nOutput of Division function\n")
	li x10, 1 # dividend
	li x11, 8 #divisor
	call division
	mv t0, a0
	mv t1, a1
	print_str("Quotient stored in x10:")
	print_int(t0)
	print_str("\nRemainder stored in x11:")
	print_int(t1)
	
	#to test the max_XOR function
	print_str("\nOutput of Max XOR function\n")
	la x10,arr_xor
	li x11, 7
	call max_xor
	mv t0, a0
	print_str("Value stored in x10:")
	print_int(t0)
		
	exit()



	
