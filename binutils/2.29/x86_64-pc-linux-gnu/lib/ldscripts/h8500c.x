/* Default linker script, for normal executables */
/* Copyright (C) 2014-2017 Free Software Foundation, Inc.
   Copying and distribution of this script, with or without modification,
   are permitted in any medium without royalty provided the copyright
   notice and this notice are preserved.  */
OUTPUT_FORMAT("coff-h8500")
OUTPUT_ARCH(h8500)
/* Compact model - code < 64k, data > 64k */
SECTIONS
{
.text 0x10000 :
	{
	  *(.text)
	  *(.strings)
	   _etext = . ;
	}  > ram
.data 0x20000 :
	{
	  *(.data)
	   _edata = . ;
	}  > ram
.rdata 0x30000  :
	{
	  *(.rdata);

    ___ctors = . ;
    *(.ctors)
    ___ctors_end = . ;
    ___dtors = . ;
    *(.dtors)
    ___dtors_end = . ;
	}   > ram
.bss  0x40000 :
	{
	   __start_bss = . ;
	  *(.bss)
	  *(COMMON)
	   _end = . ;
	}  >ram
.stack 0x5fff0 :
	{
	   _stack = . ;
	  *(.stack)
	}  > topram
.stab  0 (NOLOAD) :
	{
	  [ .stab ]
	}
.stabstr  0 (NOLOAD) :
	{
	  [ .stabstr ]
	}
}
