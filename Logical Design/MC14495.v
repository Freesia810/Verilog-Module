`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:10:46 11/03/2021 
// Design Name: 
// Module Name:    MC14495 
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
module MC14495(D0, 
                 D1, 
                 D2, 
                 D3, 
                 LE, 
                 point, 
                 a, 
                 b, 
                 c, 
                 d, 
                 e, 
                 f, 
                 g, 
                 p);

    input D0;
    input D1;
    input D2;
    input D3;
    input LE;
    input point;
   output a;
   output b;
   output c;
   output d;
   output e;
   output f;
   output g;
   output p;
   
   wire ND1;
   wire ND2;
   wire ND3;
   wire XLXN_2;
   wire XLXN_3;
   wire XLXN_9;
   wire XLXN_11;
   wire XLXN_12;
   wire XLXN_13;
   wire XLXN_14;
   wire XLXN_15;
   wire XLXN_17;
   wire XLXN_18;
   wire XLXN_20;
   wire XLXN_21;
   wire XLXN_22;
   wire XLXN_24;
   wire XLXN_25;
   wire XLXN_26;
   wire XLXN_27;
   wire XLXN_29;
   wire XLXN_30;
   wire XLXN_31;
   wire XLXN_32;
   wire XLXN_34;
   wire XLXN_35;
   wire XLXN_36;
   wire XLXN_37;
   wire XLXN_38;
   wire XLXN_39;
   wire XLXN_40;
   wire XLXN_82;
   
   AND4  AD0 (.I0(XLXN_82), 
             .I1(ND1), 
             .I2(D2), 
             .I3(D3), 
             .O(XLXN_9));
   AND4  AD1 (.I0(D0), 
             .I1(D1), 
             .I2(D2), 
             .I3(ND3), 
             .O(XLXN_2));
   AND3  AD2 (.I0(ND1), 
             .I1(ND2), 
             .I2(ND3), 
             .O(XLXN_3));
   AND3  AD3 (.I0(D0), 
             .I1(D1), 
             .I2(ND3), 
             .O(XLXN_14));
   AND3  AD4 (.I0(D1), 
             .I1(ND2), 
             .I2(ND3), 
             .O(XLXN_11));
   AND3  AD5 (.I0(D0), 
             .I1(ND2), 
             .I2(ND3), 
             .O(XLXN_12));
   AND3  AD6 (.I0(D0), 
             .I1(ND1), 
             .I2(ND2), 
             .O(XLXN_18));
   AND3  AD7 (.I0(ND1), 
             .I1(D2), 
             .I2(ND3), 
             .O(XLXN_15));
   AND2  AD8 (.I0(D0), 
             .I1(ND3), 
             .O(XLXN_17));
   AND4  AD9 (.I0(XLXN_82), 
             .I1(D1), 
             .I2(ND2), 
             .I3(D3), 
             .O(XLXN_24));
   AND3  AD10 (.I0(D0), 
              .I1(D1), 
              .I2(D2), 
              .O(XLXN_20));
   AND3  AD11 (.I0(D1), 
              .I1(D2), 
              .I2(D3), 
              .O(XLXN_25));
   AND4  AD12 (.I0(XLXN_82), 
              .I1(D1), 
              .I2(ND2), 
              .I3(ND3), 
              .O(XLXN_26));
   AND3  AD13 (.I0(D0), 
              .I1(D1), 
              .I2(D3), 
              .O(XLXN_31));
   AND3  AD14 (.I0(XLXN_82), 
              .I1(D2), 
              .I2(D3), 
              .O(XLXN_27));
   AND3  AD15 (.I0(XLXN_82), 
              .I1(D1), 
              .I2(D2), 
              .O(XLXN_29));
   AND4  AD16 (.I0(D0), 
              .I1(ND1), 
              .I2(D2), 
              .I3(ND3), 
              .O(XLXN_30));
   AND4  AD17 (.I0(D0), 
              .I1(D1), 
              .I2(ND2), 
              .I3(D3), 
              .O(XLXN_32));
   AND4  AD18 (.I0(D0), 
              .I1(ND1), 
              .I2(D2), 
              .I3(D3), 
              .O(XLXN_13));
   AND4  AD19 (.I0(XLXN_82), 
              .I1(ND1), 
              .I2(D2), 
              .I3(ND3), 
              .O(XLXN_21));
   AND4  AD20 (.I0(D0), 
              .I1(ND2), 
              .I2(ND1), 
              .I3(ND3), 
              .O(XLXN_22));
   OR3  XLXI_23 (.I0(XLXN_9), 
                .I1(XLXN_2), 
                .I2(XLXN_3), 
                .O(XLXN_40));
   OR4  XLXI_24 (.I0(XLXN_14), 
                .I1(XLXN_11), 
                .I2(XLXN_12), 
                .I3(XLXN_13), 
                .O(XLXN_39));
   OR3  XLXI_25 (.I0(XLXN_18), 
                .I1(XLXN_15), 
                .I2(XLXN_17), 
                .O(XLXN_38));
   OR4  XLXI_26 (.I0(XLXN_24), 
                .I1(XLXN_20), 
                .I2(XLXN_21), 
                .I3(XLXN_22), 
                .O(XLXN_37));
   OR3  XLXI_27 (.I0(XLXN_25), 
                .I1(XLXN_26), 
                .I2(XLXN_27), 
                .O(XLXN_36));
   OR4  XLXI_28 (.I0(XLXN_31), 
                .I1(XLXN_27), 
                .I2(XLXN_29), 
                .I3(XLXN_30), 
                .O(XLXN_35));
   OR4  XLXI_29 (.I0(XLXN_32), 
                .I1(XLXN_13), 
                .I2(XLXN_21), 
                .I3(XLXN_22), 
                .O(XLXN_34));
   OR2  XLXI_30 (.I0(LE), 
                .I1(XLXN_40), 
                .O(g));
   OR2  XLXI_31 (.I0(LE), 
                .I1(XLXN_39), 
                .O(f));
   OR2  XLXI_32 (.I0(LE), 
                .I1(XLXN_38), 
                .O(e));
   OR2  XLXI_33 (.I0(LE), 
                .I1(XLXN_37), 
                .O(d));
   OR2  XLXI_34 (.I0(LE), 
                .I1(XLXN_36), 
                .O(c));
   OR2  XLXI_35 (.I0(LE), 
                .I1(XLXN_35), 
                .O(b));
   OR2  XLXI_36 (.I0(LE), 
                .I1(XLXN_34), 
                .O(a));
   INV  XLXI_37 (.I(point), 
                .O(p));
   INV  XLXI_38 (.I(D3), 
                .O(ND3));
   INV  XLXI_39 (.I(D2), 
                .O(ND2));
   INV  XLXI_40 (.I(D1), 
                .O(ND1));
   INV  XLXI_41 (.I(D0), 
                .O(XLXN_82));
endmodule
