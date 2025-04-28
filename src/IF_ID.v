`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:13:01 12/18/2018 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID(clk,rst,npc,instr,npcout,instrout,hit);
input [31:0] npc;
input [31:0] instr;
input clk,rst,hit;
output reg [31:0] npcout;
output reg [31:0] instrout;
reg [1:0] count=2'b01;
initial begin
	npcout=32'd0;
	instrout=32'd0;
end
always @(posedge clk) begin
	if (rst) begin
		npcout<=32'd0;
		instrout<=32'd0;
	end
	else if (hit==1'b1&&count==2'b01) begin
		npcout<=npc;
		instrout<=instr;		
		count<=2'b01;
	end
	//count<=1+count;
end
endmodule
