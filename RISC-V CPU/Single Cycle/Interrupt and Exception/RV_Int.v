`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/25 10:04:56
// Design Name: 
// Module Name: RV_Int
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


module RV_Int(
    input wire clk,
    input wire rst,
    input wire INT,
    input wire ecall,
    input wire mret,
    input wire ill_stru,
    input wire[31:0] pc_next,
    output reg[31:0] pc
    );
    reg[31:0] mepc;
    integer i;
    always@(posedge clk or posedge rst)
    begin
        if(rst) 
        begin 
            mepc <= 32'b0;
            pc <= 32'b0;
            i <= 0;
        end
        else if(mret)
        begin
            pc <= mepc;
            i <= 0;
        end
        else if(INT&&~i)
        begin
            mepc <= pc_next;
            pc <= 32'h0000000c;
            i <= 1;
        end
        else if(ill_stru)
        begin
            mepc <= pc_next;
            pc <= 32'h00000004;
        end
        else if(ecall) 
        begin
            mepc <= pc_next;
            pc <= 32'h00000008;
        end
        else
        begin
            pc <= pc_next;
        end
    end
endmodule
