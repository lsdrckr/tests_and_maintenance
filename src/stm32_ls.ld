/*    ENTRY
    MEMORY
    SECTIONS
    KEEP
    ALIGN
    AT>*/

ENTRY(Reset_Handler)

MEMORY
{
	FLASH(rx):ORIGIN =0x08000000,LENGTH =16K
	SRAM(rwx):ORIGIN =0x20000000,LENGTH =4K
}

SECTIONS
{   /* This section should include .text section of all input files */
    .text :
    {
        *(.isr_vector)
        *(.text)
        *(.rodata)
        . = ALIGN(4);
        _etext = .;
    }> FLASH AT> FLASH

    _la_data = LOADADDR(.data);
    /* This section should include .data section of all input files */
    .data :
    {
        _sdata = .;
        *(.data)
        . = ALIGN(4);
        _edata = .;
    }> SRAM AT> FLASH

    .bss :
    {
        _sbss = .;
        *(.bss)
        . = ALIGN(4);
        _ebss = .;
    }> SRAM
}
