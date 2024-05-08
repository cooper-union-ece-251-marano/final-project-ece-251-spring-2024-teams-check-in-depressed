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

module sl2
    #(parameter n = 16)(
    input  logic [(n-1):0] A,
    output logic [(n-1):0] Y
    );
    always @* begin
        Y <= A << 1;
    end

endmodule

`endif // SL1