//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Tiffany Shum & Lani Wang
// 
//     Create Date: 2024-05-08
//     Module Name: dff
//     Description: 16 bit D flip flop
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef DFF
`define DFF
`timescale 1ns/100ps

module dff (
    input  logic CLOCK, RESET,
    input  logic [15:0] D,
    output logic [15:0] Q
);

    always @(posedge CLOCK, posedge RESET) begin
        if (RESET)
            Q <= 0;
        else
            Q <= D;
    end
endmodule

`endif // DFF