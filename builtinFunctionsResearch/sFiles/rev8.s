	.file	"rev8.c"
	.option nopic
	.attribute arch, "rv64i2p1_f2p2_d2p2_zicsr2p0_zbb1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	test
	.type	test, @function
test:
	rev8	a0,a0
	srai	a0,a0,32
	ret
	.size	test, .-test
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%d"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lui	a0,%hi(.LC0)
	addi	sp,sp,-16
	li	a1,-1146486784
	addi	a0,a0,%lo(.LC0)
	sd	ra,8(sp)
	call	printf
	ld	ra,8(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (crosstool-NG 1.25.0.202_11d286d) 13.1.0"
