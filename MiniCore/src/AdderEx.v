`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:06:50 12/18/2018 
// Design Name: 
// Module Name:    AdderEx 
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
module AdderEx(A,B,C);
input [31:0] A,B;
output [31:0] C;
assign C=A+B;

endmodule
