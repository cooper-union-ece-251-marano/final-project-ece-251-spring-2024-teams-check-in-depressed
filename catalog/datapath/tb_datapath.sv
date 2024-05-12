//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Tiffany Shum and Lani Wang
// 
//     Create Date: 2024-05-11
//     Module Name: tb_datapath
//     Description: Test bench for datapath
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_DATAPATH
`define TB_DATAPATH
`timescale 1ns/100ps
`include "datapath.sv"

module tb_datapath;
    parameter n = 16;

    reg clk;
    reg reset;
    reg memtoreg;
    reg pcsrc;
    reg alusrc;
    reg regdst;
    reg regwrite;
    reg jump;
    reg [2:0] alucontrol;
    reg [15:0] instr;
    reg [15:0] readdata;

	wire zero;
    wire [15:0] pc;
    wire [15:0] aluout;
    wire [15:0] writedata;

    initial begin
        $dumpfile("datapath.vcd");
        $dumpvars(0,uut);
        $monitor("instr = %b, read = %b, controls = %b, aluop = %b, write = %b", instr, ReadData, controls, aluop, WriteData)
    end

    initial begin
    	rst <= 0;
	    instr <= 16'b0111001011110001;
	    aluop <= 3'b100;
	    controls <= 7'b0100100;
	    ReadData <= 0;
	    #30
	    instr <= 16'b1101000110000011;
	    aluop <= 3'b100;
	    controls <= 7'b0100100;
	    ReadData <= 33;
	    #30 
	    instr <= 16'b1001001111100000;
	    aluop <= 3'b100;
	    controls <= 7'b0100010;
	    ReadData <= 90;
	    #10
	    #20 
        $finish;
    end

    datapath uut(.clk(clk), .reset(rst), .regwrite(controls[7]), .regdst(controls[6]), .branch(controls[5]), .memwrite(controls[3]),
    .memtoreg(controls[2]), .jump(controls[]), .alusrc(controls[1]), .aluop(controls[0]), .zero(zero), .pc(pc), .instr(instr),
    .aluout(alu), .writedata(writedata), .readdata(readdata));

endmodule
`endif // TB_DATAPATH