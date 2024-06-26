#------------------------------------------------------------------------------
#
# Copyright (c) 2013, ARM. All rights reserved.<BR>
#
# This program and the accompanying materials
# are licensed and made available under the terms and conditions of the BSD License
# which accompanies this distribution.  The full text of the license may be found at
# http://opensource.org/licenses/bsd-license.php
#
# THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
# WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
#
#------------------------------------------------------------------------------

#include "edk2asm.h"

.text
.align 2
GCC_ASM_EXPORT(__aeabi_llsr)

#
#VOID
#EFIAPI
#__aeabi_llsr (
# IN  VOID    *Destination,
# IN  VOID    *Source,
# IN  UINT32  Size
# );
#
ASM_PFX(__aeabi_llsr):
    subs     r3,r2,#0x20
    bpl      1f
    rsb      r3,r2,#0x20
    lsr      r0,r0,r2
    orr      r0,r0,r1,lsl r3
    lsr      r1,r1,r2
    bx       lr
1:
    lsr      r0,r1,r3
    mov      r1,#0
    bx       lr
	.section .note.GNU-stack,"a"
