`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/24 20:15:18
// Design Name: 
// Module Name: ExtSCPU
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


module SCPU(
    input wire clk,
    input wire rst,
    input wire MIO_ready,
    input wire[31:0] inst_in,
    input wire[31:0] Data_in,
    output wire CPU_MIO,
    output wire MemRW,
    output wire[31:0] PC_out,
    output wire[31:0] Data_out,
    output wire[31:0] Addr_out
    );
    
    wire ALUSrc_B;
    wire Jump;
    wire RegWrite;
    wire[2:0] ALU_Control;
    wire Branch;
    wire[1:0] ImmSel;
    wire[1:0] MemtoReg;
    
    SCPU_ctrl sc (
      .ALUSrc_B(ALUSrc_B),  
      .Branch(Branch),      
      .CPU_MIO(CPU_MIO),      
      .Fun7(inst_in[30]),          
      .Jump(Jump),            
      .MIO_ready(MIO_ready),   
      .MemRW(MemRW),            
      .RegWrite(RegWrite),
      .ALU_Control(ALU_Control),
      .Fun3(inst_in[14:12]), 
      .ImmSel(ImmSel), 
      .MemtoReg(MemtoReg),
      .OPcode(inst_in[6:2]));
      
    Datapath dp (
      .ALUSrc_B(ALUSrc_B),
      .Jump(Jump),
      .RegWrite(RegWrite),
      .clk(clk),
      .rst(rst),
      .ALU_Control(ALU_Control),
      .ALU_out(Addr_out),
      .Branch(Branch),
      .Data_in(Data_in),         
      .Data_out(Data_out),  
      .ImmSel(ImmSel),     
      .MemtoReg(MemtoReg),     
      .PC_out(PC_out),     
      .inst_field(inst_in)
      );
endmodule
