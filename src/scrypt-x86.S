# Copyright 2011 pooler@litecoinpool.org
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

#if defined(OPTIMIZED_SALSA) &&  defined(__i386__)

#if defined(__linux__) && defined(__ELF__)
.section .note.GNU-stack,"",%progbits
#endif

#define gen_salsa8_core_quadround() \
	movl	52(%DIG), %ecx; \
	movl	4(%DIG), %edx; \
	movl	20(%DIG), %ebx; \
	movl	8(%DIG), %esi; \
	leal	(%ecx, %edx), %edi; \
	roll	$7, %edi; \
	xorl	%edi, %ebx; \
	movl	%ebx, 4(%DIG); \
	movl	36(%DIG), %edi; \
	leal	(%edx, %ebx), %ebp; \
	roll	$9, %ebp; \
	xorl	%ebp, %edi; \
	movl	24(%DIG), %ebp; \
	movl	%edi, 8(%DIG); \
	addl	%edi, %ebx; \
	roll	$13, %ebx; \
	xorl	%ebx, %ecx; \
	movl	40(%DIG), %ebx; \
	movl	%ecx, 20(%DIG); \
	addl	%edi, %ecx; \
	roll	$18, %ecx; \
	leal	(%esi, %ebp), %edi; \
	roll	$7, %edi; \
	xorl	%edi, %ebx; \
	movl	%ebx, 24(%DIG); \
	movl	56(%DIG), %edi; \
	xorl	%ecx, %edx; \
	leal	(%ebp, %ebx), %ecx; \
	roll	$9, %ecx; \
	xorl	%ecx, %edi; \
	movl	%edi, 36(%DIG); \
	movl	28(%DIG), %ecx; \
	movl	%edx, 28(%DIG); \
	movl	44(%DIG), %edx; \
	addl	%edi, %ebx; \
	roll	$13, %ebx; \
	xorl	%ebx, %esi; \
	movl	60(%DIG), %ebx; \
	movl	%esi, 40(%DIG); \
	addl	%edi, %esi; \
	roll	$18, %esi; \
	leal	(%ecx, %edx), %edi; \
	roll	$7, %edi; \
	xorl	%edi, %ebx; \
	movl	%ebx, 44(%DIG); \
	movl	12(%DIG), %edi; \
	xorl	%esi, %ebp; \
	leal	(%edx, %ebx), %esi; \
	roll	$9, %esi; \
	xorl	%esi, %edi; \
	movl	%edi, 12(%DIG); \
	movl	48(%DIG), %esi; \
	movl	%ebp, 48(%DIG); \
	movl	64(%DIG), %ebp; \
	addl	%edi, %ebx; \
	roll	$13, %ebx; \
	xorl	%ebx, %ecx; \
	movl	16(%DIG), %ebx; \
	movl	%ecx, 16(%DIG); \
	addl	%edi, %ecx; \
	roll	$18, %ecx; \
	leal	(%esi, %ebp), %edi; \
	roll	$7, %edi; \
	xorl	%edi, %ebx; \
	movl	32(%DIG), %edi; \
	xorl	%ecx, %edx; \
	leal	(%ebp, %ebx), %ecx; \
	roll	$9, %ecx; \
	xorl	%ecx, %edi; \
	movl	%edi, 32(%DIG); \
	movl	%ebx, %ecx; \
	movl	%edx, 52(%DIG); \
	movl	28(%DIG), %edx; \
	addl	%edi, %ebx; \
	roll	$13, %ebx; \
	xorl	%ebx, %esi; \
	movl	40(%DIG), %ebx; \
	movl	%esi, 28(%DIG); \
	addl	%edi, %esi; \
	roll	$18, %esi; \
	leal	(%ecx, %edx), %edi; \
	roll	$7, %edi; \
	xorl	%edi, %ebx; \
	movl	%ebx, 40(%DIG); \
	movl	12(%DIG), %edi; \
	xorl	%esi, %ebp; \
	leal	(%edx, %ebx), %esi; \
	roll	$9, %esi; \
	xorl	%esi, %edi; \
	movl	%edi, 12(%DIG); \
	movl	4(%DIG), %esi; \
	movl	%ebp, 4(%DIG); \
	movl	48(%DIG), %ebp; \
	addl	%edi, %ebx; \
	roll	$13, %ebx; \
	xorl	%ebx, %ecx; \
	movl	16(%DIG), %ebx; \
	movl	%ecx, 16(%DIG); \
	addl	%edi, %ecx; \
	roll	$18, %ecx; \
	leal	(%esi, %ebp), %edi; \
	roll	$7, %edi; \
	xorl	%edi, %ebx; \
	movl	%ebx, 48(%DIG); \
	movl	32(%DIG), %edi; \
	xorl	%ecx, %edx; \
	leal	(%ebp, %ebx), %ecx; \
	roll	$9, %ecx; \
	xorl	%ecx, %edi; \
	movl	%edi, 32(%DIG); \
	movl	24(%DIG), %ecx; \
	movl	%edx, 24(%DIG); \
	movl	52(%DIG), %edx; \
	addl	%edi, %ebx; \
	roll	$13, %ebx; \
	xorl	%ebx, %esi; \
	movl	28(%DIG), %ebx; \
	movl	%esi, 28(%DIG); \
	addl	%edi, %esi; \
	roll	$18, %esi; \
	leal	(%ecx, %edx), %edi; \
	roll	$7, %edi; \
	xorl	%edi, %ebx; \
	movl	%ebx, 52(%DIG); \
	movl	8(%DIG), %edi; \
	xorl	%esi, %ebp; \
	leal	(%edx, %ebx), %esi; \
	roll	$9, %esi; \
	xorl	%esi, %edi; \
	movl	%edi, 8(%DIG); \
	movl	44(%DIG), %esi; \
	movl	%ebp, 44(%DIG); \
	movl	4(%DIG), %ebp; \
	addl	%edi, %ebx; \
	roll	$13, %ebx; \
	xorl	%ebx, %ecx; \
	movl	20(%DIG), %ebx; \
	movl	%ecx, 4(%DIG); \
	addl	%edi, %ecx; \
	roll	$18, %ecx; \
	leal	(%esi, %ebp), %edi; \
	roll	$7, %edi; \
	xorl	%edi, %ebx; \
	movl	36(%DIG), %edi; \
	xorl	%ecx, %edx; \
	leal	(%ebp, %ebx), %ecx; \
	roll	$9, %ecx; \
	xorl	%ecx, %edi; \
	movl	%edi, 20(%DIG); \
	movl	%ebx, %ecx; \
	movl	%edx, 36(%DIG); \
	movl	24(%DIG), %edx; \
	addl	%edi, %ebx; \
	roll	$13, %ebx; \
	xorl	%ebx, %esi; \
	movl	28(%DIG), %ebx; \
	movl	%esi, 24(%DIG); \
	addl	%edi, %esi; \
	roll	$18, %esi; \
	leal	(%ecx, %edx), %edi; \
	roll	$7, %edi; \
	xorl	%edi, %ebx; \
	movl	%ebx, 28(%DIG); \
	xorl	%esi, %ebp; \
	movl	8(%DIG), %esi; \
	leal	(%edx, %ebx), %edi; \
	roll	$9, %edi; \
	xorl	%edi, %esi; \
	movl	40(%DIG), %edi; \
	movl	%ebp, 8(%DIG); \
	movl	44(%DIG), %ebp; \
	movl	%esi, 40(%DIG); \
	addl	%esi, %ebx; \
	roll	$13, %ebx; \
	xorl	%ebx, %ecx; \
	movl	4(%DIG), %ebx; \
	movl	%ecx, 44(%DIG); \
	addl	%esi, %ecx; \
	roll	$18, %ecx; \
	leal	(%edi, %ebp), %esi; \
	roll	$7, %esi; \
	xorl	%esi, %ebx; \
	movl	%ebx, 4(%DIG); \
	movl	20(%DIG), %esi; \
	xorl	%ecx, %edx; \
	leal	(%ebp, %ebx), %ecx; \
	roll	$9, %ecx; \
	xorl	%ecx, %esi; \
	movl	%esi, 56(%DIG); \
	movl	48(%DIG), %ecx; \
	movl	%edx, 20(%DIG); \
	movl	36(%DIG), %edx; \
	addl	%esi, %ebx; \
	roll	$13, %ebx; \
	xorl	%ebx, %edi; \
	movl	24(%DIG), %ebx; \
	movl	%edi, 24(%DIG); \
	addl	%esi, %edi; \
	roll	$18, %edi; \
	leal	(%ecx, %edx), %esi; \
	roll	$7, %esi; \
	xorl	%esi, %ebx; \
	movl	%ebx, 60(%DIG); \
	movl	12(%DIG), %esi; \
	xorl	%edi, %ebp; \
	leal	(%edx, %ebx), %edi; \
	roll	$9, %edi; \
	xorl	%edi, %esi; \
	movl	%esi, 12(%DIG); \
	movl	52(%DIG), %edi; \
	movl	%ebp, 36(%DIG); \
	movl	8(%DIG), %ebp; \
	addl	%esi, %ebx; \
	roll	$13, %ebx; \
	xorl	%ebx, %ecx; \
	movl	16(%DIG), %ebx; \
	movl	%ecx, 16(%DIG); \
	addl	%esi, %ecx; \
	roll	$18, %ecx; \
	leal	(%edi, %ebp), %esi; \
	roll	$7, %esi; \
	xorl	%esi, %ebx; \
	movl	32(%DIG), %esi; \
	xorl	%ecx, %edx; \
	leal	(%ebp, %ebx), %ecx; \
	roll	$9, %ecx; \
	xorl	%ecx, %esi; \
	movl	%esi, 32(%DIG); \
	movl	%ebx, %ecx; \
	movl	%edx, 48(%DIG); \
	movl	20(%DIG), %edx; \
	addl	%esi, %ebx; \
	roll	$13, %ebx; \
	xorl	%ebx, %edi; \
	movl	24(%DIG), %ebx; \
	movl	%edi, 20(%DIG); \
	addl	%esi, %edi; \
	roll	$18, %edi; \
	leal	(%ecx, %edx), %esi; \
	roll	$7, %esi; \
	xorl	%esi, %ebx; \
	movl	%ebx, 8(%DIG); \
	movl	12(%DIG), %esi; \
	xorl	%edi, %ebp; \
	leal	(%edx, %ebx), %edi; \
	roll	$9, %edi; \
	xorl	%edi, %esi; \
	movl	%esi, 12(%DIG); \
	movl	28(%DIG), %edi; \
	movl	%ebp, 52(%DIG); \
	movl	36(%DIG), %ebp; \
	addl	%esi, %ebx; \
	roll	$13, %ebx; \
	xorl	%ebx, %ecx; \
	movl	16(%DIG), %ebx; \
	movl	%ecx, 16(%DIG); \
	addl	%esi, %ecx; \
	roll	$18, %ecx; \
	leal	(%edi, %ebp), %esi; \
	roll	$7, %esi; \
	xorl	%esi, %ebx; \
	movl	%ebx, 28(%DIG); \
	movl	32(%DIG), %esi; \
	xorl	%ecx, %edx; \
	leal	(%ebp, %ebx), %ecx; \
	roll	$9, %ecx; \
	xorl	%ecx, %esi; \
	movl	%esi, 32(%DIG); \
	movl	4(%DIG), %ecx; \
	movl	%edx, 4(%DIG); \
	movl	48(%DIG), %edx; \
	addl	%esi, %ebx; \
	roll	$13, %ebx; \
	xorl	%ebx, %edi; \
	movl	20(%DIG), %ebx; \
	movl	%edi, 20(%DIG); \
	addl	%esi, %edi; \
	roll	$18, %edi; \
	leal	(%ecx, %edx), %esi; \
	roll	$7, %esi; \
	xorl	%esi, %ebx; \
	movl	%ebx, 48(%DIG); \
	movl	40(%DIG), %esi; \
	xorl	%edi, %ebp; \
	leal	(%edx, %ebx), %edi; \
	roll	$9, %edi; \
	xorl	%edi, %esi; \
	movl	%esi, 36(%DIG); \
	movl	60(%DIG), %edi; \
	movl	%ebp, 24(%DIG); \
	movl	52(%DIG), %ebp; \
	addl	%esi, %ebx; \
	roll	$13, %ebx; \
	xorl	%ebx, %ecx; \
	movl	44(%DIG), %ebx; \
	movl	%ecx, 40(%DIG); \
	addl	%esi, %ecx; \
	roll	$18, %ecx; \
	leal	(%edi, %ebp), %esi; \
	roll	$7, %esi; \
	xorl	%esi, %ebx; \
	movl	%ebx, 52(%DIG); \
	movl	56(%DIG), %esi; \
	xorl	%ecx, %edx; \
	leal	(%ebp, %ebx), %ecx; \
	roll	$9, %ecx; \
	xorl	%ecx, %esi; \
	movl	%esi, 56(%DIG); \
	addl	%esi, %ebx; \
	movl	%edx, 44(%DIG); \
	roll	$13, %ebx; \
	xorl	%ebx, %edi; \
	movl	%edi, 60(%DIG); \
	addl	%esi, %edi; \
	roll	$18, %edi; \
	xorl	%edi, %ebp; \
	movl	%ebp, 64(%DIG); \


	.text
	.align 32
