//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Tiffany Shum & Lani Wang
// 
//     Create Date: 2024-05-08
//     Module Name: sl1
//     Description: shift left by 1
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef SL1
`define SL1

`timescale 1ns/100ps


module sl1(input  [15:0] a,
           output [15:0] y);

  // shift left by 1
    assign y = {a[13:0], 2'b00};
endmodule


`endif // SL1
