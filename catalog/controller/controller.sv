//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Tiffany Shum & Lani Wang
// 
//     Create Date: 2023-02-07
//     Module Name: controller
//     Description: 16-bit RISC-based CPU controller (MIPS)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef CONTROLLER
`define CONTROLLER

`timescale 1ns/100ps

`include "../maindec/maindec.sv"
`include "../aludec/aludec.sv"

module controller(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic [3:0] opcode,
    input  logic       zero,
    output logic       memtoreg, memwrite,
    output logic       pcsrc, alusrc,
    output logic       regdst, regwrite,
    output logic       jump
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic branch;
    
    // CPU main decoder
    maindec md(opcode, regwrite, regdst, branch, memwrite, memtoreg, jump, alusrc);
    // CPU's ALU decoder
    aludec ad(opcode);

  assign pcsrc = branch & zero;

endmodule

`endif // CONTROLLER
