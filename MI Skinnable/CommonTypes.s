	.file "CommonTypes.pas"
# Begin asmlist al_begin

.section .text
.globl	DEBUGSTART_COMMONTYPES
	.type	DEBUGSTART_COMMONTYPES,@object
DEBUGSTART_COMMONTYPES:
	.stabs "/home/matthieu/Bureau/Matthieu/Programmation/Lazarus Delphi/MI Skinnable/",100,0,0,.Lf1
	.stabs "CommonTypes.pas",100,0,0,.Lf1
.Lf1:
# End asmlist al_begin
# Begin asmlist al_stabs

.section .data
.globl	DEBUGINFO_COMMONTYPES
	.type	DEBUGINFO_COMMONTYPES,@object
DEBUGINFO_COMMONTYPES:
# Defs - Begin unit SYSTEM has index 1
# Defs - End unit SYSTEM has index 1
# Defs - Begin unit OBJPAS has index 6
# Defs - End unit OBJPAS has index 6
# Defs - Begin unit UNIXTYPE has index 29
# Defs - End unit UNIXTYPE has index 29
# Defs - Begin unit BASEUNIX has index 30
# Defs - End unit BASEUNIX has index 30
# Defs - Begin unit UNIXUTIL has index 31
# Defs - End unit UNIXUTIL has index 31
# Defs - Begin unit SYSCALL has index 32
# Defs - End unit SYSCALL has index 32
# Defs - Begin unit UNIX has index 26
# Defs - End unit UNIX has index 26
# Defs - Begin unit ERRORS has index 27
# Defs - End unit ERRORS has index 27
# Defs - Begin unit SYSCONST has index 28
# Defs - End unit SYSCONST has index 28
# Defs - Begin unit SYSUTILS has index 10
# Defs - End unit SYSUTILS has index 10
# Defs - Begin unit TYPES has index 23
# Defs - End unit TYPES has index 23
# Defs - Begin unit RTLCONSTS has index 25
# Defs - End unit RTLCONSTS has index 25
# Defs - Begin unit TYPINFO has index 24
# Defs - End unit TYPINFO has index 24
# Defs - Begin unit CLASSES has index 7
# Defs - End unit CLASSES has index 7
# Defs - Begin unit LCLTYPE has index 38
# Defs - End unit LCLTYPE has index 38
# Defs - Begin unit COMMONTYPES has index 279
	.stabs "SMALLINT:t3=r3;-32768;32767;",128,0,0,0
	.stabs "LONGWORD:t4=r4;0;-1;",128,0,0,0
	.stabs ":t1=ar3;0;2048;4",128,0,0,0
	.stabs "LONGINT:t5=r5;-2147483648;2147483647;",128,0,0,0
	.stabs "SINGLE:t6=r5;4;0;",128,0,0,0
	.stabs ":t2=ar3;0;512;6",128,0,0,0
# Defs - End unit COMMONTYPES has index 279
# Defs - Begin Staticsymtable
# Defs - End Staticsymtable
# Syms - Begin unit COMMONTYPES has index 279
	.stabs "TWAVEDATA:t1",128,0,17,0
	.stabs "TFFTDATA:t2",128,0,18,0
# Syms - End unit COMMONTYPES has index 279
# Syms - Begin Staticsymtable
# Syms - End Staticsymtable
# End asmlist al_stabs
# Begin asmlist al_procedures
# End asmlist al_procedures
# Begin asmlist al_globals

.section .data
	.balign 4
.globl	THREADVARLIST_COMMONTYPES
	.type	THREADVARLIST_COMMONTYPES,@object
THREADVARLIST_COMMONTYPES:
	.long	0
.Le0:
	.size	THREADVARLIST_COMMONTYPES, .Le0 - THREADVARLIST_COMMONTYPES
# End asmlist al_globals
# Begin asmlist al_const
# End asmlist al_const
# Begin asmlist al_typedconsts
# End asmlist al_typedconsts
# Begin asmlist al_rotypedconsts
# End asmlist al_rotypedconsts
# Begin asmlist al_threadvars
# End asmlist al_threadvars
# Begin asmlist al_imports
# End asmlist al_imports
# Begin asmlist al_exports
# End asmlist al_exports
# Begin asmlist al_resources
# End asmlist al_resources
# Begin asmlist al_rtti

.section .data
	.balign 4
.globl	INIT_COMMONTYPES_TWAVEDATA
	.type	INIT_COMMONTYPES_TWAVEDATA,@object
INIT_COMMONTYPES_TWAVEDATA:
	.byte	12
	.ascii	"\011TWaveData"
	.long	4,2049
	.long	INIT_SYSTEM_LONGWORD
	.long	19
.Le1:
	.size	INIT_COMMONTYPES_TWAVEDATA, .Le1 - INIT_COMMONTYPES_TWAVEDATA

.section .data
	.balign 4
.globl	RTTI_COMMONTYPES_TWAVEDATA
	.type	RTTI_COMMONTYPES_TWAVEDATA,@object
RTTI_COMMONTYPES_TWAVEDATA:
	.byte	12
	.ascii	"\011TWaveData"
	.long	4,2049
	.long	RTTI_SYSTEM_LONGWORD
	.long	19
.Le2:
	.size	RTTI_COMMONTYPES_TWAVEDATA, .Le2 - RTTI_COMMONTYPES_TWAVEDATA

.section .data
	.balign 4
.globl	INIT_COMMONTYPES_TFFTDATA
	.type	INIT_COMMONTYPES_TFFTDATA,@object
INIT_COMMONTYPES_TFFTDATA:
	.byte	12
	.ascii	"\010TFFTData"
	.long	4,513
	.long	INIT_SYSTEM_SINGLE
	.long	4
.Le3:
	.size	INIT_COMMONTYPES_TFFTDATA, .Le3 - INIT_COMMONTYPES_TFFTDATA

.section .data
	.balign 4
.globl	RTTI_COMMONTYPES_TFFTDATA
	.type	RTTI_COMMONTYPES_TFFTDATA,@object
RTTI_COMMONTYPES_TFFTDATA:
	.byte	12
	.ascii	"\010TFFTData"
	.long	4,513
	.long	RTTI_SYSTEM_SINGLE
	.long	4
.Le4:
	.size	RTTI_COMMONTYPES_TFFTDATA, .Le4 - RTTI_COMMONTYPES_TFFTDATA
# End asmlist al_rtti
# Begin asmlist al_dwarf_frame

.section .debug_frame
	.long	.Lc3-.Lc2
.Lc2:
	.long	-1
	.byte	1
	.byte	0
	.uleb128	1
	.sleb128	-4
	.byte	8
	.byte	12
	.uleb128	4
	.uleb128	4
	.byte	5
	.uleb128	8
	.uleb128	1
	.balign 4,0
.Lc3:
# End asmlist al_dwarf_frame
# Begin asmlist al_dwarf_info
# End asmlist al_dwarf_info
# Begin asmlist al_dwarf_abbrev
# End asmlist al_dwarf_abbrev
# Begin asmlist al_dwarf_line
# End asmlist al_dwarf_line
# Begin asmlist al_picdata
# End asmlist al_picdata
# Begin asmlist al_resourcestrings
# End asmlist al_resourcestrings
# Begin asmlist al_end

.section .text
.globl	DEBUGEND_COMMONTYPES
	.type	DEBUGEND_COMMONTYPES,@object
DEBUGEND_COMMONTYPES:
	.stabs "",100,0,0,.Lf2
.Lf2:
# End asmlist al_end
.section .note.GNU-stack,"",%progbits

