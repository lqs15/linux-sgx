/*
* Math library
*
* Copyright (C) 2016 Intel Corporation. All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions
* are met:
*
*   * Redistributions of source code must retain the above copyright
*     notice, this list of conditions and the following disclaimer.
*   * Redistributions in binary form must reproduce the above copyright
*     notice, this list of conditions and the following disclaimer in
*     the documentation and/or other materials provided with the
*     distribution.
*   * Neither the name of Intel Corporation nor the names of its
*     contributors may be used to endorse or promote products derived
*     from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
* "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
* A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
* OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
* SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
* LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
* THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
*
* Author Name <jingwei.zhang@intel.com>
*   History:
*   03-14-2016 Initial version. numerics svn rev. 12864
*/
	.file "frexp_wmt.c"
	.text
..TXTST0:
# -- Begin  static_func
	.text
       .align    16,0x90
static_func:
..B1.1:
..L1:

        call      ..L2
..L2:
        popl      %eax
        lea       _GLOBAL_OFFSET_TABLE_+[. - ..L2](%eax), %eax
        lea       static_const_table@GOTOFF(%eax), %eax
        ret       
        .align    16,0x90
	.type	static_func,@function
	.size	static_func,.-static_func
	.data
# -- End  static_func
	.text
# -- Begin  frexp
	.text
       .align    16,0x90
	.globl frexp
frexp:
# parameter 1: 8 + %ebp
# parameter 2: 16 + %ebp
..B2.1:
..L3:

..B2.2:
        pushl     %ebp
        movl      %esp, %ebp
        subl      $104, %esp
        movl      %ebx, 48(%esp)
        call      static_func
        movl      %eax, %ebx
        movsd     112(%esp), %xmm0
        movsd     %xmm0, 8(%esp)
        movl      120(%esp), %ecx
        pextrw    $3, %xmm0, %eax
        movq      (%ebx), %xmm1
        andl      $32767, %eax
        movq      16(%ebx), %xmm2
        subl      $16, %eax
        js        .L_2TAG_PACKET_0.0.2
        cmpl      $32736, %eax
        jae       .L_2TAG_PACKET_1.0.2
        shrl      $4, %eax
        pand      %xmm1, %xmm0
        subl      $1021, %eax
        por       %xmm2, %xmm0
        movl      %eax, (%ecx)
        movq      %xmm0, 8(%esp)
        fldl      8(%esp)
        jmp       .L_2TAG_PACKET_2.0.2
.L_2TAG_PACKET_0.0.2:
        pxor      %xmm3, %xmm3
        movq      32(%ebx), %xmm4
        xorl      %eax, %eax
        comisd    %xmm3, %xmm0
        je        .L_2TAG_PACKET_3.0.2
        mulsd     %xmm4, %xmm0
        pextrw    $3, %xmm0, %eax
        andl      $32767, %eax
        pand      %xmm1, %xmm0
        shrl      $4, %eax
        por       %xmm2, %xmm0
        subl      $1077, %eax
        movq      %xmm0, 8(%esp)
.L_2TAG_PACKET_3.0.2:
        movl      %eax, (%ecx)
        fldl      8(%esp)
        jmp       .L_2TAG_PACKET_2.0.2
.L_2TAG_PACKET_1.0.2:
        xorl      %eax, %eax
        fld1      
        movl      %eax, (%ecx)
        fmull     8(%esp)
.L_2TAG_PACKET_2.0.2:
        movl      48(%esp), %ebx
        movl      %ebp, %esp
        popl      %ebp
        ret       
..B2.3:
        .align    16,0x90
	.type	frexp,@function
	.size	frexp,.-frexp
	.data
# -- End  frexp
	.section .rodata, "a"
	.align 16
	.align 16
static_const_table:
	.long	4294967295
	.long	2148532223
	.long	4294967295
	.long	2148532223
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1130364928
	.long	0
	.long	1130364928
	.type	static_const_table,@object
	.size	static_const_table,48
	.data
	.section .note.GNU-stack, ""
# End
