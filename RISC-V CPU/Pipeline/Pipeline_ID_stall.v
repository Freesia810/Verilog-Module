`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/01 19:17:21
// Design Name: 
// Module Name: Pipeline_ID_stall
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


module Pipeline_ID_stall(
    input clk_ID,
    input rst_ID,
    input RegWrite_in_ID,
    input[4:0] Rd_addr_ID,
    input[31:0] Wt_data_ID,
    input[31:0] Inst_in_ID,
    output[31:0] Rd_addr_out_ID,
    output[31:0] Rs1_out_ID,
    output[31:0] Rs2_out_ID,
    output[4:0] Rs1_addr_ID,
    output[4:0] Rs2_addr_ID,
    output Rs1_used,
    output Rs2_used,
    output[31:0] Imm_out_ID,
    output ALUSrc_B_ID,
    output[2:0] ALU_control_ID,
    output Branch_ID,
    output BranchN_ID,
    output MemRW_ID,
    output Jump_ID,
    output[1:0] MemtoReg_ID,
    output RegWrite_out_ID
    );
    
    wire[1:0] ImmSel;
    
    ImmGen m0(
        .ImmSel(ImmSel),
        .inst_field(Inst_in_ID),
        .Imm_out(Imm_out_ID)
    );
    
    Regs m1(
        .clk(clk_ID),
        .rst(rst_ID),
        .RegWrite(RegWrite_in_ID),
        .Rs1_addr(Inst_in_ID[19:15]),
        .Rs2_addr(Inst_in_ID[24:20]),
        .Wt_addr(Rd_addr_ID),
        .Wt_data(Wt_data_ID),
        .Rs1_data(Rs1_out_ID),
        .Rs2_data(Rs2_out_ID)
    );
    
    SCPU_ctrl m2(
        .OPcode(Inst_in_ID[6:2]),
        .Fun3(Inst_in_ID[14:12]),
        .Fun7(Inst_in_ID[30]),
        .ImmSel(ImmSel),
        .ALUSrc_B(ALUSrc_B_ID),
        .MemtoReg(MemtoReg_ID),
        .Jump(Jump_ID), 
        .Branch(Branch_ID),
        .BranchN(BranchN_ID),
        .RegWrite(RegWrite_out_ID),
        .MemRW(MemRW_ID),
        .ALU_Control(ALU_control_ID),
        .Rs1_used(Rs1_used),
        .Rs2_used(Rs2_used)
    );
    
    
    assign Rd_addr_out_ID = Inst_in_ID[11:7];
    assign Rs1_addr_ID = Inst_in_ID[19:15];
    assign Rs2_addr_ID = Inst_in_ID[24:20];
    
endmodule
