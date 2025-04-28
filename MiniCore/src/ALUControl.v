`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:17:17 12/18/2018 
// Design Name: 
// Module Name:    ALUControl 
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
module ALUControl(clk,aluop,func,select);
input clk;
input [1:0] aluop;
input [5:0] func;
output reg [2:0] select=3'd0;
always @(*) begin
	if (aluop==2'b00) begin
		select=3'b010;		
	end
	else if (aluop==2'b01) begin
		select=3'b110;		
	end
	else if (aluop==2'b10&&func==6'b100000) begin
		select=3'b010;
	end
	else if (aluop==2'b10&&func==6'b100010) begin
		select=3'b110;
	end
	else if (aluop==2'b10&&func==6'b100100) begin
		select=3'b000;
	end
	else if (aluop==2'b10&&func==6'b100101) begin
		select=3'b001;
	end
	else if (aluop==2'b10&&func==6'b101010) begin
		select=3'b111;
	end
	
end
endmodule
