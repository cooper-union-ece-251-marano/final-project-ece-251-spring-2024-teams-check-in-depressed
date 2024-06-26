//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Tiffany Shum & Lani Wang
// 
//     Create Date: 2024-05-08
//     Module Name: adder
//     Description: 16 bit, 2 input adder
//
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ADDER
`define ADDER
`timescale 1ns/100ps

module adder (
    input logic [15:0] i1, i2,
    output logic [15:0] o1
    );
    assign o1 = i1 + i2;

endmodule

`endif // ADDER