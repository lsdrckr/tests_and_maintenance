# Project test & maintenance of an embedded system

The small project consist in the design and manufacturing of a small embedded system including a microcontroler [ARM](https://www.arm.com/) of the range [STM32 from STMicroelectronics](https://www.st.com/en/microcontrollers-microprocessors/stm32-32-bit-arm-cortex-mcus.html), some auxiliary components, and teh embedded firmware.The emphasis will be on the meticulous design of both the hardware and the software to simplify pre-production testing and maintenance of the object during its lifetime.

Indeed, before large scale manufacturing, the design lab decide to realize a first prototype to fully debug the object.

The project will be carried out in four main phases:
1. Hardware design, including PCB and the documentation for a future production;
2. PCB testing, component assembly and basic hardware debugging;
3. Design of the embedded firmware, unsing good practices and CI;
4. Test of the embedded system (hardware + software), using a JTAG debugger.

## Hardware design

The hardware design consist in the design of the schematic, of the PCB and the generation all the documentation for a further mass-production, using KiCad.

The embedded system is made of :
* [a STM32F030F4 microcontroler](https://www.st.com/en/microcontrollers-microprocessors/stm32f030f4.html);
* [a M24C01 serial EEPROM memory](https://www.st.com/en/memories/m24c01-r.html) for configuration backup;
* [a MCP9700 temperature sensor](https://www.microchip.com/en-us/product/mcp9700) to get data.
* all other components for good operation (decoupling capacitors, leds, connectors, ...)

After the schematic design and entry (hierarchy should be used for better readability), you should add the testing points at critical signal levels. They will be used to test the PCB after its fabrication and after the component assembly. The extra layers in PCB design can be use to add information.

The documentation for the production will be added to the project, including schematic, PCB fabrication files and pick and place files.  

## Hardware fabrication and debug

The first prototype will be manufactured at Polytech Lille. The PCB production file should be sent to eei.polytech-lille.net. When received, the PCB will be inspected (optical inspection and rough electrical tests).

The assembly will be done step by step with documented tests at the end of each phase.


## Embedded software design

The embedded software will be design unsing the good practices seen before and is divided in diffeent steps, in between the next phase (ES development and design):
* the first step is to write the configuration part of the microprocessor. It consists in the definition of the vector table, initialization of the stack and the BSS segment;
* the second is to write a simple software to make a led blink for example;
* the final phase is to write specific code to manage the temperature sensor and the memory.

During this phase, do not forget to instrument your code to ease the debug.

## Embedded system development and design

This phase is closely linked to the previous one. You can not use CI/CD as seen before since there is an involved hardware part.

To be able to realize test close to unit test, you will use a [JTAG debugger](https://www.st.com/en/development-tools/st-link-v2.html) in conjunction with GDB (the GNU Debugger) and OpenOCD. These tools allow to execute the firmware and monitor the internal state of the microcontroler.
