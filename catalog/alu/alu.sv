//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Tiffany Shum & Lani Wang
// 
//     Create Date: 2024-05-08
//     Module Name: alu
//     Description: 16-bit RISC-based CPU alu (MIPS)
//
// Revision: 1.0
// see https://github.com/Caskman/MIPS-Processor-in-Verilog/blob/master/ALU32Bit.v
//////////////////////////////////////////////////////////////////////////////////
`ifndef ALU
`define ALU
`timescale 1ns/100ps

module alu(
    input logic [15:0] i1, i2,
    input logic [2:0] aluop,
    output logic [15:0] o1,
    output logic zero
    );
    assign zero = (o1==0);

    always @(i1 or o2 or aluop) begin
        case(aluop)
            3'b000: o1 <= i1 + i2; //ADD
            3'b001: o1 <= i1 - i2; //SUB
            3'b010: o1 <= i1 & i2; //AND
            3'b011: o1 <= i1 | i2; //OR
            3'b100: o1 <= i1 << i2; //SLL
            3'b101: o1 <= i1 >> i2; //SRL
            3'b110: begin //SLT
                if(i1[15] != i2[15])
                    o1 <= (i1[15] > i2[15]);
                else
                    o1 <= (i1 < i2);
                end
            3'b111: o1 <= ~(i1 | i2) //NOR
            default: o1 <= 0;
        endcase
    end
endmodule

`endif // ALU