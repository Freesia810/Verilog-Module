`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:03 11/03/2021 
// Design Name: 
// Module Name:    top 
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
module top(
	input wire clk,
	input wire [15:0]SW,
	input wire [3:0]BTN_Y,
	output wire BTN_X,
	output wire [3:0]AN,
	output wire [7:0]SEGMENT);
	wire [3:0] btn_out;
	reg [15:0] num;
	wire [3:0]C;
	wire [31:0] clk_div;
	wire [3:0]A1;
	wire [3:0]B1;
	wire [3:0]A2;
	wire [3:0]B2;
	wire [3:0]C2;
	wire [3:0]Result;
	wire Co;
	assign BTN_X=0;
	
	clkdiv mc1(clk,0,clk_div);	
	
	pbdebounce m0(clk_div[17],BTN_Y[0],btn_out[0]);
   pbdebounce m1(clk_div[17],BTN_Y[1],btn_out[1]);
	pbdebounce m2(clk_div[17],BTN_Y[2],btn_out[2]);
	pbdebounce m3(clk_div[17],BTN_Y[3],btn_out[3]);
	
	AddSub4b m4(.A(num[3:0]),.B(4'b0001),.Ctrl(SW[0]),.S(A1));
	AddSub4b m5(.A(num[7:4]),.B(4'b0001),.Ctrl(SW[1]),.S(B1));
	Mux4to1b4 m6(.I0(num[3:0]),.I1(num[7:4]),.I2(num[11:8]),
                    .I3(4'b0),.s(SW[8:7]),.o(Result[3:0]));

	assign A2 = (SW[15]==1'b0)?A1:Result;
	assign B2 = (SW[15]==1'b0)?B1:Result;
	assign C2 = (SW[15]==1'b0)?C:Result;
	always@(posedge btn_out[0]) begin
		num[3:0] = A2;
	end
	always@(posedge btn_out[1]) begin
		num[7:4] = B2;
	end
	always@(posedge btn_out[2])begin
		num[11:8] = C2;
	end
	
	
	ALU m7(.A(num[3:0]),.B(num[7:4]),.S(SW[6:5]),.C(C),.Co(Co));
	
	disp_num m8(.clk(clk), .HEXS({num[3:0],num[7:4],C,num[11:8]}), .LES(4'b0000), .points(4'b0000), 
                         .RST(1'b0), .AN(AN), .Segment(SEGMENT));
endmodule
