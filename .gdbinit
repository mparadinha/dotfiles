# skip all .h files in of the c++ stdlib
skip -gfile /usr/include/c++/*
skip -gfile /usr/include/c++/bits/*
# skip everything with the std namespace
skip -rfu ^std::

# always the better ASM syntax flavour
set disassembly-flavor intel

# allow gdb to auto load .gdbinit in any directory
set auto-load safe-path /

define custom-dis
    break *0x11000
    run
    x/50i 0x11000
end

# custom TUI layout named "decent" with:
# source code on the left, assembly on the right and console at the bottom
tui new-layout decent { -horizontal src 1 asm 1 } 3 cmd 1
