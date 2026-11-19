# Clang Flags Explained

-O0    Do not optimize

-g     Generate debug info
 
-pedantic
	   Warn on language extensions
 	   
-Wall
	   Enable most common warnings
	   
-Wextra
	   Enable uncommon warnings 
	   
--target=riscv32-unknown-elf
	   What machine to target
	   
	   - Architecture is RISC-V 32bit
	   - Vendor is unknown
	   - Format is ELF
	   
-fuse-ld=lld
	   Use lld linker

-ffreestanding[^1]
	   Indicate freestanding environment. 
	   Compiler assumes standard functions
	   may not have their original definition.

-fno-builtin[^2]
	   No handling or optimizations for
	   well known builtin functions.
	   
-nostdlib
       Don't use standard system startup
	   files or libs when linking. Manually
	   pass files and libs to linker, and 
	   options specifying linkage of system
	   libs are ignored.

-Wl     Pass arg to the linker

-o kernel.elf
	   Name the output file (kernel.elf)
## Linker

-Tkernel.ld
	   Read linker script from file (kernel.ld)
	   
-Map=kernel.map
	   Lists where each esction and symbol
	   was placed

[^1]: 
	`main()` stops being the entry point, and the entry point
	becomes the name specified in `ENTRY()`.
    
    Only freestanding headers become compatible.
    
	Implies `-fno-builtin`.

[^2]: 
	The compiler usually knows what `memset`, `strlen`, and `printf` mean, and
	optimizes:
	`strlen("hello")` becomes `5` with no call.
	`printf("hi\n")` becomes `puts("hi")`.
