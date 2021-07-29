//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Thu Jul 29 11:42:41 2021
//Host        : DESKTOP-P9KU36P running 64-bit major release  (build 9200)
//Command     : generate_target bram_wrapper.bd
//Design      : bram_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bram_wrapper
   (addra_0,
    clka_0,
    douta_0);
  input [9:0]addra_0;
  input clka_0;
  output [1023:0]douta_0;

  wire [9:0]addra_0;
  wire clka_0;
  wire [1023:0]douta_0;

  bram bram_i
       (.addra_0(addra_0),
        .clka_0(clka_0),
        .douta_0(douta_0));
endmodule
