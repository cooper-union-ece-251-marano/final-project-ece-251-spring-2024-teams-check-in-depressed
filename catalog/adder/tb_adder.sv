//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Tiffany Shum & Lani Wang
// 
//     Create Date: 2024-05-08
//     Module Name: tb_adder
//     Description: Test bench for 16 bit, 2 input adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ADDER
`define TB_ADDER

`timescale 1ns/100ps
`include "adder.sv"

module tb_adder;
    parameter n = 16;
    logic [(n-1):0] i1, i2, o1;

   initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, uut);
        $monitor("i1 = 0x%0h i2 = 0x%0h o1 = 0x%0h", i1, i2, o1);
    end

    initial begin
        i1 <= 16'b0000000000000000;
      	#10 i1 <= 16'b000000000100000;
        #10 i2 <= 16'b0000000000000010;
        #10 i1 <= 16'b0000000000000000;
        #10 i2 <= 16'b0000000000000001;
        #10 i1 <= 16'b0000000000000000;
        #10 i2 <= 16'b0000000000000000;

    end

    adder uut(
        .i1(i1), .i2(i2), .o1(o1)
    );
    
endmodule
`endif // TB_ADDER