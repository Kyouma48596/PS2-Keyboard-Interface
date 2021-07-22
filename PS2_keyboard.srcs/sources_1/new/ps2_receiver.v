`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2021 12:20:33 PM
// Design Name: 
// Module Name: ps2_receiver
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


module ps2_receiver(
    input wire ps2clk,
    input wire ps2data,
    input wire rst,
    output wire [15:0] LED
    );
//setup
assign LED[15:11] = 5'b00000;

//LED driver
reg [10:0] scan_code;

//shiftreg action
always @(negedge ps2clk or negedge rst)
begin
    if(!rst)
        scan_code<=0;
    else
        scan_code <= {ps2data, scan_code[10:1]};
end

//LED output
assign LED[10:0] = scan_code[10:0];


endmodule
