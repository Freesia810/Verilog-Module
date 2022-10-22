`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/24 14:32:15
// Design Name: 
// Module Name: Regs
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


module Regs(
    input clk , rst , RegWrite ,
    input [4:0] Rs1_addr, Rs2_addr,Wt_addr ,
    input [31:0] Wt_data,
    output [31:0] Rs1_data, Rs2_data
    );
    reg[31:0] register [1:31];
    integer i;
    assign Rs1_data = (Rs1_addr == 0) ? 0 : register[Rs1_addr];
    assign Rs2_data = (Rs2_addr == 0) ? 0 : register[Rs2_addr];
    always @(posedge clk or posedge rst )begin 
        if (rst ==1) for( i =1; i <32; i =i+1) 
            register[i] <= 0;
        else if ((Wt_addr != 0) && (RegWrite == 1))
            register[Wt_addr] <= Wt_data ;
        end
endmodule
