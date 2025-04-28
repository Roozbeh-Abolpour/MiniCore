`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:14:44 12/18/2018 
// Design Name: 
// Module Name:    EX_MEM 
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
module EX_MEM(
	 clk,rst,WB,M,    
	 adder,aluzero,alu,readdat2,vmux,
	 WBout,Mout,	 
	 adderout,aluzeroout,aluout,readdat2out,vmuxout,	 
	 hit);

input clk,rst,hit;
input [1:0] WB;
input [2:0] M;
input [31:0] adder;
input aluzero;
input [31:0] alu;
input [31:0] readdat2;
input [4:0] vmux;

output reg [1:0] WBout=2'd0;
output reg [2:0] Mout=3'd0;
output reg [31:0] adderout=32'd0;
output reg aluzeroout=1'd0;
output reg [31:0] aluout=32'd0;
output reg [31:0] readdat2out=32'd0;
output reg [4:0] vmuxout=5'd0;


always @(posedge clk) begin
	if (rst) begin
		{WBout,Mout,adderout,aluzeroout,aluout,readdat2out,vmuxout}<={WB,M,adder,aluzero,alu,readdat2,vmux};
	end
	else if (hit==1)begin
		{WBout,Mout,adderout,aluzeroout,aluout,readdat2out,vmuxout}<={WB,M,adder,aluzero,alu,readdat2,vmux};
	end
end

endmodule
