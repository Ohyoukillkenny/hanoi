# hanoi
Hanoi written in assembly (intel x86 NASM)

#### Dependency

**Linux**, **GCC** tools, **make** tools

#### How to RUN the code

1. **cd** in the file
2. `make`
3. `./hanoi`

Use the `make clean` to clean the file.

#### File Structure

**hanoi.asm** contains main assembly code for solving the hanoi puzzle.

**asm_io.asm** and **asm_io.inc** contain global functions such as `print_int`, `read_int` and `print_string`, etc.

**driver.c** contains the c code to load hanoi.asm.

**cdecl.h** is a linker.

#### Reference

Carter P A. PC Assembly Language[M]. Lulu. com, 2007.