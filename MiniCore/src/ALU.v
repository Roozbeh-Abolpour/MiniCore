`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:25:28 12/18/2018 
// Design Name: 
// Module Name:    ALU 
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
module ALU(clk,A,B,O,act,z);
input clk;
input [31:0] A,B;
input [2:0] act;
output reg [31:0] O=32'd0;
output reg z=1'd0;

always @(*) begin
	if (act==3'b010) begin
		O=A+B;
		if (O==32'd0) begin
			z=1;
		end
		else begin
			z=0;
		end
	end
	else if (act==3'b110) begin
		O=A-B;
		if (O==32'd0) begin
			z=1;
		end
		else begin
			z=0;
		end
	end
	else if (act==3'b000) begin
		O=A&B;
		if (O==32'd0) begin
			z=1;
		end
		else begin
			z=0;
		end
	end
	else if (act==3'b001) begin
		O=A|B;
		if (O==32'd0) begin
			z=1;
		end
		else begin
			z=0;
		end
	end
	else if (act==3'b111) begin
		O=A;
		if (A<B) begin
			z=1;
		end
		else begin
			z=0;
		end
	end
end
endmodule
