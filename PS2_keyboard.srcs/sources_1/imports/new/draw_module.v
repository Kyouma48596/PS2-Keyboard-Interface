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
	output reg VGA_HS,
	output reg VGA_VS,
	output reg [3:0] VGA_R,
	output reg [3:0] VGA_G,
	output reg [3:0] VGA_B
    );
//make cloc
wire clk_pix, clk_locked;
//clock_gen_480p clkk (
//	clk_100m,
//	!btn_rst,
//	clk_pix,
//	clk_locked
//);

//make signals
//wire hsync, vsync, de;
//wire [9:0] sx;
//wire [9:0] sy;
//display_timings dispp(
//	clk_pix,
//	!btn_rst,
//	hsync,
//	vsync,
//	de,
//	sx,
//	sy
//);

//draw squad
wire q_draw;
assign q_draw = (sx<32 && sy<32) ? 1 : 0;

//drive display
always @(posedge clk_pix)
begin
	VGA_HS <= hsync;
	VGA_VS<= vsync;
	VGA_R<=!de ? 0 : (q_draw ? 4'hF : 4'h0);
	VGA_G<=!de ? 0 : (q_draw ? 4'h0 : 4'hF);
	VGA_B<=!de ? 0 : (q_draw ? 4'h0 : 4'h0);
end
endmodule
