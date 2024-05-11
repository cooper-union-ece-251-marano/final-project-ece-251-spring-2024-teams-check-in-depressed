//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Tiffany Sum & Lani Wang
// 
//     Create Date: 2023-02-07
//     Module Name: signext
//     Description: sign extender
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef SIGNEXT
`define SIGNEXT
`timescale 1ns/100ps

// input is 4 bits, it takes the signed bit and extends all the way over for 16 bit output

module signext(input logic  [3:0] a,
               output logic [15:0] aext);
              
    assign aext = {{12{a[3]}}, a};
endmodule


`endif // SIGNEXT
