`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/23 18:18:36
// Design Name: 
// Module Name: ImmGen
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


module ImmGen(
input wire [2:0] ImmSel,
input wire [31:0] inst_field,
input wire [3:0] ALU_Control,
output reg [31:0] Imm_out
    );
    always@(*)
    begin
        case(ImmSel)
            3'b001: 
            if(ALU_Control == 4'b1111)
                Imm_out = {22'b0, inst_field[29:20]}; 
            else
                Imm_out = {{20{inst_field[31]}},inst_field[31:20]}; //addi
            
            3'b010: Imm_out = {{20{inst_field[31]}},inst_field[31:25],inst_field[11:7]};//s sw
            3'b011: Imm_out = {{20{inst_field[31]}},inst_field[7],inst_field[30:25],inst_field[11:8],1'b0};//b beq
            3'b100: Imm_out = {{12{inst_field[31]}},inst_field[19:12],inst_field[20],inst_field[30:21],1'b0};//j jal
            3'b000: Imm_out = {inst_field[31:12],12'h000}; //lui
        endcase
    end
endmodule
