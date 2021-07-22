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
    output reg [14:0] addr_out
    );
always @*
begin
	case (addr_in[8:1])
		8'h15: addr_out = 15'h00;//Q
		8'h1D: addr_out = 15'h01;//W
		8'h24: addr_out = 15'h02;//E
		8'h2D: addr_out = 15'h02;//R
		8'h2C: addr_out = 15'h03;//T
		8'h35: addr_out = 15'h04;//Y
		8'h3C: addr_out = 15'h05;//U
		8'h43: addr_out = 15'h06;//I
		8'h44: addr_out = 15'h07;//O
		8'h4D: addr_out = 15'h08;//P
		8'h1C:	addr_out = 15'h09;//A
		8'h1B: addr_out = 15'h0A;//S
		8'h23: addr_out = 15'h0B;//D
		8'h2b:addr_out = 15'h0C;//F
		8'h34:addr_out = 15'h0D;//G
		8'h33:addr_out = 15'h0E;//H
		8'h3B:addr_out = 15'h0F;//J
		8'h42:addr_out = 15'h10;//K
		8'h4B:addr_out = 15'h11;//L
		8'h1A:addr_out = 15'h12;//Z
		8'h22:addr_out = 15'h13;//X
		8'h21:addr_out = 15'h14;//C
		8'h2A:addr_out = 15'h15;//V
		8'h32:addr_out = 15'h16;//B
		8'h31:addr_out = 15'h17;//N
		8'h3A:addr_out = 15'h18;//M
		default: addr_out =15'hFF;
	endcase
end
endmodule
