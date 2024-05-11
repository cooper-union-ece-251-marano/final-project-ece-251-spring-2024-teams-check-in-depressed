//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Tiffany Shum & Lani Wang
// 
//     Create Date: 2023-02-07
//     Module Name: maindec
//     Description: 16-bit RISC-based CPU main decoder (MIPS)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef MAINDEC
`define MAINDEC

`timescale 1ns/100ps

// kinda redundantly, aludec finds alu op based on 4bit opcode. could have been done all here but i kept as is...

module maindec (
    input logic [3:0] op, // opcode
    output logic regWrite, branch, memWrite,
    output logic [1:0] regDst, memToReg, jump, aluSrc
    );

    logic [10:0] ctrl;
    assign {regWrite, regDst, branch, memWrite, memToReg, jump, aluSrc} = ctrl;

    always @*
        case(op)
            4'b0000:  ctrl <= 11'b10100000000; //add
            4'b0001:  ctrl <= 11'b10100000000; //sub
            4'b0010:  ctrl <= 11'b10100000000; //and
            4'b0011:  ctrl <= 11'b10100000000; //or
            4'b0100:  ctrl <= 11'b10100000010; //sll
            4'b0101:  ctrl <= 11'b10100000010; //srl
            4'b0110:  ctrl <= 11'b10100000000; //slt
            4'b0111:  ctrl <= 11'b00000001000; //jr
            4'b1000:  ctrl <= 11'b00100000000; //move
            4'b1001:  ctrl <= 11'b10000010001; //lw
            4'b1010:  ctrl <= 11'b00001000001; //sw
            4'b1011:  ctrl <= 11'b10000000001; //addi
            4'b1100:  ctrl <= 11'b10000000001; //subi
            4'b1101:  ctrl <= 11'b00010000000; //beq
            4'b1110:  ctrl <= 11'b00000000100; //j
            4'b1111:  ctrl <= 11'b11000100100; //jal

            default: ctrl <= 11'bx; // illegal
        endcase
endmodule


`endif // MAINDEC
