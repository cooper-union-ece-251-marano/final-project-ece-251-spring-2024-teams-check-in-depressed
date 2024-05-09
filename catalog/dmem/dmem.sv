//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
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

module dmem
// n=bit length of register; r=bit length of addr to limit memory and not crash your verilog emulator
    #(parameter n = 16, parameter r = 8)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic           clk, write_enable,
    input  logic [(n-1):0] addr, writedata,
    output logic [(n-1):0] readdata
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [(n-1):0] RAM[0:(2**r-1)];

    assign readdata = RAM[addr[(n-1):0]]; // word aligned (ignores lower 2 bits of address)

    always @(posedge clk) // write on posedge
        if (write_enable) RAM[addr[(n-1):0]] <= writedata;

endmodule

`endif // DMEM
