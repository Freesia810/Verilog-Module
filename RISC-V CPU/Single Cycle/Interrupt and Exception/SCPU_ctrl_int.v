`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/25 12:24:21
// Design Name: 
// Module Name: SCPU_ctrl_int
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


module SCPU_ctrl_int(
input wire[4:0] OPcode,
input wire[2:0] Fun3,
input wire Fun7,
input wire MIO_ready,
input wire[2:0] Fun_ecall,
input wire[1:0] Fun_mret,
output reg[2:0] ImmSel,
output reg ALUSrc_B,
output reg[1:0] MemtoReg,
output reg[1:0] Jump, 
output reg Branch,
output reg BranchN,
output reg RegWrite,
output reg MemRW,
output reg[3:0] ALU_Control,
output reg CPU_MIO,
output reg ecall,
output reg mret,
output reg ill_stru
    );
    reg[1:0] ALUop;
    wire[3:0] Fun;
    assign Fun={Fun3,Fun7};
    always@(*)
    begin
        case(OPcode)
        5'b01100: {Branch,BranchN,Jump,ImmSel,ALUSrc_B,ALUop,MemRW,RegWrite,MemtoReg,ecall,mret,ill_stru} = 17'b0_0_00_000_0_10_0_1_00_000;
        5'b00100: {Branch,BranchN,Jump,ImmSel,ALUSrc_B,ALUop,MemRW,RegWrite,MemtoReg,ecall,mret,ill_stru} = 17'b0_0_00_001_1_11_0_1_00_000;
        5'b00000: {Branch,BranchN,Jump,ImmSel,ALUSrc_B,ALUop,MemRW,RegWrite,MemtoReg,ecall,mret,ill_stru} = 17'b0_0_00_001_1_00_0_1_01_000;
        5'b01000: {Branch,BranchN,Jump,ImmSel,ALUSrc_B,ALUop,MemRW,RegWrite,MemtoReg,ecall,mret,ill_stru} = 17'b0_0_00_010_1_00_1_0_00_000;
        5'b11000: 
            case(Fun3)
            3'b000: {Branch,BranchN,Jump,ImmSel,ALUSrc_B,ALUop,MemRW,RegWrite,MemtoReg,ecall,mret,ill_stru} = 17'b1_0_00_011_0_01_0_0_00_000;
            3'b001: {Branch,BranchN,Jump,ImmSel,ALUSrc_B,ALUop,MemRW,RegWrite,MemtoReg,ecall,mret,ill_stru} = 17'b0_1_00_011_0_01_0_0_00_000;
            default: {Branch,BranchN,Jump,ImmSel,ALUSrc_B,ALUop,MemRW,RegWrite,MemtoReg,ecall,mret,ill_stru} = 17'b0_0_00_000_0_00_0_0_00_001;
            endcase
        5'b11001: {Branch,BranchN,Jump,ImmSel,ALUSrc_B,ALUop,MemRW,RegWrite,MemtoReg,ecall,mret,ill_stru} = 17'b0_0_10_001_1_00_0_1_10_000;
        5'b11011: {Branch,BranchN,Jump,ImmSel,ALUSrc_B,ALUop,MemRW,RegWrite,MemtoReg,ecall,mret,ill_stru} = 17'b0_0_01_100_1_00_0_1_10_000;
        5'b01101: {Branch,BranchN,Jump,ImmSel,ALUSrc_B,ALUop,MemRW,RegWrite,MemtoReg,ecall,mret,ill_stru} = 17'b0_0_00_000_0_00_0_1_11_000;
        5'b11100: 
            begin
            if(Fun_ecall == 3'b000)
                {Branch,BranchN,Jump,ImmSel,ALUSrc_B,ALUop,MemRW,RegWrite,MemtoReg,ecall,mret,ill_stru} = 17'b0_0_00_001_0_00_0_0_00_100;
            else if(Fun_mret == 2'b11)
                {Branch,BranchN,Jump,ImmSel,ALUSrc_B,ALUop,MemRW,RegWrite,MemtoReg,ecall,mret,ill_stru} = 17'b0_0_00_000_0_00_0_0_00_010;
            end
        default: {Branch,BranchN,Jump,ImmSel,ALUSrc_B,ALUop,MemRW,RegWrite,MemtoReg,ecall,mret,ill_stru} = 17'b0_0_00_000_0_00_0_0_00_001;
        endcase
    end
    always@(*)
    begin
        case(ALUop)
        2'b00: ALU_Control = 4'b0010;
        2'b01: ALU_Control = 4'b0110;
        2'b10:
            case(Fun)
            4'b0000: ALU_Control = 4'b0010;
            4'b0001: ALU_Control = 4'b0110;
            4'b0010: ALU_Control = 4'b1110;
            4'b0100: ALU_Control = 4'b0111;
            4'b0110: ALU_Control = 4'b1001;
            4'b1000: ALU_Control = 4'b1100;
            4'b1010: ALU_Control = 4'b1101;
            4'b1011: ALU_Control = 4'b1111;
            4'b1100: ALU_Control = 4'b0001;
            4'b1110: ALU_Control = 4'b0000;
            default: ALU_Control = 4'bx;
            endcase
        2'b11:
            case(Fun3)
            3'b000: ALU_Control = 4'b0010;
            3'b010: ALU_Control = 4'b0111;
            3'b011: ALU_Control = 4'b1001;
            3'b100: ALU_Control = 4'b1100;
            3'b110: ALU_Control = 4'b0001;
            3'b111: ALU_Control = 4'b0000;
            3'b001: ALU_Control = 4'b1110;
            3'b101: 
                case(Fun7)
                1'b0: ALU_Control = 4'b1101;
                1'b1: ALU_Control = 4'b1111;
                endcase
            default: ALU_Control = 4'bx;
            endcase
        endcase
    end
endmodule
