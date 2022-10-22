`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/23 17:45:56
// Design Name: 
// Module Name: MUX2T1_32
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



module MUX2T1_32(
input wire s,
input wire[31:0] I0,
input wire[31:0] I1,
output reg [31:0] o
    );
    always @(*) begin
        if (s == 1'b0)
            o =I0 ;
        else
            o = I1 ;
    end
endmodule
