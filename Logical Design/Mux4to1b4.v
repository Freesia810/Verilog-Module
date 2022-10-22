`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:00 11/03/2021 
// Design Name: 
// Module Name:    Mux4to1b4 
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
module Mux4to1b4(I0, 
                 I1, 
                 I2, 
                 I3, 
                 s, 
                 o);

    input [3:0] I0;
    input [3:0] I1;
    input [3:0] I2;
    input [3:0] I3;
    input [1:0] s;
   output [3:0] o;
   
   wire XLXN_1;
   wire XLXN_2;
   wire XLXN_3;
   wire XLXN_4;
   wire XLXN_5;
   wire XLXN_6;
   wire XLXN_7;
   wire XLXN_8;
   wire XLXN_9;
   wire XLXN_10;
   wire XLXN_11;
   wire XLXN_12;
   wire XLXN_16;
   wire XLXN_17;
   wire XLXN_18;
   wire XLXN_19;
   wire XLXN_25;
   wire XLXN_31;
   wire XLXN_35;
   wire XLXN_39;
   wire XLXN_51;
   wire XLXN_52;
   
   AND2  XLXI_2 (.I0(I0[0]), 
                .I1(XLXN_25), 
                .O(XLXN_19));
   AND2  XLXI_3 (.I0(I1[0]), 
                .I1(XLXN_31), 
                .O(XLXN_18));
   AND2  XLXI_4 (.I0(I2[0]), 
                .I1(XLXN_35), 
                .O(XLXN_17));
   AND2  XLXI_5 (.I0(I3[0]), 
                .I1(XLXN_39), 
                .O(XLXN_16));
   AND2  XLXI_6 (.I0(I0[1]), 
                .I1(XLXN_25), 
                .O(XLXN_12));
   AND2  XLXI_7 (.I0(I1[1]), 
                .I1(XLXN_31), 
                .O(XLXN_11));
   AND2  XLXI_8 (.I0(I2[1]), 
                .I1(XLXN_35), 
                .O(XLXN_10));
   AND2  XLXI_9 (.I0(I3[1]), 
                .I1(XLXN_39), 
                .O(XLXN_9));
   AND2  XLXI_10 (.I0(I0[2]), 
                 .I1(XLXN_25), 
                 .O(XLXN_8));
   AND2  XLXI_11 (.I0(I1[2]), 
                 .I1(XLXN_31), 
                 .O(XLXN_7));
   AND2  XLXI_12 (.I0(I2[2]), 
                 .I1(XLXN_35), 
                 .O(XLXN_6));
   AND2  XLXI_13 (.I0(I3[2]), 
                 .I1(XLXN_39), 
                 .O(XLXN_5));
   AND2  XLXI_14 (.I0(I0[3]), 
                 .I1(XLXN_25), 
                 .O(XLXN_4));
   AND2  XLXI_15 (.I0(I1[3]), 
                 .I1(XLXN_31), 
                 .O(XLXN_3));
   AND2  XLXI_16 (.I0(I2[3]), 
                 .I1(XLXN_35), 
                 .O(XLXN_2));
   AND2  XLXI_17 (.I0(I3[3]), 
                 .I1(XLXN_39), 
                 .O(XLXN_1));
   OR4  XLXI_18 (.I0(XLXN_16), 
                .I1(XLXN_17), 
                .I2(XLXN_18), 
                .I3(XLXN_19), 
                .O(o[0]));
   OR4  XLXI_19 (.I0(XLXN_9), 
                .I1(XLXN_10), 
                .I2(XLXN_11), 
                .I3(XLXN_12), 
                .O(o[1]));
   OR4  XLXI_20 (.I0(XLXN_5), 
                .I1(XLXN_6), 
                .I2(XLXN_7), 
                .I3(XLXN_8), 
                .O(o[2]));
   OR4  XLXI_21 (.I0(XLXN_1), 
                .I1(XLXN_2), 
                .I2(XLXN_3), 
                .I3(XLXN_4), 
                .O(o[3]));
   AND2  XLXI_22 (.I0(XLXN_52), 
                 .I1(XLXN_51), 
                 .O(XLXN_25));
   AND2  XLXI_23 (.I0(s[0]), 
                 .I1(XLXN_51), 
                 .O(XLXN_31));
   AND2  XLXI_24 (.I0(s[1]), 
                 .I1(XLXN_52), 
                 .O(XLXN_35));
   AND2  XLXI_25 (.I0(s[1]), 
                 .I1(s[0]), 
                 .O(XLXN_39));
   INV  XLXI_26 (.I(s[1]), 
                .O(XLXN_51));
   INV  XLXI_27 (.I(s[0]), 
                .O(XLXN_52));
endmodule
