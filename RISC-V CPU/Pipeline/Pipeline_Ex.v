`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/01 09:52:26
// Design Name: 
// Module Name: Pipeline_Ex
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


module Pipeline_Ex(
    input[31:0] PC_in_EX,
    input[31:0] Rs1_in_EX,
    input[31:0] Rs2_in_EX,
    input[31:0] Imm_in_EX,
    input ALUSrc_B_in_EX,
    input[2:0] ALU_control_in_EX,
    output[31:0] PC_out_EX,
    output[31:0] PC4_out_EX,
    output zero_out_EX,
    output[31:0] ALU_out_EX,
    output[31:0] Rs2_out_EX
    );
    
    wire[31:0] o_B;
    

    assign Rs2_out_EX = Rs2_in_EX;

    
    MUX2T1_32 m0(
        .s(ALUSrc_B_in_EX),
        .I0(Rs2_in_EX),
        .I1(Imm_in_EX),
        .o(o_B)
    );
    
    add32 m1(
        .a(32'b0000_0000_0000_0000_0000_0000_0000_0100),
        .b(PC_in_EX),
        .c(PC4_out_EX)
    );
    
    add32 m2(
        .a(PC_in_EX),
        .b(Imm_in_EX),
        .c(PC_out_EX)
    );
    
    ALU m3(
        .A(Rs1_in_EX),
        .B(o_B),
        .ALU_operation(ALU_control_in_EX),
        .res(ALU_out_EX),
        .zero(zero_out_EX)
    );
endmodule
