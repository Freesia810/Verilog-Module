`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/23 21:41:25
// Design Name: 
// Module Name: Datapath
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


module DataPath(
    input wire clk,
    input wire rst,
    input wire[31:0] inst_field,
    input wire[31:0] Data_in,
    input wire[2:0] ALU_Control,
    input wire[1:0] ImmSel,
    input wire[1:0] MemtoReg,
    input wire ALUSrc_B,
    input wire Jump,
    input wire Branch,
    input wire RegWrite,
    output wire[31:0] PC_out,
    output wire[31:0] Data_out,
    output wire[31:0] ALU_out
    );
    
    wire[31:0] Imm_out_b_I1;
    wire[31:0] o_wt_Data;
    wire[31:0] Rs1_data_A;
    wire[31:0] o_D;
    wire[31:0] o_B;
    wire zero;
    wire[31:0] c0;
    wire[31:0] c1;
    wire[31:0] o_IO;
    ImmGen ig (
      .ImmSel(ImmSel),
      .inst_field(inst_field),
      .Imm_out(Imm_out_b_I1));
    
    Regs reg1 (
      .clk(clk),      
      .rst(rst),        
      .RegWrite(RegWrite), 
      .Rs1_addr(inst_field[19:15]), 
      .Rs2_addr(inst_field[24:20]),
      .Wt_addr(inst_field[11:7]),
      .Wt_data(o_wt_Data),
      .Rs1_data(Rs1_data_A),
      .Rs2_data(Data_out));
    
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
      .a(PC_out), 
      .b(32'b0000_0000_0000_0000_0000_0000_0000_0100), 
      .c(c0));
    add32 m1 (
      .a(PC_out),
      .b(Imm_out_b_I1),
      .c(c1));
    
    MUX2T1_32 m20 (
      .s(ALUSrc_B), 
      .I0(Data_out), 
      .I1(Imm_out_b_I1),
      .o(o_B));
    MUX2T1_32 m21 (
      .s(Branch&zero),  
      .I0(c0),
      .I1(c1), 
      .o(o_IO));
    MUX2T1_32 m22 (
      .s(Jump),  
      .I0(o_IO), 
      .I1(c1),  
      .o(o_D));
    
    MUX4T1_32 m40 (
      .s(MemtoReg),
      .I0(ALU_out),
      .I1(Data_in), 
      .I2(c0), 
      .I3(c0),
      .o(o_wt_Data)
      );
endmodule
