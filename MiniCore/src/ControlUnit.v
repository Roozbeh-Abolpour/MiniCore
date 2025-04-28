`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:37:02 12/18/2018 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(clk,I,WB,M,EX);
input [31:0] I;
input clk;
output reg [1:0] WB=2'd0;
output reg [2:0] M=3'd0;
output reg [3:0] EX=4'd0;
wire [5:0] opcode=I[31:26];
always @(*) begin
	if (opcode==6'b000000) begin
		WB=2'b10;
		M=3'b000;
		EX=4'b1100;
	end
	else if (opcode==6'b100011) begin
		WB=2'b11;
		M=3'b010;
		EX=4'b0001;
	end
	else if (opcode==6'b101011) begin
		WB=2'bx0;
		M=3'b001;
		EX=4'bx001;
	end
	else if (opcode==6'b000100) begin
		WB=2'bx0;
		M=3'b100;
		EX=4'bx010;
	end
end
endmodule
