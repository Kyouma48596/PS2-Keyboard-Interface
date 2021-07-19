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
    input wire PS2_CLK,
    input wire PS2_DATA,
    input wire CPU_RESETN,
    output wire [15:0] LED
    );
//setup
assign LED[15:11] = 5'b00000;

//LED driver
reg [10:0] LED_drive;

//shiftreg action
always @(negedge PS2_CLK or negedge CPU_RESETN)
begin
    if(!CPU_RESETN)
        LED_drive<=0;
    else
        LED_drive <= {PS2_DATA, LED_drive[10:1]};
end

//LED output
assign LED[10:0] = LED_drive[10:0];


endmodule
