`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/23 17:51:22
// Design Name: 
// Module Name: MUX4T1_32
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


module MUX4T1_32(
input wire[1:0] s,
input wire[31:0] I0,
input wire[31:0] I1,
input wire[31:0] I2,
input wire[31:0] I3,
output reg [31:0] o
    );
    always @(*) begin
        if (s == 2'b00)
            o =I0 ;
        else if (s == 2'b01)
            o = I1 ;
        else if (s == 2'b10)
            o = I2 ;
        else
            o = I3 ;
    end
endmodule
