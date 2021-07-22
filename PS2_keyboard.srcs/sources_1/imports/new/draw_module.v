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
	input wire clk_pix,
	input wire rst,
	input wire [1023:0] mmap,
	input wire [9:0] sx,
	input wire [9:0] sy,
	input wire de,
	input wire hsync,
	input wire vsync,
	output reg vga_hs,
	output reg vga_vs,
	output reg [3:0] vga_r,
	output reg [3:0] vga_g,
	output reg [3:0] vga_b
    );
//make draw signals
wire q_draw;
assign q_draw = !(sx<=32 && sy<=32) ? 0 : mmap[32*(32-sy)-1-sx];
//drive display
always @(posedge clk_pix)
begin
	vga_hs <= hsync;
	vga_vs<= vsync;
	vga_r<=!de ? 0 : (q_draw ? 4'hF : 4'h0);
	vga_g<=!de ? 0 : (q_draw ? 4'h0 : 4'hF);
	vga_b<=!de ? 0 : (q_draw ? 4'h0 : 4'h0);
end
endmodule
