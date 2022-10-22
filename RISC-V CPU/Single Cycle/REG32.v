`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/23 19:08:16
// Design Name: 
// Module Name: REG32
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


module REG32(
input wire clk,
input wire rst,
input wire CE,
input wire[31:0] D,
output reg[31:0] Q
    );
    always@(posedge clk or posedge rst)
    begin
        if(rst==1) Q<=32'b0;
        else if(CE==1) Q<=D;
    end
endmodule
