`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/01 11:24:27
// Design Name: 
// Module Name: Pipeline_WB
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


module Pipeline_WB(
    input[31:0] PC4_in_WB,
    input[31:0] ALU_in_WB,
    input[31:0] Dmem_data_WB,
    input[1:0] MemtoReg_in_WB,
    output[31:0] Data_out_WB
    );
    MUX4T1_32 m0(
    .s(MemtoReg_in_WB),
    .I0(ALU_in_WB),
    .I1(Dmem_data_WB),
    .I2(PC4_in_WB),
    .I3(PC4_in_WB),
    .o(Data_out_WB)
    );
endmodule
