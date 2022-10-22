`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:42 12/20/2021 
// Design Name: 
// Module Name:    shift_reg 
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
module shift_reg(
    input wire clk, S_L, s_in,
    input wire [7:0] p_in,
    output wire [7:0] Q
	 );
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
   wire XLXN_13;
   wire XLXN_14;
   wire XLXN_15;
   wire XLXN_16;
   wire XLXN_18;
   wire XLXN_19;
   wire XLXN_20;
   wire XLXN_21;
   wire XLXN_22;
   wire XLXN_23;
   wire XLXN_24;
   wire XLXN_25;
   wire XLXN_66;
   wire [7:0] Q_DUMMY;
   
   assign Q[7:0] = Q_DUMMY[7:0];
   FD #( .INIT(1'b0) ) XLXI_1 (.C(clk), 
              .D(XLXN_1), 
              .Q(Q_DUMMY[7]));
   FD #( .INIT(1'b0) ) XLXI_2 (.C(clk), 
              .D(XLXN_2), 
              .Q(Q_DUMMY[6]));
   FD #( .INIT(1'b0) ) XLXI_3 (.C(clk), 
              .D(XLXN_3), 
              .Q(Q_DUMMY[5]));
   FD #( .INIT(1'b0) ) XLXI_4 (.C(clk), 
              .D(XLXN_4), 
              .Q(Q_DUMMY[4]));
   FD #( .INIT(1'b0) ) XLXI_5 (.C(clk), 
              .D(XLXN_8), 
              .Q(Q_DUMMY[3]));
   FD #( .INIT(1'b0) ) XLXI_6 (.C(clk), 
              .D(XLXN_7), 
              .Q(Q_DUMMY[2]));
   FD #( .INIT(1'b0) ) XLXI_7 (.C(clk), 
              .D(XLXN_6), 
              .Q(Q_DUMMY[1]));
   FD #( .INIT(1'b0) ) XLXI_8 (.C(clk), 
              .D(XLXN_5), 
              .Q(Q_DUMMY[0]));
   OR2  XLXI_9 (.I0(XLXN_10), 
               .I1(XLXN_9), 
               .O(XLXN_1));
   OR2  XLXI_10 (.I0(XLXN_12), 
                .I1(XLXN_11), 
                .O(XLXN_2));
   OR2  XLXI_11 (.I0(XLXN_14), 
                .I1(XLXN_13), 
                .O(XLXN_3));
   OR2  XLXI_12 (.I0(XLXN_16), 
                .I1(XLXN_15), 
                .O(XLXN_4));
   OR2  XLXI_13 (.I0(XLXN_18), 
                .I1(XLXN_19), 
                .O(XLXN_5));
   OR2  XLXI_14 (.I0(XLXN_20), 
                .I1(XLXN_21), 
                .O(XLXN_6));
   OR2  XLXI_15 (.I0(XLXN_22), 
                .I1(XLXN_23), 
                .O(XLXN_7));
   OR2  XLXI_16 (.I0(XLXN_24), 
                .I1(XLXN_25), 
                .O(XLXN_8));
   AND2  XLXI_17 (.I0(XLXN_66), 
                 .I1(s_in), 
                 .O(XLXN_9));
   AND2  XLXI_18 (.I0(S_L), 
                 .I1(p_in[7]), 
                 .O(XLXN_10));
   AND2  XLXI_19 (.I0(XLXN_66), 
                 .I1(Q_DUMMY[7]), 
                 .O(XLXN_11));
   AND2  XLXI_20 (.I0(S_L), 
                 .I1(p_in[6]), 
                 .O(XLXN_12));
   AND2  XLXI_21 (.I0(XLXN_66), 
                 .I1(Q_DUMMY[6]), 
                 .O(XLXN_13));
   AND2  XLXI_22 (.I0(S_L), 
                 .I1(p_in[5]), 
                 .O(XLXN_14));
   AND2  XLXI_23 (.I0(XLXN_66), 
                 .I1(Q_DUMMY[5]), 
                 .O(XLXN_15));
   AND2  XLXI_24 (.I0(S_L), 
                 .I1(p_in[4]), 
                 .O(XLXN_16));
   AND2  XLXI_25 (.I0(XLXN_66), 
                 .I1(Q_DUMMY[1]), 
                 .O(XLXN_19));
   AND2  XLXI_26 (.I0(S_L), 
                 .I1(p_in[0]), 
                 .O(XLXN_18));
   AND2  XLXI_27 (.I0(S_L), 
                 .I1(p_in[1]), 
                 .O(XLXN_20));
   AND2  XLXI_28 (.I0(XLXN_66), 
                 .I1(Q_DUMMY[2]), 
                 .O(XLXN_21));
   AND2  XLXI_29 (.I0(S_L), 
                 .I1(p_in[2]), 
                 .O(XLXN_22));
   AND2  XLXI_30 (.I0(XLXN_66), 
                 .I1(Q_DUMMY[3]), 
                 .O(XLXN_23));
   AND2  XLXI_31 (.I0(S_L), 
                 .I1(p_in[3]), 
                 .O(XLXN_24));
   AND2  XLXI_32 (.I0(XLXN_66), 
                 .I1(Q_DUMMY[4]), 
                 .O(XLXN_25));
   INV  XLXI_33 (.I(S_L), 
                .O(XLXN_66));
endmodule
