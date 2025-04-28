`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:15:04 12/18/2018 
// Design Name: 
// Module Name:    MEM_WB 
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
module MEM_WB(
		clk,rst,
		WB,
		read_data,alu_result,write_reg,
		WBout,
		read_dataout,alu_resultout,write_regout,		
		hit);
input clk,rst,hit;
input [1:0] WB;
input [31:0] read_data;
input [31:0] alu_result;
input [4:0] write_reg;

output reg [1:0] WBout=2'd0;
output reg [31:0] read_dataout=32'd0;
output reg [31:0] alu_resultout=32'd0;
output reg [4:0] write_regout=5'd0;

reg count=1'b0;
always @(posedge clk) begin
	if (rst) begin
		{WBout,read_dataout,alu_resultout,write_regout}<={WB,read_data,alu_result,write_reg};
	end
	else if (hit==1&&count==1'b0) begin
		{WBout,read_dataout,alu_resultout,write_regout}<={WB,read_data,alu_result,write_reg};		
	end
	//count<=!count;
end

endmodule
