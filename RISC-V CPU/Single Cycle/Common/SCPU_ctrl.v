`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/23 22:20:08
// Design Name: 
// Module Name: SCPU_ctrl
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


module SCPU_ctrl(
input wire[4:0] OPcode,
input wire[2:0] Fun3,
input wire Fun7,
input wire MIO_ready,
output reg[1:0] ImmSel,
output reg ALUSrc_B,
output reg[1:0] MemtoReg,
output reg Jump, 
output reg Branch,
output reg RegWrite,
output reg MemRW,
output reg[2:0] ALU_Control,
output reg CPU_MIO
    );
    reg[1:0] ALUop;
    wire[3:0] Fun;
    assign Fun={Fun3,Fun7};
    always@(*)
    begin
        case(OPcode)
        5'b01100: {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop,ImmSel} = 11'b0_00_1_0_0_0_10_00;
        5'b00100: {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop,ImmSel} = 11'b1_00_1_0_0_0_11_00;
        5'b00000: {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop,ImmSel} = 11'b1_01_1_0_0_0_00_00;
        5'b01000: {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop,ImmSel} = 11'b1_00_0_1_0_0_00_01;
        5'b11000: {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop,ImmSel} = 11'b0_00_0_0_1_0_01_10;
        5'b11011: {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop,ImmSel} = 11'b1_10_1_0_0_1_00_11;
        default: {ALUSrc_B,MemtoReg,RegWrite,MemRW,Branch,Jump,ALUop,ImmSel} = 11'bxxxxxxxxxxx;
        endcase
    end
    always@(*)
    begin
        case(ALUop)
        2'b00: ALU_Control = 3'b010;
        2'b01: ALU_Control = 3'b110;
        2'b10:
            case(Fun)
            4'b0000: ALU_Control = 3'b010;
            4'b0001: ALU_Control = 3'b110;
            4'b0100: ALU_Control = 3'b111;
            4'b1000: ALU_Control = 3'b011;
            4'b1010: ALU_Control = 3'b101;
            4'b1100: ALU_Control = 3'b001;
            4'b1110: ALU_Control = 3'b000;
            default: ALU_Control = 3'bx;
            endcase
        2'b11:
            case(Fun3)
            3'b000: ALU_Control = 3'b010;
            3'b010: ALU_Control = 3'b111;
            3'b100: ALU_Control = 3'b011;
            3'b110: ALU_Control = 3'b001;
            3'b111: ALU_Control = 3'b000;
            3'b101: ALU_Control = 3'b101;
            default: ALU_Control = 3'bx;
            endcase
        endcase
    end
endmodule
