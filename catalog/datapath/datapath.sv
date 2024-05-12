//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: datapath
//     Description: 16-bit RISC-based CPU datapath (MIPS)
//
// Revision: 1.1
// 1.1 made 16 bit
//////////////////////////////////////////////////////////////////////////////////
`ifndef DATAPATH
`define DATAPATH
`timescale 1ns/100ps

`include "../regfile/regfile.sv"
`include "../alu/alu.sv"
`include "../dff/dff.sv"
`include "../adder/adder.sv"
`include "../sl1/sl1.sv"
`include "../mux2/mux2.sv"
`include "../signext/signext.sv"

module datapath
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic        clk, reset,
    input  logic        memtoreg, pcsrc,
    input  logic        alusrc, regdst,
    input  logic        regwrite, jump,
    input  logic [2:0]  alucontrol,
    output logic        zero,
    output logic [(n-1):0] pc,
    input  logic [(n-1):0] instr,
    output logic [(n-1):0] aluout, writedata,
    input  logic [(n-1):0] readdata
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    wire [4:0]  writereg;
    wire [(n-1):0] pcnext, pcnextbr, pcplus2, pcbranch;
    wire [(n-1):0] signimm, signimmsh;
    wire [(n-1):0] srca, srcb;
    wire [(n-1):0] result;

    // next PC logic
    dff #(n)    pcreg(clk, reset, pcnext, pc);
    adder       pcadd1(pc, 16'b100, pcplus2);
    sl1         immsh(signimm, signimmsh);
    adder       pcadd2(pcplus2, signimmsh, pcbranch);
    mux2 #(n)   pcbrmux(pcplus2, pcbranch, pcsrc, pcnextbr);
    mux2 #(n)   pcmux(pcnextbr, {pcplus2[15:14], instr[11:0], 2'b00}, jump, pcnext);

    // register file logic
    regfile     rf(clk, regwrite, instr[11:8], instr[7:4], writereg, result, srca, writedata);
    mux2 #(4)   wrmux(instr[7:4], instr[3:0], regdst, writereg);
    mux2 #(n)   resmux(aluout, readdata, memtoreg, result);
    signext     se(instr[7:0], signimm);

    // ALU logic
    mux2 #(n)  srcbmux(writedata, signimm, alusrc, srcb);
    alu         alu(srca, srcb, alucontrol, aluout, zero);

endmodule

`endif // DATAPATH