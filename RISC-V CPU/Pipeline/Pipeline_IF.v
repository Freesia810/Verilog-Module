`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/31 22:02:27
// Design Name: 
// Module Name: Pipeline_IF
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


module Pipeline_IF(
    input clk_IF,
    input rst_IF,
    input en_IF,
    input[31:0] PC_in_IF,
    input PCSrc,
    output[31:0] PC_out_IF
    );
    
    wire[31:0] o_D;
    wire[31:0] I0_c;
    
    MUX2T1_32 m0(
        .s(PCSrc),
        .I0(I0_c),
        .I1(PC_in_IF),
        .o(o_D)
    );
    
    REG32 m1(
        .clk(clk_IF),
        .rst(rst_IF),
        .CE(en_IF),
        .D(o_D),
        .Q(PC_out_IF)
    );
    
    add32 m2(
        .a(32'b0000_0000_0000_0000_0000_0000_0000_0100),
        .b(PC_out_IF),
        .c(I0_c)
    );
endmodule
