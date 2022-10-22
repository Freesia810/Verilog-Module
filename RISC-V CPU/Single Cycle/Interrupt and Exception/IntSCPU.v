`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/25 14:32:57
// Design Name: 
// Module Name: IntSCPU
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


module IntSCPU(
    input wire clk,
    input wire rst,
    input wire MIO_ready,
    input wire[31:0] inst_in,
    input wire[31:0] Data_in,
    input wire INT0,
    output wire CPU_MIO,
    output wire MemRW,
    output wire[31:0] PC_out,
    output wire[31:0] Data_out,
    output wire[31:0] Addr_out
    );
    
    wire ALUSrc_B;
    wire[1:0] Jump;
    wire RegWrite;
    wire[3:0] ALU_Control;
    wire Branch;
    wire BranchN;
    wire[2:0] ImmSel;
    wire[1:0] MemtoReg;
    wire ecall;
    wire ill_stru;
    wire mret;
    
    SCPU_ctrl_int sc (
      .ALUSrc_B(ALUSrc_B),  
      .Branch(Branch), 
      .BranchN(BranchN),       
      .CPU_MIO(CPU_MIO),      
      .Fun7(inst_in[30]),          
      .Jump(Jump),            
      .MIO_ready(MIO_ready),   
      .MemRW(MemRW),            
      .RegWrite(RegWrite),
      .ALU_Control(ALU_Control),
      .Fun3(inst_in[14:12]), 
      .Fun_ecall(inst_in[22:20]),
      .Fun_mret(inst_in[29:28]),
      .ImmSel(ImmSel), 
      .MemtoReg(MemtoReg),
      .OPcode(inst_in[6:2]),
      .ecall(ecall),
      .mret(mret),
      .ill_stru(ill_stru));
      
    Datapath_Int dp (
      .ALUSrc_B(ALUSrc_B),
      .Jump(Jump),
      .RegWrite(RegWrite),
      .clk(clk),
      .rst(rst),
      .ALU_Control(ALU_Control),
      .ALU_out(Addr_out),
      .Branch(Branch),
      .BranchN(BranchN),
      .Data_in(Data_in),         
      .Data_out(Data_out),  
      .ImmSel(ImmSel),     
      .MemtoReg(MemtoReg),     
      .PC_out(PC_out),
      .INT0(INT0),
      .ecall(ecall),
      .mret(mret),
      .ill_stru(ill_stru),     
      .inst_field(inst_in)
      );
endmodule
