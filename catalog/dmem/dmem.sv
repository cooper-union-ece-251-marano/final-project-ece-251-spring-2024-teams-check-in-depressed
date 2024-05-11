//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Tiffany Shum, Lani Wang
// 
//     Create Date: 2023-02-07
//     Module Name: dmem
//     Description: 16-bit RISC memory ("data" segment)
//
// Revision: 1.1
// 1.1: made 16 bit
//////////////////////////////////////////////////////////////////////////////////
`ifndef DMEM
`define DMEM

`timescale 1ns/100ps


module dmem(input logic         clk, write_enable,
            input logic  [15:0] addr, writedata,
            output logic [15:0] readdata);

    reg  [15:0] RAM[31:0];
    assign readdata = RAM[addr[15:2]]; // word aligned, ignores lower 2 bits of addr
    always @(posedge clk)
        if (write_enable)
            RAM[addr[15:2]] <= writedata;
endmodule



`endif // DMEM
