`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:23 11/03/2021 
// Design Name: 
// Module Name:    Mux4to1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Mux4to1(I0, 
               I1, 
               I2, 
               I3, 
               S, 
               o);

    input I0;
    input I1;
    input I2;
    input I3;
    input [1:0] S;
   output o;
   
   wire XLXN_1;
   wire XLXN_2;
   wire XLXN_3;
   wire XLXN_4;
   wire XLXN_6;
   wire XLXN_7;
   wire XLXN_8;
   wire XLXN_9;
   wire XLXN_11;
   wire XLXN_12;
   
   AND2  XLXI_1 (.I0(I0), 
                .I1(XLXN_6), 
                .O(XLXN_1));
   AND2  XLXI_2 (.I0(I1), 
                .I1(XLXN_7), 
                .O(XLXN_2));
   AND2  XLXI_3 (.I0(I2), 
                .I1(XLXN_8), 
                .O(XLXN_3));
   AND2  XLXI_4 (.I0(I3), 
                .I1(XLXN_9), 
                .O(XLXN_4));
   AND2  XLXI_5 (.I0(XLXN_12), 
                .I1(XLXN_11), 
                .O(XLXN_6));
   AND2  XLXI_6 (.I0(S[0]), 
                .I1(XLXN_11), 
                .O(XLXN_7));
   AND2  XLXI_7 (.I0(S[1]), 
                .I1(XLXN_12), 
                .O(XLXN_8));
   AND2  XLXI_8 (.I0(S[1]), 
                .I1(S[0]), 
                .O(XLXN_9));
   OR4  XLXI_9 (.I0(XLXN_4), 
               .I1(XLXN_3), 
               .I2(XLXN_2), 
               .I3(XLXN_1), 
               .O(o));
   INV  XLXI_10 (.I(S[1]), 
                .O(XLXN_11));
   INV  XLXI_11 (.I(S[0]), 
                .O(XLXN_12));
endmodule