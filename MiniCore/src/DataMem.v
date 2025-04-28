`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:48:10 12/18/2018 
// Design Name: 
// Module Name:    DataMem 
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
module DataMem(A,D,mr,mw,clk,O);
input clk,mr,mw;
input [31:0] A;
input [31:0] D;
output reg [127:0] O=128'd0;
reg [31:0] ram [199:0];
integer i;
initial begin
	$readmemh("datas.hex",ram);
end
wire [31:0] addr=A>>4;
reg [1:0] count=2'b00;
always @(posedge clk) begin
	if (mw==1'b1) begin
		ram[A]<=D;
		O<=128'd0;
	end
	if (mr==1'b1&&count==2'b10) begin
		O<={ram[addr+3],ram[addr+2],ram[addr+1],ram[addr]};
		count<=2'b00;
	end
	count<=count+1;
end
endmodule
