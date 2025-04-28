`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:14:00 12/18/2018 
// Design Name: 
// Module Name:    ID_EX 
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
module ID_EX(clk,rst,WB,M,EX,		
		npc,readdat1,readdat2,signext,instr_2016,instr_1511,
		WBout,Mout,EXout,		
		npcout,readdat1out,readdat2out,signextout,instr_2016out,instr_1511out		
		,hit);
input clk,rst,hit;
input [1:0] WB;
input [2:0] M;
input [3:0] EX;
input [31:0] npc;
input [31:0] readdat1;
input [31:0] readdat2;
input [31:0] signext;
input [4:0] instr_2016;
input [4:0] instr_1511;

output reg [1:0] WBout=2'd0;
output reg [2:0] Mout=3'd0;
output reg [3:0] EXout=4'd0;
output reg [31:0] npcout=32'd0;
output reg [31:0] readdat1out=32'd0;
output reg [31:0] readdat2out=32'd0;
output reg [31:0] signextout=32'd0;
output reg [4:0] instr_2016out=5'd0;
output reg [4:0] instr_1511out=5'd0;
reg count=1'b0;
always @(posedge clk) begin
	if (rst) begin
		{WBout,Mout,EXout,npcout,readdat1out,readdat2out,signextout,instr_2016out,instr_1511out}<={WB,M,EX,npc,readdat1,readdat2,signext,instr_2016,instr_1511};
	end
	else if (hit==1'b1&&count==1'b0) begin
		{WBout,Mout,EXout,npcout,readdat1out,readdat2out,signextout,instr_2016out,instr_1511out}<={WB,M,EX,npc,readdat1,readdat2,signext,instr_2016,instr_1511};		
	end
	//count<=!count;
end
endmodule
