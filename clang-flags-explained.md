# Clang Flags Explained

| Compiler flags                   | Meaning                                                                                                                                                                                         |
| :------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| -O0                              | Do not optimize                                                                                                                                                                                 |
| -g                               | Generate debug info                                                                                                                                                                             |
| -pedantic                        | Warn on language extensions                                                                                                                                                                     |
| -Wall                            | Enable most common warnings                                                                                                                                                                     |
| -Wextra                          | Enable uncommon warnings                                                                                                                                                                        |
| <br>--target=riscv32-unknown-elf | What machine to target:<br>`riscv32` -> Architecture<br>`unknown` -> Vendor<br>`elf` -> Format                                                                                                  |
| -fuse-ld=lld                     | Use lld linker                                                                                                                                                                                  |
| -ffreestanding [^1]              | Indicate freestanding environment. Compiler assumes standard functions may not have their original definition.                                                                                  |
| -fno-builtin                     | No handling or optimizations for well known builtin functions.                                                                                                                                  |
| <br>-no-stdlib                   | Do not add usual startup files or standard libs automatically. Only the libraries you specify will be passed to the linker, and options specifying linkage of the system libraries are ignored. |
| -Wl                              | Pass argument to the linker                                                                                                                                                                     |
| -o kernel.elf                    | Name the output file (kernel.elf)                                                                                                                                                               |

| Linker flags    | Meaning                                        |
| --------------- | ---------------------------------------------- |
| -Tkernel.ld     | Read linker script from file                   |
| -Map=kernel.map | Lists where each section and symbol was placed |
[^1]: 
	`main()` stops being the entry point, and the entry point
	becomes the name specified in `ENTRY()`.
    
    Only freestanding headers become compatible.
    
	Implies `-fno-builtin`.

