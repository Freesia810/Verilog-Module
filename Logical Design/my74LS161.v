`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:03:00 11/05/2021 
// Design Name: 
// Module Name:    my74LS161 
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
module my74LS161(
	input wire [3:0]D,
	input wire CP,
	input wire CR,
	input wire Ld,
	input wire CTT,
	input wire CTP,
	output reg [3:0]Q,
	output wire Co
    );
	always @(posedge CP or negedge CR)
		begin
			if(~CR) begin
				Q<=4'b0000;
			end
			else begin
				if(~Ld)begin
					Q<=D;
				end
				else begin
					if(CTT&CTP)begin
						Q <= Q+1'b1;
					end
				end
			end
		end
	assign Co = CTT&Q[3]&Q[2]&Q[1]&Q[0];
endmodule
