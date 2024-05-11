//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Tiffany Shum & Lani Wang
// 
//     Create Date: 2024-05-08
//     Module Name: aludec
//     Description: 16-bit RISC ALU decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ALUDEC
`define ALUDEC

`timescale 1ns/100ps

// based on the four digit opcode we know what operation needs to be done. check to see if there's a time the 2nd ctrl signal is needed?
module aludec(input logic [3:0] opcode,
              output logic [2:0] aluop);

  always @(*)
      case(opcode)
          4'b0000: aluop <= 3'b000;  // add
          4'b0001: aluop <= 3'b001;  // sub
          4'b0010: aluop <= 3'b010;  // and
          4'b0011: aluop <= 3'b011;  // or
          4'b0100: aluop <= 3'b100;  // sll
          4'b0101: aluop <= 3'b101;  // srl
          4'b0110: aluop <= 3'b110;  // slt
          4'b0111: aluop <= 3'b000;  // jr --> uses add
          4'b1000: aluop <= 3'b000;  // move --> uses add
          4'b1001: aluop <= 3'b000;  // lw --> add
          4'b1010: aluop <= 3'b000;  // sw --> add
          4'b1011: aluop <= 3'b000;  // addi --> add
          4'b1100: aluop <= 3'b001;  // subi --> sub
          4'b1101: aluop <= 3'b001;  // beq --> sub
          4'b1110: aluop <= 3'b000;  // j --> add
          4'b1111: aluop <= 3'b000;  // jal --> add
    endcase
endmodule


`endif // ALUDEC