gen_salsa8_core:
	gen_salsa8_core_quadround()
	gen_salsa8_core_quadround()
	ret
	
	
	.text
	.align 32
	.globl scrypt_core
	.globl _scrypt_core
scrypt_core:
_scrypt_core:
	pushl	%ebx
	pushl	%ebp
	pushl	%edi
	pushl	%esi
	
	# Check for SSE2 availability
	movl	$1, %eax
	cpuid
	andl	$0x04000000, %edx
	jnz xmm_scrypt_core
	
gen_scrypt_core:
	movl	20(%DIG), %edi
	movl	24(%DIG), %esi
	subl	$72, %DIG
	
#define scrypt_core_macro1a(p, q) \
	movl	p(%edi), %eax; \
	movl	q(%edi), %edx; \
	movl	%eax, p(%esi); \
	movl	%edx, q(%esi); \
	xorl	%edx, %eax; \
	movl	%eax, p(%edi); \
	movl	%eax, p(%DIG); \

	
#define scrypt_core_macro1b(p, q) \
	movl	p(%edi), %eax; \
	xorl	p(%esi, %edx), %eax; \
	movl	q(%edi), %ebx; \
	xorl	q(%esi, %edx), %ebx; \
	movl	%ebx, q(%edi); \
	xorl	%ebx, %eax; \
	movl	%eax, p(%edi); \
	movl	%eax, p(%DIG); \

	
