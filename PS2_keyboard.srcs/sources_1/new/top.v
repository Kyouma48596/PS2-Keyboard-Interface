`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2021 02:20:04 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
	input wire clk_100m,
	input wire btn_rst,
	input wire PS2_CLK,
	input wire PS2_DATA,
	output wire VGA_HS,
	output wire VGA_VS,
	output wire [3:0] VGA_R,
	output wire [3:0] VGA_G,
	output wire [3:0] VGA_B,
	output wire [10:0] LED
    );
supply0 zero0;
//make cloc
wire clk_pix, clk_locked;
clock_gen_480p clkk (
	clk_100m,
	!btn_rst,
	clk_pix,
	clk_locked
);

//make signals
wire hsync, vsync, de;
wire [9:0] sx;
wire [9:0] sy;
display_timings dispp(
	clk_pix,
	!clk_locked,
	hsync,
	vsync,
	de,
	sx,
	sy
);

//code receiving and decoding:
//code receiver
wire [10:0] addr_in;
ps2_receiver receev(
	PS2_CLK,
	PS2_DATA,
	!btn_rst,
	addr_in
);
assign LED[10:0] = addr_in[10:0];
//drive decoder with addr_in
wire [14:0] bram_address;
bram_decoder deecod(
	addr_in,
	bram_address
);
//instantiate bram
wire [1023:0] mmap;
  bram bram_i
       (.addra_0(bram_address),
        .clka_0(clk_pix),
        .dina_0(zer0),
        .douta_0(mmap),
        .wea_0(zer0));

//instantiate drawer
wire vga_hs, vga_vs;
wire [3:0] vga_r;
wire [3:0] vga_g;
wire [3:0] vga_b;
draw_module draww(
	clk_pix,
	!btn_rst,
	mmap,
	sx,
	sy,
	de,
	hsync,
	vsync,
	vga_hs,
	vga_vs,
	vga_r,
	vga_g,
	vga_b
);
assign VGA_HS=vga_hs;
assign VGA_VS=vga_vs;
assign VGA_R[3:0]=vga_r[3:0];
assign VGA_G[3:0]=vga_g[3:0];
assign VGA_B[3:0]=vga_b[3:0];

endmodule
