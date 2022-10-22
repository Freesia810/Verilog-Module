`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/09 19:47:20
// Design Name: 
// Module Name: div32
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


module div32(
  input wire clk,
  input wire rst,
  input wire[31:0] dividend, //±»³ýÊý
  input wire[31:0] divisor,  //³ýÊý
  input wire start,
  output wire[31:0] quotient,
  output wire[31:0] remainder,
  output reg finish
    );
    integer i = 0;
    reg[63:0] REG;
    always@(posedge clk or negedge rst) begin
        if(start == 1'b1)begin
            finish <= 1'b0;
            REG = {32'b0,dividend};
            REG = REG << 1;
        end
        else if (start == 1'b0&&finish==1'b0)begin
            REG = {REG[63:32] - divisor,REG[31:0]};
            if(REG[63] == 1'b1)begin
                REG = {REG[63:32] + divisor,REG[31:0]};
                REG = REG << 1;
            end
            else begin
                REG = REG << 1;
                REG[0] = 1'b1;
            end
            i = i + 1;
        end
        if(i == 32)begin
            REG = {REG[63:32] >> 1,REG[31:0]};
            finish <= 1'b1;
            i <= 0;
        end
    end
    
    assign quotient = REG[31:0];
    assign remainder = REG[63:32];
endmodule
