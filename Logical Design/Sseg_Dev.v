`timescale 1ns / 1ps

module Sseg_Dev(clk, 
                flash, 
                Hexs, 
                LES, 
                point, 
                rst, 
                Start, 
                seg_clk, 
                seg_clrn, 
                SEG_PEN, 
                seg_sout);

    input clk;
    input flash;
    input [31:0] Hexs;
    input [7:0] LES;
    input [7:0] point;
    input rst;
    input Start;
   output seg_clk;
   output seg_clrn;
   output SEG_PEN;
   output seg_sout;
   
   wire [63:0] XLXN_1;
   
   P2S  XLXI_1 (.clk(clk), 
               .P_Data(XLXN_1[63:0]), 
               .rst(rst), 
               .Serial(Start), 
               .EN(SEG_PEN), 
               .sout(seg_sout), 
               .s_clk(seg_clk), 
               .s_clrn(seg_clrn));
   HexTo8SEG  XLXI_2 (.flash(flash), 
                     .Hexs(Hexs[31:0]), 
                     .LES(LES[7:0]), 
                     .points(point[7:0]), 
                     .SEG_TXT(XLXN_1[63:0]));
endmodule