#define scrypt_core_macro2(p, q) \
	movl	p(%DIG), %eax; \
	addl	p(%edi), %eax; \
	movl	%eax, p(%edi); \
	xorl	q(%edi), %eax; \
	movl	%eax, q(%edi); \
	movl	%eax, p(%DIG); \

	
#define scrypt_core_macro3(p, q) \
	movl	p(%DIG), %eax; \
	addl	q(%edi), %eax; \
	movl	%eax, q(%edi); \

	
	leal	131072(%esi), %ecx
gen_scrypt_core_loop1:
	movl	%esi, 64(%DIG)
	movl	%ecx, 68(%DIG)
	
	scrypt_core_macro1a(0, 64)
	scrypt_core_macro1a(4, 68)
	scrypt_core_macro1a(8, 72)
	scrypt_core_macro1a(12, 76)
	scrypt_core_macro1a(16, 80)
	scrypt_core_macro1a(20, 84)
	scrypt_core_macro1a(24, 88)
	scrypt_core_macro1a(28, 92)
	scrypt_core_macro1a(32, 96)
	scrypt_core_macro1a(36, 100)
	scrypt_core_macro1a(40, 104)
	scrypt_core_macro1a(44, 108)
	scrypt_core_macro1a(48, 112)
	scrypt_core_macro1a(52, 116)
	scrypt_core_macro1a(56, 120)
	scrypt_core_macro1a(60, 124)
	
	call gen_salsa8_core
	
	movl	92(%DIG), %edi
	scrypt_core_macro2(0, 64)
	scrypt_core_macro2(4, 68)
	scrypt_core_macro2(8, 72)
	scrypt_core_macro2(12, 76)
	scrypt_core_macro2(16, 80)
	scrypt_core_macro2(20, 84)
	scrypt_core_macro2(24, 88)
	scrypt_core_macro2(28, 92)
	scrypt_core_macro2(32, 96)
	scrypt_core_macro2(36, 100)
	scrypt_core_macro2(40, 104)
	scrypt_core_macro2(44, 108)
	scrypt_core_macro2(48, 112)
	scrypt_core_macro2(52, 116)
	scrypt_core_macro2(56, 120)
	scrypt_core_macro2(60, 124)
	
	call gen_salsa8_core
	
	movl	92(%DIG), %edi
	scrypt_core_macro3(0, 64)
	scrypt_core_macro3(4, 68)
	scrypt_core_macro3(8, 72)
	scrypt_core_macro3(12, 76)
	scrypt_core_macro3(16, 80)
	scrypt_core_macro3(20, 84)
	scrypt_core_macro3(24, 88)
	scrypt_core_macro3(28, 92)
	scrypt_core_macro3(32, 96)
	scrypt_core_macro3(36, 100)
	scrypt_core_macro3(40, 104)
	scrypt_core_macro3(44, 108)
	scrypt_core_macro3(48, 112)
	scrypt_core_macro3(52, 116)
	scrypt_core_macro3(56, 120)
	scrypt_core_macro3(60, 124)
	
	movl	64(%DIG), %esi
	movl	68(%DIG), %ecx
	addl	$128, %esi
	cmpl	%ecx, %esi
	jne gen_scrypt_core_loop1

	movl	96(%DIG), %esi
	movl	$1024, %ecx
