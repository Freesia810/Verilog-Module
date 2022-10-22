`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/01 22:59:13
// Design Name: 
// Module Name: Pipeline_CPU_stall
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


module Pipeline_CPU_stall(
    input clk,
    input rst,
    input[31:0] Data_in,
    input[31:0] inst_IF,
    output[31:0] PC_out_IF,
    output[31:0] PC_out_ID,
    output[31:0] inst_ID,
    output[31:0] PC_out_Ex,
    output MemRW_Ex,
    output MemRW_Mem,
    output[31:0] Addr_out,
    output[31:0] Data_out,
    output[31:0] Data_out_WB
    );
    
    wire en_IF;
    wire en_IFID;
    wire NOP_IFID;
    wire NOP_IDEX;
    wire valid_IFID_in_IDEX;
    wire valid_out_IDEX_in_EXMem;
    wire[31:0] PC_in_IF_imm_out_EXMem;
    wire PCSrc;
    wire RegWrite_in_ID_out_MemWB;
    wire[4:0] Rd_addr_ID_out_MemWB;
    wire[4:0] Rd_addr_out_ID_IDEX;
    wire[31:0] Rs1_out_ID_in_IDEx;
    wire[31:0] Rs2_out_ID_in_IDEx;
    wire[31:0] Imm_out_ID_in_IDEx;
    wire ALUSrc_B_ID_in_IDEx;
    wire Branch_ID_in_IDEx;
    wire BranchN_ID_in_IDEx;
    wire MemRW_ID_in_IDEx;
    wire Jump_ID_in_IDEx;
    wire[2:0] ALU_control_ID_in_IDEx;
    wire[1:0] MemtoReg_ID_in_IDEx;
    wire RegWrite_out_ID_in_IDEx;
    wire Rs1_used;
    wire Rs2_used;
    wire[31:0] PC_out_IDEX_in_EX_in_EXMem;
    wire[31:0] Inst_out_IDEX_in_EXMem;
    wire[4:0] Rd_addr_out_IDEX_EXMem;
    wire[31:0] Rs1_out_IDEX_in_EX;
    wire[31:0] Rs2_out_IDEX_in_EX;
    wire[31:0] Imm_out_IDEX_in_EX;
    wire ALUSrc_B_out_IDEX_in_EX;
    wire[2:0] ALU_control_out_IDEX_in_EX;
    wire Branch_out_IDEX_in_EXMem;
    wire BranchN_out_IDEX_in_EXMem;
    wire Jump_out_IDEX_in_EXMem;
    wire[1:0] MemtoReg_out_IDEX_in_EXMem;
    wire RegWrite_out_IDEX_in_EXMem;
    wire[31:0] PC4_out_EX_in_EXMem;
    wire zero_out_EX_in_EXMem;
    wire[31:0] ALU_out_EX_in_EXMem;
    wire[31:0] Rs2_out_EX_in_EXMem;
    wire[31:0] PC_out_EXMem_in_MemWB;
    wire[31:0] PC4_out_EXMem_in_MemWB;
    wire valid_out_EXMem_in_MemWB;
    wire[31:0] Inst_out_EXMem_in_MemWB;
    wire[4:0] Rd_addr_out_EXMem_MemWB;
    wire zero_out_EXMem_in_Mem;
    wire Branch_out_EXMem_in_Mem;
    wire BranchN_out_EXMem_in_Mem;
    wire Jump_out_EXMem_in_Mem;
    wire[1:0] MemtoReg_out_EXMem_in_MemWB;
    wire RegWrite_out_EXMem_in_MemWB;
    wire[31:0] PC4_out_MemWB_in_WB;
    wire[31:0] ALU_out_MemWB_in_WB;
    wire[31:0] DMem_data_out_MemWB_WB;
    wire[1:0] MemtoReg_out_MemWB_in_WB;
    wire[4:0] Rs1_addr_ID;
    wire[4:0] Rs2_addr_ID;
    
    Pipeline_IF U1 (
      .PCSrc(PCSrc),
      .clk_IF(clk),
      .en_IF(en_IF),
      .rst_IF(rst),
      .PC_in_IF(PC_in_IF_imm_out_EXMem),
      .PC_out_IF(PC_out_IF)
    );
    
    IF_reg_ID_stall U2 (
      .clk_IFID(clk),
      .en_IFID(en_IFID),
      .rst_IFID(rst),
      .PC_in_IFID(PC_out_IF),
      .PC_out_IFID(PC_out_ID),
      .inst_in_IFID(inst_IF),
      .inst_out_IFID(inst_ID),
      .NOP_IFID(NOP_IFID),
      .valid_IFID(valid_IFID_in_IDEX)
    );
    
    
    Pipeline_ID_stall U3 (
      .ALUSrc_B_ID(ALUSrc_B_ID_in_IDEx),
      .BranchN_ID(BranchN_ID_in_IDEx),
      .Branch_ID(Branch_ID_in_IDEx),
      .Jump_ID(Jump_ID_in_IDEx),
      .MemRW_ID(MemRW_ID_in_IDEx),
      .RegWrite_in_ID(RegWrite_in_ID_out_MemWB),
      .RegWrite_out_ID(RegWrite_out_ID_in_IDEx),
      .clk_ID(clk),
      .rst_ID(rst),
      .ALU_control_ID(ALU_control_ID_in_IDEx),
      .Imm_out_ID(Imm_out_ID_in_IDEx),
      .Inst_in_ID(inst_ID),
      .MemtoReg_ID(MemtoReg_ID_in_IDEx),
      .Rd_addr_ID(Rd_addr_ID_out_MemWB),
      .Rd_addr_out_ID(Rd_addr_out_ID_IDEX),
      .Rs1_out_ID(Rs1_out_ID_in_IDEx),
      .Rs2_out_ID(Rs2_out_ID_in_IDEx),
      .Wt_data_ID(Data_out_WB),
      .Rs1_addr_ID(Rs1_addr_ID),
      .Rs2_addr_ID(Rs2_addr_ID),
      .Rs1_used(Rs1_used),
      .Rs2_used(Rs2_used)
    );
    
    ID_reg_Ex_stall U4 (
      .ALUSrc_B_in_IDEX(ALUSrc_B_ID_in_IDEx),
      .ALUSrc_B_out_IDEX(ALUSrc_B_out_IDEX_in_EX),
      .BranchN_in_IDEX(BranchN_ID_in_IDEx),
      .BranchN_out_IDEX(BranchN_out_IDEX_in_EXMem),
      .Branch_in_IDEX(Branch_ID_in_IDEx),
      .Branch_out_IDEX(Branch_out_IDEX_in_EXMem),
      .Jump_in_IDEX(Jump_ID_in_IDEx),
      .Jump_out_IDEX(Jump_out_IDEX_in_EXMem),
      .MemRW_in_IDEX(MemRW_ID_in_IDEx),
      .MemRW_out_IDEX(MemRW_Ex),
      .RegWrite_in_IDEX(RegWrite_out_ID_in_IDEx),
      .RegWrite_out_IDEX(RegWrite_out_IDEX_in_EXMem),
      .clk_IDEX(clk),
      .en_IDEX(1'b1),
      .rst_IDEX(rst),
      .NOP_IDEX(NOP_IDEX),
      .valid_in_IDEX(valid_IFID_in_IDEX),
      .ALU_control_in_IDEX(ALU_control_ID_in_IDEx),
      .ALU_control_out_IDEX(ALU_control_out_IDEX_in_EX),
      .Imm_in_IDEX(Imm_out_ID_in_IDEx),
      .Imm_out_IDEX(Imm_out_IDEX_in_EX),
      .MemtoReg_in_IDEX(MemtoReg_ID_in_IDEx),
      .MemtoReg_out_IDEX(MemtoReg_out_IDEX_in_EXMem),
      .PC_in_IDEX(PC_out_ID),
      .PC_out_IDEX(PC_out_IDEX_in_EX_in_EXMem),
      .Inst_IDEX(inst_ID),
      .Inst_out_IDEX(Inst_out_IDEX_in_EXMem),
      .Rd_addr_IDEX(Rd_addr_out_ID_IDEX),
      .Rd_addr_out_IDEX(Rd_addr_out_IDEX_EXMem),
      .Rs1_in_IDEX(Rs1_out_ID_in_IDEx),
      .Rs1_out_IDEX(Rs1_out_IDEX_in_EX),
      .Rs2_in_IDEX(Rs2_out_ID_in_IDEx),
      .Rs2_out_IDEX(Rs2_out_IDEX_in_EX),
      .valid_out_IDEX(valid_out_IDEX_in_EXMem)
    );
    
    Pipeline_Ex U5 (
      .ALUSrc_B_in_EX(ALUSrc_B_out_IDEX_in_EX),
      .zero_out_EX(zero_out_EX_in_EXMem),
      .ALU_control_in_EX(ALU_control_out_IDEX_in_EX),
      .ALU_out_EX(ALU_out_EX_in_EXMem),
      .Imm_in_EX(Imm_out_IDEX_in_EX),
      .PC4_out_EX(PC4_out_EX_in_EXMem),
      .PC_in_EX(PC_out_IDEX_in_EX_in_EXMem),
      .PC_out_EX(PC_out_Ex),
      .Rs1_in_EX(Rs1_out_IDEX_in_EX),
      .Rs2_in_EX(Rs2_out_IDEX_in_EX),
      .Rs2_out_EX(Rs2_out_EX_in_EXMem)
    );
    
    Ex_reg_Mem_stall U6 (
      .BranchN_in_EXMem(BranchN_out_IDEX_in_EXMem),
      .BranchN_out_EXMem(BranchN_out_EXMem_in_Mem),
      .Branch_in_EXMem(Branch_out_IDEX_in_EXMem),
      .Branch_out_EXMem(Branch_out_EXMem_in_Mem),
      .Jump_out_EXMem(Jump_out_EXMem_in_Mem),
      .Jump_in_EXMem(Jump_out_IDEX_in_EXMem),
      .MemRW_in_EXMem(MemRW_Ex),
      .MemRW_out_EXMem(MemRW_Mem),
      .RegWrite_in_EXMem(RegWrite_out_IDEX_in_EXMem),
      .RegWrite_out_EXMem(RegWrite_out_EXMem_in_MemWB),
      .clk_EXMem(clk),
      .en_EXMem(1'b1),
      .rst_EXMem(rst),
      .valid_in_EXMem(valid_out_IDEX_in_EXMem),
      .valid_out_EXMem(valid_out_EXMem_in_MemWB),
      .zero_in_EXMem(zero_out_EX_in_EXMem),
      .zero_out_EXMem(zero_out_EXMem_in_Mem),
      .ALU_in_EXMem(ALU_out_EX_in_EXMem),
      .ALU_out_EXMem(Addr_out),
      .MemtoReg_in_EXMem(MemtoReg_out_IDEX_in_EXMem),
      .MemtoReg_out_EXMem(MemtoReg_out_EXMem_in_MemWB),
      .Inst_in_EXMem(Inst_out_IDEX_in_EXMem),
      .Inst_out_EXMem(Inst_out_EXMem_in_MemWB),
      .PC_imm_EXMem(PC_out_Ex),
      .PC4_in_EXMem(PC4_out_EX_in_EXMem),
      .PC4_out_EXMem(PC4_out_EXMem_in_MemWB),
      .PC_in_EXMem(PC_out_IDEX_in_EX_in_EXMem),
      .PC_out_EXMem(PC_out_EXMem_in_MemWB),
      .PC_imm_out_EXMem(PC_in_IF_imm_out_EXMem),
      .Rd_addr_EXMem(Rd_addr_out_IDEX_EXMem),
      .Rd_addr_out_EXMem(Rd_addr_out_EXMem_MemWB),
      .Rs2_in_EXMem(Rs2_out_EX_in_EXMem),
      .Rs2_out_EXMem(Data_out)
    );
    
    Pipeline_Mem U7 (
      .BranchN_in_Mem(BranchN_out_EXMem_in_Mem),
      .Branch_in_Mem(Branch_out_EXMem_in_Mem),
      .Jump_in_Mem(Jump_out_EXMem_in_Mem),
      .PCSrc(PCSrc),
      .zero_in_Mem(zero_out_EXMem_in_Mem)
    );
    
    Mem_reg_WB_stall U8 (
      .RegWrite_in_MemWB(RegWrite_out_EXMem_in_MemWB),
      .RegWrite_out_MemWB(RegWrite_in_ID_out_MemWB),
      .clk_MemWB(clk),
      .en_MemWB(1'b1),
      .rst_MemWB(rst),
      .valid_in_MemWB(valid_out_EXMem_in_MemWB),
      .ALU_in_MemWB(Addr_out),
      .ALU_out_MemWB(ALU_out_MemWB_in_WB),
      .Dmem_data_MemWB(Data_in),
      .DMem_data_out_MemWB(DMem_data_out_MemWB_WB),
      .MemtoReg_in_MemWB(MemtoReg_out_EXMem_in_MemWB),
      .MemtoReg_out_MemWB(MemtoReg_out_MemWB_in_WB),
      .PC_in_MemWB(PC_out_EXMem_in_MemWB),
      .PC4_in_MemWB(PC4_out_EXMem_in_MemWB),
      .PC4_out_MemWB(PC4_out_MemWB_in_WB),
      .Inst_in_MemWB(Inst_out_EXMem_in_MemWB),
      .Rd_addr_MemWB(Rd_addr_out_EXMem_MemWB),
      .Rd_addr_out_MemWB(Rd_addr_ID_out_MemWB)
    );
    
    Pipeline_WB U9 (
      .ALU_in_WB(ALU_out_MemWB_in_WB),
      .Dmem_data_WB(DMem_data_out_MemWB_WB),
      .Data_out_WB(Data_out_WB),
      .MemtoReg_in_WB(MemtoReg_out_MemWB_in_WB),
      .PC4_in_WB(PC4_out_MemWB_in_WB)
    );
    
    stall U10(
      .rst_stall(rst),
      .RegWrite_out_IDEX(RegWrite_out_IDEX_in_EXMem),
      .Rd_addr_out_IDEX(Rd_addr_out_IDEX_EXMem),
      .RegWrite_out_EXMem(RegWrite_out_EXMem_in_MemWB),
      .Rd_addr_out_EXMem(Rd_addr_out_EXMem_MemWB),
      .Rs1_addr_ID(Rs1_addr_ID),
      .Rs2_addr_ID(Rs2_addr_ID),
      .Rs1_used(Rs1_used),
      .Rs2_used(Rs2_used),
      .Branch_ID(Branch_ID_in_IDEx),
      .BranchN_ID(BranchN_ID_in_IDEx),
      .Jump_ID(Jump_ID_in_IDEx),
      .Branch_out_IDEX(Branch_out_IDEX_in_EXMem),
      .BranchN_out_IDEX(BranchN_out_IDEX_in_EXMem),
      .Jump_out_IDEX(Jump_out_IDEX_in_EXMem),
      .Branch_out_EXMem(Branch_out_EXMem_in_Mem),
      .BranchN_out_EXMem(BranchN_out_EXMem_in_Mem),
      .Jump_out_EXMem(Jump_out_EXMem_in_Mem),
      .en_IF(en_IF),
      .en_IFID(en_IFID),
      .NOP_IFID(NOP_IFID),
      .NOP_IDEx(NOP_IDEX)
    );
    
endmodule
