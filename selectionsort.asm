.data

	array: .word 42, 18, 27, 66, 85, 94, 13, 32, 11, 20 # array decleration
	array1: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	preMsg: .asciiz  "The array to be sorted is: "
	sortMessage: .asciiz "\nThe Sorted Array: " #prints out this ish
	commaSpace: .asciiz ", "
	asdf: .asciiz "\n\n"
.text

main:
la $t0, array
li $t9, 9
li $t5, 10
li $t8, 0
move $s0, $t0


li $v0, 4
la $a0, preMsg
syscall

prePrint:
	bgt		$t8, $t9, yeet	# if $t8 > $t9 then
	lw $t1, 0($t0)

	li $v0, 1
	move $a0, $t1
	syscall

	beq		$t8, $t9, barf	# if $t8 == $t9 tbarf
		li $v0, 4
		la $a0, commaSpace
		syscall
	barf:

addi	$t8, $t8, 1			# $t8 = $t8 + 1
addi	$t0, $t0, 4			# $t0 = $t0 + 4
j prePrint

yeet:


li $t8, 0
move $t0, $s0


li $v0, 4
la $a0, asdf
syscall

loop1:

	bgt		$t8, $t9, sortFin	# if $t8 > $t9 then
		lw $t1, 0($t0)
		addi	$t7, $t8, 1			# $t7 = $t8 + 1
		move 	$t4, $t0		# $t4 = $t0

		loop2:
			bgt		$t7, $t5, exitLP2	# if $t7 > 5then
				addi	$t4, $t4, 4			# $t4 = $t4 + 4
				lw $t2, 0($t4)
				bgt		$t2, $t1, skipS	# if $t2 > $t1 then skip
					sw		$t1, 0($t4)		#
					move 	$t1, $t2		# $t1 = $t2
				skipS:
				addi	$t7, $t7, 1			# $t7 = $t7 + 1
		j loop2
		exitLP2:

		sw		$t1, 0($t0)
		addi	$t0, $t0, 4			#  = 0+ 4
		addi $t8, $t8, 1
j loop1
sortFin:

move 	$t0, $s0		#  =
li $t8, 0

li $v0, 4
la $a0, sortMessage
syscall

postPrint:
	bgt		$t8, $t9, exit	# if $t8 > $t9 then
	lw $t1, 0($t0)

	li $v0, 1
	move $a0, $t1
	syscall

	beq		$t8, $t9, stopThat	# if $t8 == $t9 tbarf
		li $v0, 4
		la $a0, commaSpace
		syscall
	stopThat:

addi	$t8, $t8, 1			# $t8 = $t8 + 1
addi	$t0, $t0, 4			# $t0 = $t0 + 4
j postPrint

exit:

li	$v0, 10
	syscall
