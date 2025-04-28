`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:22 12/18/2018 
// Design Name: 
// Module Name:    InstructionMem 
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
module InstructionMem(clk,rst,address,instr,hit);
input clk,rst,hit;
input [31:0] address;
output reg [31:0] instr=32'd0;
reg [31:0] mem [199:0];
initial begin
	$readmemh("codes.hex",mem);
end
wire [31:0] addr=address>>2;
integer i=0;
always @(posedge clk) begin
	if (rst) begin
		for (i=0;i<200;i=i+1) begin
			mem[i]<=32'd0;
		end
	end
	else if (hit==1'b1) begin
		instr<=mem[addr];
	end
end


endmodule
