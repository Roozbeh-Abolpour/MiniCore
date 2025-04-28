`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:50:39 12/18/2018 
// Design Name: 
// Module Name:    Cache 
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
module Cache(A,D,O,hit,mr,mw,clk,rst);
input mr,mw,rst,clk;

output reg hit=1'b1;
output reg [31:0] O=32'd0;
input [31:0] A;
input [127:0] D;
reg [154:0] ram [3:0];
initial begin
	ram[0]=155'd0;
	ram[1]=155'd0;
	ram[2]=155'd0;
	ram[3]=155'd0;
end


wire [1:0] set=A[5:4];
wire [25:0] tag=A[31:6];
reg [1:0] count=2'b00;

always @(posedge clk) begin
	if (mw==1'b1) begin
		if (ram[set][154:129]==tag&&ram[set][0]==1'b1) begin
			hit<=1'b1;
			O<=32'd0;
			ram[set][128:1]<=D;
		end
		else begin
			hit<=0;
			O<=32'd0;
		end
	end
	else if (mr==1'b1) begin
		if (ram[set][154:129]==tag&&ram[set][0]==1'b1) begin
			hit<=1'b1;
			case (A[3:2])
				2'b11: O<=ram[set][128:97];
				2'b10: O<=ram[set][96:65];
				2'b01: O<=ram[set][64:33];
				2'b00: O<=ram[set][32:1];
			endcase					
		end
		else begin
			hit<=0;				
			if (count==2'b11) begin
				count<=2'b00;
				ram[set][0]<=1'b1;
				ram[set][154:129]<=tag;
				ram[set][128:1]<=D;				
				hit<=1;
				case (A[3:2])
					2'b11: O<=D[127:96];
					2'b10: O<=D[95:64];
					2'b01: O<=D[63:32];
					2'b00: O<=D[31:0];
				endcase	
			end
			else begin
				count<=count+1;
			end
		end
	end
	else begin
		hit<=1'b1;
	end
end
endmodule
