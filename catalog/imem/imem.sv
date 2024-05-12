//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Tiifany Shum & Lani Wang
// 
//     Create Date: 2024-05-08
//     Module Name: imem
//     Description: 16-bit RISC memory (instruction "text" segment)
//
// Revision: 1.1
// 1.1 made 16 bit
//////////////////////////////////////////////////////////////////////////////////
`ifndef IMEM
`define IMEM
`timescale 1ns/100ps

module imem(input logic  [4:0] addr,    
            output logic [15:0] readdata);

    logic [15:0] RAM[31:0];
    initial begin
        $readmemh("instructions.dat",RAM);    // in hex format, so each should be 4 characters long for 16 bits
    end

    assign readdata = RAM[addr]; // word aligned
endmodule


`endif // IMEM
