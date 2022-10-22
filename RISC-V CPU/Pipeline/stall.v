`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/01 16:23:15
// Design Name: 
// Module Name: stall
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module stall(
    input rst_stall,
    input RegWrite_out_IDEX,
    input[4:0] Rd_addr_out_IDEX,
    input RegWrite_out_EXMem,
    input[4:0] Rd_addr_out_EXMem,
    input[4:0] Rs1_addr_ID,
    input[4:0] Rs2_addr_ID,
    input Rs1_used,
    input Rs2_used,
    input Branch_ID,
    input BranchN_ID,
    input Jump_ID,
    input Branch_out_IDEX,
    input BranchN_out_IDEX,
    input Jump_out_IDEX,
    input Branch_out_EXMem,
    input BranchN_out_EXMem,
    input Jump_out_EXMem,
    output reg en_IF,
    output reg en_IFID,
    output reg NOP_IFID,
    output reg NOP_IDEx
    );
    
    
    
    always@(*)
    begin
        if((RegWrite_out_IDEX&Rs1_used)&&(Rs1_addr_ID!=5'b00000)&&(Rs1_addr_ID==Rd_addr_out_IDEX))
        begin
            {en_IF,en_IFID,NOP_IDEx} = 3'b001;
        end
        else if((RegWrite_out_IDEX&Rs2_used)&&(Rs2_addr_ID!=5'b00000)&&(Rs2_addr_ID==Rd_addr_out_IDEX))
        begin
            {en_IF,en_IFID,NOP_IDEx} = 3'b001;
        end
        else begin
            {en_IF,en_IFID,NOP_IDEx} = 3'b110;
        end
        
        if((Branch_ID|BranchN_ID|Jump_ID)|(Branch_out_IDEX|BranchN_out_IDEX|Jump_out_IDEX)|(Branch_out_EXMem|BranchN_out_EXMem|Jump_out_EXMem))
        begin
            NOP_IFID = 1'b1;
        end
        else begin
            NOP_IFID = 1'b0;
        end
        
    end
endmodule
