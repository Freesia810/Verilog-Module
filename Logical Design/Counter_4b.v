`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:22:22 11/03/2021 
// Design Name: 
// Module Name:    Counter_4b 
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
module Counter_4b(clk, 
                 Qa, 
                 Qb, 
                 Qc, 
                 Qd, 
                 Rc);

    input clk;
   output Qa;
   output Qb;
   output Qc;
   output Qd;
   output Rc;
   
   wire XLXN_1;
   wire XLXN_2;
   wire XLXN_3;
   wire XLXN_8;
   wire XLXN_12;
   wire XLXN_16;
   wire XLXN_19;
   wire XLXN_28;
   wire XLXN_29;
   wire Qa_DUMMY;
   wire Qb_DUMMY;
   wire Qc_DUMMY;
   wire Qd_DUMMY;
   
   assign Qa = Qa_DUMMY;
   assign Qb = Qb_DUMMY;
   assign Qc = Qc_DUMMY;
   assign Qd = Qd_DUMMY;
   FD #( .INIT(1'b0) ) XLXI_1 (.C(clk), 
              .D(XLXN_8), 
              .Q(Qa_DUMMY));
   FD #( .INIT(1'b0) ) XLXI_2 (.C(clk), 
              .D(XLXN_1), 
              .Q(Qb_DUMMY));
   FD #( .INIT(1'b0) ) XLXI_3 (.C(clk), 
              .D(XLXN_2), 
              .Q(Qc_DUMMY));
   FD #( .INIT(1'b0) ) XLXI_4 (.C(clk), 
              .D(XLXN_3), 
              .Q(Qd_DUMMY));
   XNOR2  XLXI_5 (.I0(XLXN_12), 
                 .I1(Qa_DUMMY), 
                 .O(XLXN_1));
   XNOR2  XLXI_6 (.I0(XLXN_16), 
                 .I1(XLXN_29), 
                 .O(XLXN_2));
   XNOR2  XLXI_7 (.I0(XLXN_19), 
                 .I1(XLXN_28), 
                 .O(XLXN_3));
   NOR2  XLXI_8 (.I0(XLXN_12), 
                .I1(XLXN_8), 
                .O(XLXN_29));
   NOR4  XLXI_10 (.I0(XLXN_19), 
                 .I1(XLXN_16), 
                 .I2(XLXN_12), 
                 .I3(XLXN_8), 
                 .O(Rc));
   INV  XLXI_11 (.I(Qa_DUMMY), 
                .O(XLXN_8));
   INV  XLXI_12 (.I(Qb_DUMMY), 
                .O(XLXN_12));
   INV  XLXI_13 (.I(Qc_DUMMY), 
                .O(XLXN_16));
   INV  XLXI_14 (.I(Qd_DUMMY), 
                .O(XLXN_19));
   NOR3  XLXI_15 (.I0(XLXN_16), 
                 .I1(XLXN_12), 
                 .I2(XLXN_8), 
                 .O(XLXN_28));
endmodule