gen_scrypt_core_loop2:
	movl	%ecx, 68(%DIG)
	
	movl	64(%edi), %edx
	andl	$1023, %edx
	shll	$7, %edx
	
	scrypt_core_macro1b(0, 64)
	scrypt_core_macro1b(4, 68)
	scrypt_core_macro1b(8, 72)
	scrypt_core_macro1b(12, 76)
	scrypt_core_macro1b(16, 80)
	scrypt_core_macro1b(20, 84)
	scrypt_core_macro1b(24, 88)
	scrypt_core_macro1b(28, 92)
	scrypt_core_macro1b(32, 96)
	scrypt_core_macro1b(36, 100)
	scrypt_core_macro1b(40, 104)
	scrypt_core_macro1b(44, 108)
	scrypt_core_macro1b(48, 112)
	scrypt_core_macro1b(52, 116)
	scrypt_core_macro1b(56, 120)
	scrypt_core_macro1b(60, 124)
	
	call gen_salsa8_core
	
	movl	92(%DIG), %edi
	scrypt_core_macro2(0, 64)
	scrypt_core_macro2(4, 68)
	scrypt_core_macro2(8, 72)
	scrypt_core_macro2(12, 76)
	scrypt_core_macro2(16, 80)
	scrypt_core_macro2(20, 84)
	scrypt_core_macro2(24, 88)
	scrypt_core_macro2(28, 92)
	scrypt_core_macro2(32, 96)
	scrypt_core_macro2(36, 100)
	scrypt_core_macro2(40, 104)
	scrypt_core_macro2(44, 108)
	scrypt_core_macro2(48, 112)
	scrypt_core_macro2(52, 116)
	scrypt_core_macro2(56, 120)
	scrypt_core_macro2(60, 124)
	
	call gen_salsa8_core
	
	movl	92(%DIG), %edi
	movl	96(%DIG), %esi
	scrypt_core_macro3(0, 64)
	scrypt_core_macro3(4, 68)
	scrypt_core_macro3(8, 72)
	scrypt_core_macro3(12, 76)
	scrypt_core_macro3(16, 80)
	scrypt_core_macro3(20, 84)
	scrypt_core_macro3(24, 88)
	scrypt_core_macro3(28, 92)
	scrypt_core_macro3(32, 96)
	scrypt_core_macro3(36, 100)
	scrypt_core_macro3(40, 104)
	scrypt_core_macro3(44, 108)
	scrypt_core_macro3(48, 112)
	scrypt_core_macro3(52, 116)
	scrypt_core_macro3(56, 120)
	scrypt_core_macro3(60, 124)
	
	movl	68(%DIG), %ecx
	subl	$1, %ecx
	ja gen_scrypt_core_loop2
	
	addl	$72, %DIG
	popl	%esi
	popl	%edi
	popl	%ebp
	popl	%ebx
	ret


