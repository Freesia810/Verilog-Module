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


module ExtSCPU(
    input wire clk,
    input wire rst,
    input wire MIO_ready,
    input wire[31:0] inst_in,
    input wire[31:0] Data_in,
    output wire CPU_MIO,
    output wire MemRW,
    output wire[31:0] PC_out,
    output wire[31:0] Data_out,
    output wire[31:0] Addr_out,
        output wire[31:0] x1,
    output wire[31:0] x2,
    output wire[31:0] x3,
    output wire[31:0] x4,
    output wire[31:0] x5,
    output wire[31:0] x6,
    output wire[31:0] x7,
    output wire[31:0] x8,
    output wire[31:0] x9,
    output wire[31:0] x10,
    output wire[31:0] x11,
    output wire[31:0] x12,
    output wire[31:0] x13,
    output wire[31:0] x14,
    output wire[31:0] x15,
    output wire[31:0] x16,
    output wire[31:0] x17,
    output wire[31:0] x18,
    output wire[31:0] x19,
    output wire[31:0] x20,
    output wire[31:0] x21,
    output wire[31:0] x22,
    output wire[31:0] x23,
    output wire[31:0] x24,
    output wire[31:0] x25,
    output wire[31:0] x26,
    output wire[31:0] x27,
    output wire[31:0] x28,
    output wire[31:0] x29,
    output wire[31:0] x30,
    output wire[31:0] x31
    );
    
    wire ALUSrc_B;
    wire[1:0] Jump;
    wire RegWrite;
    wire[3:0] ALU_Control;
    wire Branch;
    wire BranchN;
    wire[2:0] ImmSel;
    wire[1:0] MemtoReg;
    
    SCPU_ctrl_more sc (
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
      .ImmSel(ImmSel), 
      .MemtoReg(MemtoReg),
      .OPcode(inst_in[6:2]));
      
    Datapath_more dp (
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
      .inst_field(inst_in),
            .x1(x1),
      .x2(x2),
      .x3(x3),
      .x4(x4),
      .x5(x5),
      .x6(x6),
      .x7(x7),
      .x8(x8),
      .x9(x9),
      .x10(x10),
      .x11(x11),
      .x12(x12),
      .x13(x13),
      .x14(x14),
      .x15(x15),
      .x16(x16),
      .x17(x17),
      .x18(x18),
      .x19(x19),
      .x20(x20),
      .x21(x21),
      .x22(x22),
      .x23(x23),
      .x24(x24),
      .x25(x25),
      .x26(x26),
      .x27(x27),
      .x28(x28),
      .x29(x29),
      .x30(x30),
      .x31(x31)
      );
endmodule
