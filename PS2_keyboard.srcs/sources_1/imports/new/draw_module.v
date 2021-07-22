`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2021 05:13:48 PM
// Design Name: 
// Module Name: draw_module
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


module draw_module(
	input wire clk_100m,
	input wire btn_rst,
	input wire PS2_CLK,
	input wire PS2_DATA,
	output reg VGA_HS,
	output reg VGA_VS,
	output reg [3:0] VGA_R,
	output reg [3:0] VGA_G,
	output reg [3:0] VGA_B
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
	!btn_rst,
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
        .clka_0(clk_100m),
        .dina_0(zer0),
        .douta_0(mmap),
        .wea_0(zer0));
//make draw signals

//drive display
//always @(posedge clk_pix)
//begin
//	VGA_HS <= hsync;
//	VGA_VS<= vsync;
//	VGA_R<=!de ? 0 : (q_draw ? 4'hF : 4'h0);
//	VGA_G<=!de ? 0 : (q_draw ? 4'h0 : 4'hF);
//	VGA_B<=!de ? 0 : (q_draw ? 4'h0 : 4'h0);
//end
endmodule
