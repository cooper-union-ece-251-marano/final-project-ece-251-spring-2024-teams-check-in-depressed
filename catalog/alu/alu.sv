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
'define ALU_ADD 3'b000
'define ALU_AND 3'b001
'define ALU_NOR 3'b010
'define ALU_OR  3'b011
'define ALU_SLL 3'b100
'define ALU_SLT 3'b101
'define ALU_SRL 3'b110
'define ALU_SUB 3'b111
`timescale 1ns/100ps

module alu(
    input logic [15:0] i1, i2,
    input logic [2:0] choice,
    output logic [15:0] o1,
    output logic depressed0
    );
    assign depressed0 = (o1==0);

    always @(i1 or o2 or choice) begin
        case(choice)
            3'b000: o1 <= i1 + i2; //ADD
            3'b001: o1 <= i1 & i2; //AND
            3'b010: o1 <= ~(i1 | i2); //NOR
            3'b011: o1 <= i1 | i2; //OR
            3'b100: o1 <= i1 << i2; //SLL
            3'b101: begin //SLT
                if(i1[15] != i2[15])
                    o1 <= (i1[15] > i2[15]);
                else
                    o1 <= (i1 < i2);
                end
            3'b110: o1 <= i1 >> i2; //SRL
            3'b111: o1 <= i1 - i2; //SUB
            default: o1 <= 0;
        endcase
    end        

endmodule

`endif // ALU
