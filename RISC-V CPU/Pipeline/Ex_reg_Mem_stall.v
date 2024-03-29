`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/01 22:40:08
// Design Name: 
// Module Name: Ex_reg_Mem_stall
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


module Ex_reg_Mem_stall(
    input clk_EXMem,
    input rst_EXMem,
    input en_EXMem,
    input[31:0] PC_imm_EXMem,
    input[31:0] PC_in_EXMem,
    input[31:0] PC4_in_EXMem,
    input valid_in_EXMem,
    input[31:0] Inst_in_EXMem,
    input[4:0] Rd_addr_EXMem,
    input zero_in_EXMem,
    input[31:0] ALU_in_EXMem,
    input[31:0] Rs2_in_EXMem,
    input Branch_in_EXMem,
    input BranchN_in_EXMem,
    input MemRW_in_EXMem,
    input Jump_in_EXMem,
    input[1:0] MemtoReg_in_EXMem,
    input RegWrite_in_EXMem,
    output reg[31:0] PC_imm_out_EXMem,
    output reg[31:0] PC_out_EXMem,
    output reg[31:0] PC4_out_EXMem,
    output reg valid_out_EXMem,
    output reg[31:0] Inst_out_EXMem,
    output reg[4:0] Rd_addr_out_EXMem,
    output reg zero_out_EXMem,
    output reg[31:0] ALU_out_EXMem,
    output reg [31:0] Rs2_out_EXMem,
    output reg Branch_out_EXMem,
    output reg BranchN_out_EXMem,
    output reg MemRW_out_EXMem,
    output reg Jump_out_EXMem,
    output reg[1:0] MemtoReg_out_EXMem,
    output reg RegWrite_out_EXMem
    );
    
    always @(posedge clk_EXMem or posedge rst_EXMem)
    begin
        if(rst_EXMem == 1'b1)
        begin
            PC_imm_out_EXMem <= 32'b0;
            PC_out_EXMem <= 32'b0;
            PC4_out_EXMem <= 32'b0;
            valid_out_EXMem <= 1'b0;
            Inst_out_EXMem <= 32'b0;
            Rd_addr_out_EXMem <= 32'b0;
            zero_out_EXMem <= 1'b0;
            ALU_out_EXMem <= 32'b0;
            Rs2_out_EXMem <= 32'b0;
            Branch_out_EXMem <= 1'b0;
            BranchN_out_EXMem <= 1'b0;
            MemRW_out_EXMem <= 1'b0;
            Jump_out_EXMem <= 1'b0;
            MemtoReg_out_EXMem <= 2'b0;
            RegWrite_out_EXMem <= 1'b0;
        end
        else if(en_EXMem == 1'b1)
        begin
            PC_imm_out_EXMem <= PC_imm_EXMem;
            PC_out_EXMem <= PC_in_EXMem;
            PC4_out_EXMem <= PC4_in_EXMem;
            valid_out_EXMem <= valid_in_EXMem;
            Inst_out_EXMem <= Inst_in_EXMem;
            Rd_addr_out_EXMem <= Rd_addr_EXMem;
            zero_out_EXMem <= zero_in_EXMem;
            ALU_out_EXMem <= ALU_in_EXMem;
            Rs2_out_EXMem <= Rs2_in_EXMem;
            Branch_out_EXMem <= Branch_in_EXMem;
            BranchN_out_EXMem <= BranchN_in_EXMem;
            MemRW_out_EXMem <= MemRW_in_EXMem;
            Jump_out_EXMem <= Jump_in_EXMem;
            MemtoReg_out_EXMem <= MemtoReg_in_EXMem;
            RegWrite_out_EXMem <= RegWrite_in_EXMem;
        end
    end
endmodule
