`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/09 09:14:12
// Design Name: 
// Module Name: mul32
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


module mul32(
  input wire clk,
  input wire rst,
  input wire[31:0] multiplicand,
  input wire[31:0] multiplier,
  input wire start,
  output reg[63:0] product,
  output reg finish
    );
    integer i = 0;
    reg[31:0] multicand;
    
    always@(posedge clk or negedge rst) begin
        if(start == 1'b1)begin
            finish <= 1'b0;
            product <= {32'b0,multiplier};
            multicand <= multiplicand;
        end
        else if(start == 1'b0&&finish==1'b0)begin
            if(product[0]==1'b1)begin
                product = {multicand + product[63:32],product[31:0]}; 
            end
            product = product >> 1;
            i <= i + 1;
        end
        
        if(i == 31)begin
            finish <= 1'b1;
            i<=0;
        end
    end
endmodule
