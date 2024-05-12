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

`timescale 1ns/100ps

module tb_datapath;
    // Parameters
    parameter n = 16;

    // Inputs
    reg clk;
    reg reset;
    reg memtoreg;
    reg pcsrc;
    reg alusrc;
    reg regdst;
    reg regwrite;
    reg jump;
    reg [2:0] alucontrol;
    reg [n-1:0] instr;
    reg [n-1:0] readdata;

    // Outputs
    wire zero;
    wire [n-1:0] pc;
    wire [n-1:0] aluout;
    wire [n-1:0] writedata;

    // Instantiate datapath module
    datapath #(.n(n)) uut (
        .clk(clk),
        .reset(reset),
        .memtoreg(memtoreg),
        .pcsrc(pcsrc),
        .alusrc(alusrc),
        .regdst(regdst),
        .regwrite(regwrite),
        .jump(jump),
        .alucontrol(alucontrol),
        .zero(zero),
        .pc(pc),
        .instr(instr),
        .aluout(aluout),
        .writedata(writedata),
        .readdata(readdata)
    );

    // Clock generation
    always begin
        clk = 0;
        #5;  // Toggle the clock every 5 time units
        clk = 1;
        #5;
    end

    // Initialize inputs
    initial begin
        reset = 1;
        memtoreg = 0;
        pcsrc = 0;
        alusrc = 0;
        regdst = 0;
        regwrite = 0;
        jump = 0;
        alucontrol = 0;
        instr = 0;
        readdata = 0;

        #10;  // Wait for 10 time units
        reset = 0;

        // Provide stimulus
        instr = 16'b1100110000001111;  // Example instruction
        alucontrol = 3'b001;  // Example ALU control signal
        readdata = 16'hABCD;  // Example read data value

        #20;  // Wait for 20 time units

        $finish;  // End simulation
    end

    // Display signal values
    always @(posedge clk) begin
        $display("clk=%b, reset=%b, memtoreg=%b, pcsrc=%b, alusrc=%b, regdst=%b, regwrite=%b, jump=%b, alucontrol=%b, instr=%h, readdata=%h",
            clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump, alucontrol, instr, readdata);
    end

endmodule
`endif // TB_DATAPATH