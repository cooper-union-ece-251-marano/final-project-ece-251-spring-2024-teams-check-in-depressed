//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: computer
//     Description: 16-bit RISC
//
// Revision: 1.1
// 1.1 made 16 bit
//////////////////////////////////////////////////////////////////////////////////
`ifndef COMPUTER
`define COMPUTER
`timescale 1ns/100ps

`include "../cpu/cpu.sv"
`include "../imem/imem.sv"
`include "../dmem/dmem.sv"

module computer
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic           clk, reset, 
    output logic [(n-1):0] writedata, dataadr, 
    output logic           memwrite
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    wire [(n-1):0] pc, instr, readdata;

    // computer internal components

    // the RISC CPU
    mips mips(clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);
    // the instruction memory ("text segment") in main memory
    imem imem(pc[4:0], instr);
    // the data memory ("data segment") in main memory
    dmem dmem(clk, memwrite, dataadr, writedata, readdata);

endmodule

`endif // COMPUTER