#define xmm_salsa8_core_doubleround() \
	movdqa	%xmm1, %xmm4; \
	paddd	%xmm0, %xmm4; \
	movdqa	%xmm4, %xmm5; \
	pslld	$7, %xmm4; \
	psrld	$25, %xmm5; \
	pxor	%xmm4, %xmm3; \
	pxor	%xmm5, %xmm3; \
	movdqa	%xmm0, %xmm4; \
	paddd	%xmm3, %xmm4; \
	movdqa	%xmm4, %xmm5; \
	pslld	$9, %xmm4; \
	psrld	$23, %xmm5; \
	pxor	%xmm4, %xmm2; \
	movdqa	%xmm3, %xmm4; \
	pshufd	$0x93, %xmm3, %xmm3; \
	pxor	%xmm5, %xmm2; \
	paddd	%xmm2, %xmm4; \
	movdqa	%xmm4, %xmm5; \
	pslld	$13, %xmm4; \
	psrld	$19, %xmm5; \
	pxor	%xmm4, %xmm1; \
	movdqa	%xmm2, %xmm4; \
	pshufd	$0x4e, %xmm2, %xmm2; \
	pxor	%xmm5, %xmm1; \
	paddd	%xmm1, %xmm4; \
	movdqa	%xmm4, %xmm5; \
	pslld	$18, %xmm4; \
	psrld	$14, %xmm5; \
	pxor	%xmm4, %xmm0; \
	pshufd	$0x39, %xmm1, %xmm1; \
	pxor	%xmm5, %xmm0; \
	movdqa	%xmm3, %xmm4; \
	paddd	%xmm0, %xmm4; \
	movdqa	%xmm4, %xmm5; \
	pslld	$7, %xmm4; \
	psrld	$25, %xmm5; \
	pxor	%xmm4, %xmm1; \
	pxor	%xmm5, %xmm1; \
	movdqa	%xmm0, %xmm4; \
	paddd	%xmm1, %xmm4; \
	movdqa	%xmm4, %xmm5; \
	pslld	$9, %xmm4; \
	psrld	$23, %xmm5; \
	pxor	%xmm4, %xmm2; \
	movdqa	%xmm1, %xmm4; \
	pshufd	$0x93, %xmm1, %xmm1; \
	pxor	%xmm5, %xmm2; \
	paddd	%xmm2, %xmm4; \
	movdqa	%xmm4, %xmm5; \
	pslld	$13, %xmm4; \
	psrld	$19, %xmm5; \
	pxor	%xmm4, %xmm3; \
	movdqa	%xmm2, %xmm4; \
	pshufd	$0x4e, %xmm2, %xmm2; \
	pxor	%xmm5, %xmm3; \
	paddd	%xmm3, %xmm4; \
	movdqa	%xmm4, %xmm5; \
	pslld	$18, %xmm4; \
	psrld	$14, %xmm5; \
	pxor	%xmm4, %xmm0; \
	pshufd	$0x39, %xmm3, %xmm3; \
	pxor	%xmm5, %xmm0; \


