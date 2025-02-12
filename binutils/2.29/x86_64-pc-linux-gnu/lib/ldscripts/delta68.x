/* Default linker script, for normal executables */
/* Copyright (C) 2014-2017 Free Software Foundation, Inc.
   Copying and distribution of this script, with or without modification,
   are permitted in any medium without royalty provided the copyright
   notice and this notice are preserved.  */
OUTPUT_FORMAT("coff-m68k-sysv")
OUTPUT_ARCH(m68k)
ENTRY (_start)
SECTIONS
{
  .text  0x2000 + SIZEOF_HEADERS :
    {
       __.text.start = .;
      *(.text)
       etext  =  .;
       _etext  =  .;
       __.text.end = .;
       __CTOR_LIST__ = .;
       LONG((__CTOR_END__ - __CTOR_LIST__) / 4 - 2)
       *(.ctors)
       LONG(0)
       __CTOR_END__ = .;
       __DTOR_LIST__ = .;
       LONG((__DTOR_END__ - __DTOR_LIST__) / 4 - 2)
       *(.dtors)
       LONG(0)
       __DTOR_END__ = .;
    }
  .data  SIZEOF(.text) + ADDR(.text) + 0x400000 :
    {
       __.data.start = .;
      *(.data)
       edata  =  .;
       _edata  =  .;
       __.data.end = .;
    }
  .bss  SIZEOF(.data) + ADDR(.data) :
    {
       __.bss.start = .;
      *(.bss)
      *(COMMON)
       __.bss.end = .;
       end = ALIGN(0x8);
       _end = ALIGN(0x8);
    }
  .comment  0 :
    {
      *(.comment)
    }
}
