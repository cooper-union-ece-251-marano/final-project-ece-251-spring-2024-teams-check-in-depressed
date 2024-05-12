//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: tiffany shum & Lani wang
// 
//     Create Date: 2024-05-08
//     Module Name: tb_controller
//     Description: Test bench for controller
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_CONTROLLER
`define TB_CONTROLLER

`timescale 1ns/100ps
`include "controller.sv"

module tb_controller;
    parameter n = 16;
    logic [7:0] CON_SIG;
    logic [3:0] OP;
    logic [2:0] ALU;
    logic ZERO;

    initial begin
        $dumpfile("controller.vcd");
	    $dumpvars(0, uut);
	    $monitor("controls = %b, op = %b, alu = %b, zero = %b", CON_SIG, OP, ALU, ZERO);
    end

    controller uut (.op(OP), .zero(ZERO), .alu(ALU));

endmodule
`endif // TB_CONTROLLER