#define xmm_salsa8_core() \
	xmm_salsa8_core_doubleround(); \
	xmm_salsa8_core_doubleround(); \
	xmm_salsa8_core_doubleround(); \
	xmm_salsa8_core_doubleround(); \

	
	.align 32
xmm_scrypt_core:
	movl	20(%DIG), %edi
	movl	24(%DIG), %esi
	movl	%DIG, %ebp
	subl	$128, %DIG
	andl	$-16, %DIG
	
	# shuffle 1st block to (%DIG)
	movl	60(%edi), %edx
	movl	44(%edi), %ecx
	movl	28(%edi), %ebx
	movl	12(%edi), %eax
	movl	%edx, 12(%DIG)
	movl	%ecx, 28(%DIG)
	movl	%ebx, 44(%DIG)
	movl	%eax, 60(%DIG)
	movl	40(%edi), %ecx
	movl	24(%edi), %ebx
	movl	8(%edi), %eax
	movl	56(%edi), %edx
	movl	%ecx, 8(%DIG)
	movl	%ebx, 24(%DIG)
	movl	%eax, 40(%DIG)
	movl	%edx, 56(%DIG)
	movl	20(%edi), %ebx
	movl	4(%edi), %eax
	movl	52(%edi), %edx
	movl	36(%edi), %ecx
	movl	%ebx, 4(%DIG)
	movl	%eax, 20(%DIG)
	movl	%edx, 36(%DIG)
	movl	%ecx, 52(%DIG)
	movl	0(%edi), %eax
	movl	48(%edi), %edx
	movl	32(%edi), %ecx
	movl	16(%edi), %ebx
	movl	%eax, 0(%DIG)
	movl	%edx, 16(%DIG)
	movl	%ecx, 32(%DIG)
	movl	%ebx, 48(%DIG)
	
	# shuffle 2nd block to 64(%DIG)
	movl	124(%edi), %edx
	movl	108(%edi), %ecx
	movl	92(%edi), %ebx
	movl	76(%edi), %eax
	movl	%edx, 76(%DIG)
	movl	%ecx, 92(%DIG)
	movl	%ebx, 108(%DIG)
	movl	%eax, 124(%DIG)
	movl	104(%edi), %ecx
	movl	88(%edi), %ebx
	movl	72(%edi), %eax
	movl	120(%edi), %edx
	movl	%ecx, 72(%DIG)
	movl	%ebx, 88(%DIG)
	movl	%eax, 104(%DIG)
	movl	%edx, 120(%DIG)
	movl	84(%edi), %ebx
	movl	68(%edi), %eax
	movl	116(%edi), %edx
	movl	100(%edi), %ecx
	movl	%ebx, 68(%DIG)
	movl	%eax, 84(%DIG)
	movl	%edx, 100(%DIG)
	movl	%ecx, 116(%DIG)
	movl	64(%edi), %eax
	movl	112(%edi), %edx
	movl	96(%edi), %ecx
	movl	80(%edi), %ebx
	movl	%eax, 64(%DIG)
	movl	%edx, 80(%DIG)
	movl	%ecx, 96(%DIG)
	movl	%ebx, 112(%DIG)
	
	movl	%esi, %edx
	leal	131072(%esi), %ecx
