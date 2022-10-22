`timescale 1ns / 1ps
module MyClock_Top(
	input wire clk,
	output wire [3:0] AN,
	output wire [7:0] SEGMENT,
	output wire seg_clk,
	output wire seg_clrn,
	output wire seg_sout,
	output wire SEG_PEN
    );
	 wire clk_100ms;
	 wire [7:0] displayhour;
	 wire [7:0] displaymin;
	 wire [7:0] displaynumber;

	 wire [23:0] num={displayhour,displaymin,displaynumber};
	 wire [31:0] div;
	 
	clk_100ms c0(.clk(clk), .clk_100ms(clk_100ms));
	clkdiv mc(.clk(clk),.rst(1'b0),.clkdiv(div[31:0]));


	my74LS161 m2  (.CR(1'b1), 
.Ld(~((displayhour[3] & displayhour[0]&
displaymin[6]&displaymin[4] & displaymin[3] & displaymin[0]&
displaynumber[6]&displaynumber[4] & displaynumber[3] & displaynumber[0])
|(displaymin[6]&displaymin[4] & displaymin[3] & displaymin[0]
&displayhour[0]&displayhour[1]&displayhour[5]
&displaynumber[6]&displaynumber[4] & displaynumber[3] & displaynumber[0])
)), 
.CTT(displaymin[6]&displaymin[4] & displaymin[3] & displaymin[0]
&displaynumber[6]&displaynumber[4] & displaynumber[3] & displaynumber[0]), 
.CTP(1'b1), .CP(clk_100ms), .D(4'b0), .Q(displayhour[3:0])); 


	my74LS161 m3(.CR(1'b1), 
	.Ld(~(displaymin[6]&displaymin[4] & displaymin[3] & displaymin[0]&displayhour[0]&displayhour[1]&displayhour[5]&displaynumber[6]&displaynumber[4] & displaynumber[3] & displaynumber[0])), 
.CTT(displayhour[3]&displayhour[0]&displaynumber[6]&displaynumber[4] & displaynumber[3] & displaynumber[0]&displaymin[6]&displaymin[4] & displaymin[3] & displaymin[0]), 
.CTP(1'b1), .CP(clk_100ms), .D(4'b0), .Q(displayhour[7:4]));



	my74LS161 m100  (.CR(1'b1), 
.Ld(~(displaymin[3] & displaymin[0]&displaynumber[6]&displaynumber[4] & displaynumber[3] & displaynumber[0])), //9
.CTT(displaynumber[6]&displaynumber[4] & displaynumber[3] & displaynumber[0]), //59
 .CTP(1'b1), .CP(clk_100ms), .D(4'b0), .Q(displaymin[3:0])); //����


	my74LS161 m200(.CR(1'b1),
	.Ld(~(displaymin[6]&displaymin[4] & displaymin[3] & displaymin[0]
	&displaynumber[6]&displaynumber[4] & displaynumber[3] & displaynumber[0])), 
.CTT(displaymin[3]&displaymin[0]&displaynumber[6]&displaynumber[4] & displaynumber[3] & displaynumber[0]), 
.CTP(1'b1), .CP(clk_100ms), .D(4'b0), .Q(displaymin[7:4]));

	
	my74LS161 m0  (.CR(1'b1), 
.Ld(~(displaynumber[3] & displaynumber[0])), 
.CTT(1'b1), .CTP(1'b1), .CP(clk_100ms), .D(4'b0), .Q(displaynumber[3:0])); //����


	my74LS161 m1(.CR(1'b1), .Ld(~(displaynumber[6]&displaynumber[4] & displaynumber[3] & displaynumber[0])), 
.CTT(displaynumber[3]&displaynumber[0]), 
.CTP(1'b1), .CP(clk_100ms), .D(4'b0), .Q(displaynumber[7:4]));


	disp_num d0(.clk(clk), .HEXS(num[23:8]), .LES(4'b0000), .points(4'b0000), .RST(1'b0), .AN(AN), .Segment(SEGMENT));
	
	Sseg_Dev m7(.clk(clk),.rst(1'b0),.Start(div[20]),
.flash(1),.Hexs({num[23:20],num[19:16],4'h0,num[15:12],num[11:8],4'h0,num[7:4],num[3:0]}),.point(8'b00_1_00_1_00),
.LES(8'b00_1_00_1_00),.seg_clk(seg_clk),.seg_clrn(seg_clrn),
.seg_sout(seg_sout),.SEG_PEN(SEG_PEN));

	

endmodule
