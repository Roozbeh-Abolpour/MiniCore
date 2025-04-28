`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:47 12/18/2018 
// Design Name: 
// Module Name:    Registers 
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
module Registers(rs,rt,rd,writedata,write_reg,readdat1,readdat2,clk,rst);
input [4:0] rs,rt,rd;
input [31:0] writedata;
input write_reg,clk,rst;
output reg [31:0] readdat1=32'd0;
output reg [31:0] readdat2=32'd0;
reg [31:0] rgs [31:0];
integer i=0;
initial begin
	for (i=0;i<32;i=i+1) begin
		rgs[i]=32'd0;
	end
end
always @(posedge clk) begin
	if (!rst) begin
	   if (write_reg==1'b0) begin
			readdat1<=rgs[rs];
			readdat2<=rgs[rt];
		end
		else begin
			rgs[rd]<=writedata;	
			readdat1<=rgs[rs];
			readdat2<=rgs[rt];			
		end
	end
	else begin
		for (i=0;i<16;i=i+1) begin
			rgs[i]<=32'd0;
		end
	end	
end

endmodule
