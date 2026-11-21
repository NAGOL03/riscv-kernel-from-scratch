ENTRY(_start)

MEMORY {
	ram (rwx) : ORIGIN = 0x80200000, LENGTH = 126M
}

SECTIONS {
	
	.text : {
		*(.text*);
	} > ram

	.rodata : ALIGN(4) {
		*(.rodata*);	
	} > ram

	.data : ALIGN(4) {
		*(data*);
	} > ram

	.bss : ALIGN(4) {
		__bss = .;
		*(.bss*);
		__bss_end = .;
	}

	. = ALIGN(4);
	. += 128K;
	__stack_top = .;
}



