`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/24 17:51:41
// Design Name: 
// Module Name: ALU
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


module ALU(
input[31:0] A,
input[31:0] B,
input[3:0] ALU_operation,
output[31:0] res,
output zero
    );
    wire[31:0] and32_o;
    wire[31:0] or32_o;
    wire[31:0] xor32_o;
    wire[31:0] nor32_o;
    wire[31:0] srl32_o;
    wire[31:0] signal_ext_o;
    wire[31:0] sll_o;
    wire[31:0] sra_o;
    wire[31:0] sltu_o;
    wire[31:0] mm1_o;
    wire[32:0] mm2_o;
    
    and32 m0 (.A(A),
    .B(B),
    .res(and32_o));
    
    or32 m1 (.A(A),
    .B(B),
    .res(or32_o));
    
    xor32 m2 (.A(A),
    .B(B),
    .res(xor32_o));
    
    nor32 m3 (.A(A),
    .B(B),
    .res(nor32_o));
    
    srl m4 (.A(A),
    .B(B),
    .res(srl32_o));
    
    sll slm3 (.A(A),
    .B(B),
    .res(sll_o));
    
    sra slm4 (.A(A),
    .B(B),
    .res(sra_o));
    
    sltu sltm0 (.A(A),
    .B(B),
    .res(sltu_o));
    
    SignalExt_32_0 mm0 (
    .S(ALU_operation[2]),
    .So(signal_ext_o)
    );
    
    xor32 mm1 (.A(signal_ext_o),
    .B(B),
    .res(mm1_o));
    
    addc_32_0 mm2 (
    .C0(ALU_operation[2]),
    .A(A),
    .B(mm1_o),
    .S(mm2_o) );
    
    MUX16T1_32 mm3 (
      .s(ALU_operation),
      .I0(and32_o),
      .I1(or32_o),
      .I2(mm2_o[31:0]),
      .I4(nor32_o),
      .I6(mm2_o[31:0]),
      .I7({31'b0,mm2_o[32]}),
      .I9(sltu_o),
      .I12(xor32_o),
      .I13(srl32_o),
      .I14(sll_o),
      .I15(sra_o),
      .o(res)
);
    or_bit_32 mm4 (
  .o(zero),  // output wire o
  .A(res));
endmodule
