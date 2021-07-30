# PS2-Keyboard-Interface
This Vivado project allows the Nexys A7 board to interface with a USB keyboard via PS/2 interface and perform various tasks. In its current state, it interfaces with a VGA    controller to write characters on the connected VGA-compatible display.
## Block Diagram
![Block Diagram](https://i.imgur.com/H30AP3q.jpg)
This is the RTL diagram of the elaborated hardware.
### ps2_receiver
The Nexys A7 board has a peripheral PIC24 microcontroller at the USB-A port which abstracts the messy USB interface into old-school PS2. The ps2_receiver module decodes and sends the 11-bit PS2 package to the dedicated BRAM address decoder. The 11-bit package received is also displayed on the FPGAs LEDs, for visual confirmation and debugging.
### bram_decoder
The decoder interprets which letter was pressed and outputs the corresponding address from 0x00 to 0x19 for the BRAM.
### bram
The BRAM is operating in single-port ROM mode. It places the 1024-bit data vector corresponding to the input address on the output data bus. It is initialized with a coefficient file [merged.coe](https://github.com/Kyouma48596/PS2-Keyboard-Interface/blob/main/alphabet/merged.coe), which contains the 32x32 character map in 1023:0 vector form.
### clock_gen_480p
This module uses the FPGAs [PLL](https://en.wikipedia.org/wiki/Phase-locked_loop) (Phase Locked Loop) to generate a ~25MHz pixel clock to drive a 640x480 display at 60Hz.
### display_timings
This module uses simple counters and combinational logic to generate the display signals necessary to drive the VGA display.
### draw_module
The final output module, it receives the memory map from BRAM and internally decodes the [1023:0] data vector into a 32x32 character map, which controls when a pixel is drawn/left blank. It is also responsible for driving the FPGAs VGA output, with the driving signals received from the VGA signal generator (display_timings).
##Results
![N](https://github.com/Kyouma48596/PS2-Keyboard-Interface/blob/main/Results/N.jpg)
![E](https://github.com/Kyouma48596/PS2-Keyboard-Interface/blob/main/Results/E.jpg)
![X](https://github.com/Kyouma48596/PS2-Keyboard-Interface/blob/main/Results/X.jpg)
## Plans
In the future I may expand this to draw multiple characters at once, with carriage-return and backspace functionality, to make a very rudimentary "notepad".
