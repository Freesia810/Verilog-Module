`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/24 17:21:02
// Design Name: 
// Module Name: sltu
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


module sltu(
input wire[31:0] A,
input wire[31:0] B,
output reg[31:0] res
    );
    reg[31:0] a;
    reg[31:0] b;
    always@(*)
    begin
        a = A;
        b = B;
       if(a >= b)
            res = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        else
            res = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
    end
endmodule
