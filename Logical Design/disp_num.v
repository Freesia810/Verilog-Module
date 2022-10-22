`timescale 1ns / 1ps

module DisplaySync_MUSER_disp_num(Hexs, 
                                  LES, 
                                  point, 
                                  Scan, 
                                  AN, 
                                  HEX, 
                                  LE, 
                                  p);

    input [15:0] Hexs;
    input [3:0] LES;
    input [3:0] point;
    input [1:0] Scan;
   output [3:0] AN;
   output [3:0] HEX;
   output LE;
   output p;
   
   wire V0;
   wire V1;
   
   Mux4to1b4  XLXI_1 (.I0(Hexs[3:0]), 
                     .I1(Hexs[7:4]), 
                     .I2(Hexs[11:8]), 
                     .I3(Hexs[15:12]), 
                     .s(Scan[1:0]), 
                     .o(HEX[3:0]));
   Mux4to1  XLXI_2 (.I0(point[0]), 
                   .I1(point[1]), 
                   .I2(point[2]), 
                   .I3(point[3]), 
                   .S(Scan[1:0]), 
                   .o(p));
   Mux4to1  XLXI_3 (.I0(LES[0]), 
                   .I1(LES[1]), 
                   .I2(LES[2]), 
                   .I3(LES[3]), 
                   .S(Scan[1:0]), 
                   .o(LE));
   VCC  XLXI_4 (.P(V1));
   GND  XLXI_5 (.G(V0));
   Mux4to1b4  XLXI_6 (.I0({V1, V1, V0, V1}), 
                     .I1({V1, V1, V1, V0}), 
                     .I2({V1, V0, V1, V1}), 
                     .I3({V0, V1, V1, V1}), 
                     .s(Scan[1:0]), 
                     .o(AN[3:0]));
endmodule
`timescale 1ns / 1ps

module disp_num(clk, 
                HEXS, 
                LES, 
                points, 
                RST, 
                AN, 
                Segment);

    input clk;
    input [15:0] HEXS;
    input [3:0] LES;
    input [3:0] points;
    input RST;
   output [3:0] AN;
   output [7:0] Segment;
   
   wire [31:0] clkd;
   wire [3:0] HEX;
   wire XLXN_1;
   wire XLXN_2;
   
   DisplaySync_MUSER_disp_num  XLXI_1 (.Hexs(HEXS[15:0]), 
                                      .LES(LES[3:0]), 
                                      .point(points[3:0]), 
                                      .Scan(clkd[18:17]), 
                                      .AN(AN[3:0]), 
                                      .HEX(HEX[3:0]), 
                                      .LE(XLXN_1), 
                                      .p(XLXN_2));
   MC14495  XLXI_2 (.D0(HEX[0]), 
                     .D1(HEX[1]), 
                     .D2(HEX[2]), 
                     .D3(HEX[3]), 
                     .LE(XLXN_1), 
                     .point(XLXN_2), 
                     .a(Segment[0]), 
                     .b(Segment[1]), 
                     .c(Segment[2]), 
                     .d(Segment[3]), 
                     .e(Segment[4]), 
                     .f(Segment[5]), 
                     .g(Segment[6]), 
                     .p(Segment[7]));
   clkdiv  XLXI_3 (.clk(clk), 
                  .rst(RST), 
                  .clkdiv(clkd[31:0]));
endmodule

