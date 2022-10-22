`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/24 14:35:05
// Design Name: 
// Module Name: Datapath_more
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Datapath_more(
    input wire clk,
    input wire rst,
    input wire[31:0] inst_field,
    input wire[31:0] Data_in,
    input wire[3:0] ALU_Control,
    input wire[2:0] ImmSel,
    input wire[1:0] MemtoReg,
    input wire ALUSrc_B,
    input wire[1:0] Jump,
    input wire Branch,
    input wire BranchN,
    input wire RegWrite,
    output wire[31:0] PC_out,
    output wire[31:0] Data_out,
    output wire[31:0] ALU_out
    );
    
    wire[31:0] Imm_out_b_I1_I3;
    wire[31:0] o_wt_Data;
    wire[31:0] Rs1_data_A;
    wire[31:0] o_D;
    wire[31:0] o_B;
    wire zero;
    wire[31:0] c0;
    wire[31:0] c1;
    wire[31:0] o_IO_I3;
    ImmGen ig (
      .ImmSel(ImmSel),
      .inst_field(inst_field),
      .Imm_out(Imm_out_b_I1_I3));
    
    Regs reg1 (
      .clk(clk),      
      .rst(rst),        
      .RegWrite(RegWrite), 
      .Rs1_addr(inst_field[19:15]), 
      .Rs2_addr(inst_field[24:20]),
      .Wt_addr(inst_field[11:7]),
      .Wt_data(o_wt_Data),
      .Rs1_data(Rs1_data_A),
      .Rs2_data(Data_out)
      );
    
    REG32 reg2 (
      .clk(clk), 
      .rst(rst), 
      .CE(1'b1), 
      .D(o_D), 
      .Q(PC_out));
      
    ALU ALUm0 (
      .A(Rs1_data_A),   
      .B(o_B),  
      .ALU_operation(ALU_Control),
      .res(ALU_out),
      .zero(zero));
      
    add32 m0 (
      .a(32'b0000_0000_0000_0000_0000_0000_0000_0100), 
      .b(PC_out), 
      .c(c0));
    add32 m1 (
      .a(PC_out),
      .b(Imm_out_b_I1_I3),
      .c(c1));
    
    MUX2T1_32 mux20(
      .s(ALUSrc_B),
      .I0(Data_out),
      .I1(Imm_out_b_I1_I3),
      .o(o_B));
    MUX2T1_32 mux21(
      .s((Branch&zero)|(BranchN&~zero)),
      .I0(c0),
      .I1(c1),
      .o(o_IO_I3));
      
    MUX4T1_32 mux40(
      .s(MemtoReg),
      .I0(ALU_out),
      .I1(Data_in),
      .I2(c0),
      .I3(Imm_out_b_I1_I3),
      .o(o_wt_Data));
    MUX4T1_32 mux41(
      .s(Jump),
      .I0(o_IO_I3),
      .I1(c1),
      .I2(ALU_out),
      .I3(o_IO_I3),
      .o(o_D));
endmodule
