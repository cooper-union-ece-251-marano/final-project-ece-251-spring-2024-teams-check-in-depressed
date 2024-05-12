//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: cpu
//     Description: 16-bit RISC-based CPU (MIPS)
//
// Revision: 1.1
// 1.1 made 16 bit
//////////////////////////////////////////////////////////////////////////////////
`ifndef CPU
`define CPU
`timescale 1ns/100ps
`include "../controller/controller.sv"
`include "../datapath/datapath.sv"

module cpu
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic           clk, reset,
    output logic [(n-1):0] pc,
    input  logic [(n-1):0] instr,
    output logic           memwrite,
    output logic [(n-1):0] aluout, writedata,
    input  logic [(n-1):0] readdata
);

  wire        memtoreg, branch, pcsrc, zero, alusrc, regdst, regwrite, jump;
  wire [2:0]  alucontrol;
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //

    // cpu internal components
    logic       memtoreg, alusrc, regdst, regwrite, jump, pcsrc, zero;
    logic [2:0] alucontrol;
    
  controller c(regwrite, regdst, branch, memwrite, memtoreg, jump, alusrc, aluop);
  datapath dp(clk, reset, memtoreg, pcsrc,
              alusrc, regdst, regwrite, jump,
              alucontrol,
              zero, pc, instr,
              aluout, writedata, readdata);

endmodule

`endif // CPU