xmm_scrypt_core_loop1:
	movdqa	0(%DIG), %xmm0
	movdqa	16(%DIG), %xmm1
	movdqa	32(%DIG), %xmm2
	movdqa	48(%DIG), %xmm3
	movdqa	64(%DIG), %xmm4
	movdqa	80(%DIG), %xmm5
	movdqa	96(%DIG), %xmm6
	movdqa	112(%DIG), %xmm7
	movdqa	%xmm0, 0(%edx)
	movdqa	%xmm1, 16(%edx)
	movdqa	%xmm2, 32(%edx)
	movdqa	%xmm3, 48(%edx)
	movdqa	%xmm4, 64(%edx)
	movdqa	%xmm5, 80(%edx)
	movdqa	%xmm6, 96(%edx)
	movdqa	%xmm7, 112(%edx)
	
	pxor	%xmm4, %xmm0
	pxor	%xmm5, %xmm1
	pxor	%xmm6, %xmm2
	pxor	%xmm7, %xmm3
	movdqa	%xmm0, 0(%DIG)
	movdqa	%xmm1, 16(%DIG)
	movdqa	%xmm2, 32(%DIG)
	movdqa	%xmm3, 48(%DIG)
	xmm_salsa8_core()
	paddd	0(%DIG), %xmm0
	paddd	16(%DIG), %xmm1
	paddd	32(%DIG), %xmm2
	paddd	48(%DIG), %xmm3
	movdqa	%xmm0, 0(%DIG)
	movdqa	%xmm1, 16(%DIG)
	movdqa	%xmm2, 32(%DIG)
	movdqa	%xmm3, 48(%DIG)
	
	pxor	64(%DIG), %xmm0
	pxor	80(%DIG), %xmm1
	pxor	96(%DIG), %xmm2
	pxor	112(%DIG), %xmm3
	movdqa	%xmm0, 64(%DIG)
	movdqa	%xmm1, 80(%DIG)
	movdqa	%xmm2, 96(%DIG)
	movdqa	%xmm3, 112(%DIG)
	xmm_salsa8_core()
	paddd	64(%DIG), %xmm0
	paddd	80(%DIG), %xmm1
	paddd	96(%DIG), %xmm2
	paddd	112(%DIG), %xmm3
	movdqa	%xmm0, 64(%DIG)
	movdqa	%xmm1, 80(%DIG)
	movdqa	%xmm2, 96(%DIG)
	movdqa	%xmm3, 112(%DIG)
	
	addl	$128, %edx
	cmpl	%ecx, %edx
	jne xmm_scrypt_core_loop1
	
	movl	$1024, %ecx
