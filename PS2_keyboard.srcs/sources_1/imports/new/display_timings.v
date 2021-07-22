`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2021 05:08:09 PM
// Design Name: 
// Module Name: display_timings
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


module display_timings(
	input wire clk,
	input wire rst,
	output hsync,
	output vsync,
	output de,
	output reg [9:0] sx,
	output reg [9:0] sy
    );
//params
    parameter HA_END = 639;           // end of active pixels
    parameter HS_STA = HA_END + 16;   // sync starts after front porch
    parameter HS_END = HS_STA + 96;   // sync ends
    parameter LINE   = 799;           // last pixel on line (after back porch)

    // vertical timings
    parameter VA_END = 479;           // end of active pixels
    parameter VS_STA = VA_END + 10;   // sync starts after front porch
    parameter VS_END = VS_STA + 2;    // sync ends
    parameter SCREEN = 524;   

//make singals
 assign       hsync = ~(sx >= HS_STA && sx < HS_END);  // invert: negative polarity
 assign vsync = ~(sy >= VS_STA && sy < VS_END);  // invert: negative polarity
 assign de = (sx <= HA_END && sy <= VA_END);
 
    always @(posedge clk) begin
        if (sx == LINE) begin  // last pixel on line?
            sx <= 0;
            sy <= (sy == SCREEN) ? 0 : sy + 1;  // last line on screen?
        end else begin
            sx <= sx + 1;
        end
        if (rst) begin
            sx <= 0;
            sy <= 0;
        end
    end
endmodule
