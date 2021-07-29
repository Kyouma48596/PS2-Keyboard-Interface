`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2021 07:48:04 AM
// Design Name: 
// Module Name: bram_decoder
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


module bram_decoder(
    input [10:0] addr_in,
    output reg [9:0] addr_out
    );
always @*
begin
	case (addr_in[8:1])
		8'h15: addr_out = 9'h00;//Q
		8'h1D: addr_out = 9'h01;//W
		8'h24: addr_out = 9'h02;//E
		8'h2D: addr_out = 9'h03;//R
		8'h2C: addr_out = 9'h04;//T
		8'h35: addr_out = 9'h05;//Y
		8'h3C: addr_out = 9'h06;//U
		8'h43: addr_out = 9'h07;//I
		8'h44: addr_out = 9'h08;//O
		8'h4D: addr_out = 9'h09;//P
		8'h1C:	addr_out = 9'h0A;//A
		8'h1B: addr_out = 9'h0B;//S
		8'h23: addr_out = 9'h0C;//D
		8'h2b:addr_out = 9'h0D;//F
		8'h34:addr_out = 9'h0E;//G
		8'h33:addr_out = 9'h0F;//H
		8'h3B:addr_out = 9'h10;//J
		8'h42:addr_out = 9'h11;//K
		8'h4B:addr_out = 9'h12;//L
		8'h1A:addr_out = 9'h13;//Z
		8'h22:addr_out = 9'h14;//X
		8'h21:addr_out = 9'h15;//C
		8'h2A:addr_out = 9'h16;//V
		8'h32:addr_out = 9'h17;//B
		8'h31:addr_out = 9'h18;//N
		8'h3A:addr_out = 9'h19;//M
		default: addr_out =9'hFF;
	endcase
end
endmodule