xmm_scrypt_core_loop2:
	movdqa	0(%DIG), %xmm0
	movdqa	16(%DIG), %xmm1
	movdqa	32(%DIG), %xmm2
	movdqa	48(%DIG), %xmm3
	movdqa	64(%DIG), %xmm4
	movdqa	80(%DIG), %xmm5
	movdqa	96(%DIG), %xmm6
	movdqa	112(%DIG), %xmm7
	movd	%xmm4, %edx
	andl	$1023, %edx
	shll	$7, %edx
	pxor	0(%esi, %edx), %xmm0
	pxor	16(%esi, %edx), %xmm1
	pxor	32(%esi, %edx), %xmm2
	pxor	48(%esi, %edx), %xmm3
	pxor	64(%esi, %edx), %xmm4
	pxor	80(%esi, %edx), %xmm5
	pxor	96(%esi, %edx), %xmm6
	pxor	112(%esi, %edx), %xmm7
	movdqa	%xmm4, 64(%DIG)
	movdqa	%xmm5, 80(%DIG)
	movdqa	%xmm6, 96(%DIG)
	movdqa	%xmm7, 112(%DIG)
	
	pxor	%xmm4, %xmm0
	pxor	%xmm5, %xmm1
	pxor	%xmm6, %xmm2
	pxor	%xmm7, %xmm3
	movdqa	%xmm0, 0(%DIG)
	movdqa	%xmm1, 16(%DIG)
	movdqa	%xmm2, 32(%DIG)
	movdqa	%xmm3, 48(%DIG)
	xmm_salsa8_core()
	paddd	0(%DIG), %xmm0
	paddd	16(%DIG), %xmm1
	paddd	32(%DIG), %xmm2
	paddd	48(%DIG), %xmm3
	movdqa	%xmm0, 0(%DIG)
	movdqa	%xmm1, 16(%DIG)
	movdqa	%xmm2, 32(%DIG)
	movdqa	%xmm3, 48(%DIG)
	
	pxor	64(%DIG), %xmm0
	pxor	80(%DIG), %xmm1
	pxor	96(%DIG), %xmm2
	pxor	112(%DIG), %xmm3
	movdqa	%xmm0, 64(%DIG)
	movdqa	%xmm1, 80(%DIG)
	movdqa	%xmm2, 96(%DIG)
	movdqa	%xmm3, 112(%DIG)
	xmm_salsa8_core()
	paddd	64(%DIG), %xmm0
	paddd	80(%DIG), %xmm1
	paddd	96(%DIG), %xmm2
	paddd	112(%DIG), %xmm3
	movdqa	%xmm0, 64(%DIG)
	movdqa	%xmm1, 80(%DIG)
	movdqa	%xmm2, 96(%DIG)
	movdqa	%xmm3, 112(%DIG)
	
	subl	$1, %ecx
	ja xmm_scrypt_core_loop2
	
	# re-shuffle 1st block back
	movl	60(%DIG), %edx
	movl	44(%DIG), %ecx
	movl	28(%DIG), %ebx
	movl	12(%DIG), %eax
	movl	%edx, 12(%edi)
	movl	%ecx, 28(%edi)
	movl	%ebx, 44(%edi)
	movl	%eax, 60(%edi)
	movl	40(%DIG), %ecx
	movl	24(%DIG), %ebx
	movl	8(%DIG), %eax
	movl	56(%DIG), %edx
	movl	%ecx, 8(%edi)
	movl	%ebx, 24(%edi)
	movl	%eax, 40(%edi)
	movl	%edx, 56(%edi)
	movl	20(%DIG), %ebx
	movl	4(%DIG), %eax
	movl	52(%DIG), %edx
	movl	36(%DIG), %ecx
	movl	%ebx, 4(%edi)
	movl	%eax, 20(%edi)
	movl	%edx, 36(%edi)
	movl	%ecx, 52(%edi)
	movl	0(%DIG), %eax
	movl	48(%DIG), %edx
	movl	32(%DIG), %ecx
	movl	16(%DIG), %ebx
	movl	%eax, 0(%edi)
	movl	%edx, 16(%edi)
	movl	%ecx, 32(%edi)
	movl	%ebx, 48(%edi)
	
	# re-shuffle 2nd block back
	movl	124(%DIG), %edx
	movl	108(%DIG), %ecx
	movl	92(%DIG), %ebx
	movl	76(%DIG), %eax
	movl	%edx, 76(%edi)
	movl	%ecx, 92(%edi)
	movl	%ebx, 108(%edi)
	movl	%eax, 124(%edi)
	movl	104(%DIG), %ecx
	movl	88(%DIG), %ebx
	movl	72(%DIG), %eax
	movl	120(%DIG), %edx
	movl	%ecx, 72(%edi)
	movl	%ebx, 88(%edi)
	movl	%eax, 104(%edi)
	movl	%edx, 120(%edi)
	movl	84(%DIG), %ebx
	movl	68(%DIG), %eax
	movl	116(%DIG), %edx
	movl	100(%DIG), %ecx
	movl	%ebx, 68(%edi)
	movl	%eax, 84(%edi)
	movl	%edx, 100(%edi)
	movl	%ecx, 116(%edi)
	movl	64(%DIG), %eax
	movl	112(%DIG), %edx
	movl	96(%DIG), %ecx
	movl	80(%DIG), %ebx
	movl	%eax, 64(%edi)
	movl	%edx, 80(%edi)
	movl	%ecx, 96(%edi)
	movl	%ebx, 112(%edi)
	
	movl	%ebp, %DIG
	popl	%esi
	popl	%edi
	popl	%ebp
	popl	%ebx
	ret

#endif
