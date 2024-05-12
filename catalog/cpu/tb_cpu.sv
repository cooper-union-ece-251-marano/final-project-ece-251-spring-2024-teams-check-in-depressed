//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Tiffany Shum & Lani Wang
// 
//     Create Date: 2024-05-11
//     Module Name: tb_cpu
//     Description: Test bench for cpu
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_CPU
`define TB_CPU

`timescale 1ns/100ps
`include "cpu.sv"

module tb_cpu;
    parameter n = 16;
    logic clk, rst;
    logic memwrite;
    logic [n-1:0] instr, readdata, pc, alu, writedata;

    initial begin
	$dumpfile("tb_cpu.vcd");
	$dumpvars(0, uut, uut1);
	$monitor("clk = %b, pc = %b, instr = %b, alu = %b, write = %b, read = %b, memwrite = %b", clk, pc, instr, alu, writedata, readdata, memwrite);
    end

    initial begin
    rst <= 0;
    en <= 1;
    instr <= 16'b0001000011110111;
    readdata <= 0;

    #30;
    instr <= 16'b1010101010101010;
    readdata <= 42;

    #40;
    instr <= 16'b1100110011001100;
    readdata <= 255;

    #50;
    instr <= 16'b0011001100110011;
    readdata <= 123;

    #10;
    #20 $finish;    
end

cpu uut(.clk(clk), .reset(rst), .pc(PC), .instr(instr), .memwrite(memwrite), .aluout(ALU), .writedata(writedata), .readdata(readdata));

clock #(30) uut1(.ENABLE(en), .CLOCK(clk));

endmodule
`endif // TB_CPU