`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:11:16 12/18/2018 
// Design Name: 
// Module Name:    PC 
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
module PC(clk,rst,PC_in,PC_out,hit);
input clk,rst,hit;
input [31:0] PC_in;
output reg [31:0] PC_out=32'd0;
always @(posedge clk) begin
	if (rst) begin
		PC_out<=32'd0;
	end
	else if (hit==1'b1) begin
		PC_out<=PC_in;
	end
end
endmodule
