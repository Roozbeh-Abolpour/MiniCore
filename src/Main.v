`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:10:13 12/18/2018 
// Design Name: 
// Module Name:    Main 
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
module Main(clk,rst);
input clk,rst;
wire [31:0] x0,x1,x2,x3;

wire [31:0] y0,y1,y2,y3,y4;
wire [1:0] y5;
wire [2:0] y6;
wire [3:0] y7;

wire [31:0] v0,v1,v2,v3,v7,v8,v9,v11;
wire [4:0] v4,v5,v6;
wire v10,v14,v16;
wire [1:0] v12,v15;
wire [2:0] v13,v17;

wire [31:0] w0,w1,w2,w4;
wire [4:0] w3;
wire [1:0] w5;
wire w6,w7,w8,w9,w10;
wire [127:0] w11;

wire [31:0] u0,u1,u3;
wire [4:0] u2;
wire u4,u5;

wire hit;

PC g0(.clk(clk),.rst(rst),.PC_in(x0),.PC_out(x1),.hit(hit));
InstructionMem g1(.clk(clk),.rst(rst),.address(x1),.instr(x2),.hit(hit));
IF_ID g2(.clk(clk),.rst(rst),.npc(x3),.instr(x2),.npcout(y2),.instrout(y0),.hit(hit));
Mux #(.N(32))g3(.c(w10),.A(x3),.B(w0),.O(x0));
Adder g4(.A(x1),.S(x3));


Registers g5(.rs(y0[25:21]),.rt(y0[20:16]),.rd(u2),.writedata(u3),.write_reg(u5),.readdat1(y3),.readdat2(y4),.clk(clk),.rst(rst));
SignExtender g6(.A(y0[15:0]),.B(y1));
ControlUnit g7(.clk(clk),.I(y0),.WB(y5),.M(y6),.EX(y7));
ID_EX g8(.clk(clk),.rst(rst),.WB(y5),.M(y6),.EX(y7),		
		.npc(y2),.readdat1(y3),.readdat2(y4),.signext(y1),.instr_2016(y0[20:16]),.instr_1511(y0[15:11]),
		.WBout(v12),.Mout(v13),.EXout({v14,v15,v16}),		
		.npcout(v0),.readdat1out(v1),.readdat2out(v2),.signextout(v3),.instr_2016out(v4),.instr_1511out(v5),.hit(hit));


ShiftLeft g9(.A(v3),.B(v8));
AdderEx g10(.A(v0),.B(v8),.C(v11));
Mux #(.N(32))g11(.c(v16),.A(v2),.B(v3),.O(v7));
Mux #(.N(5))g12(.c(v14),.A(v4),.B(v5),.O(v6));
ALUControl g13(.clk(clk),.aluop(v15),.func(v3[5:0]),.select(v17));
ALU g14(.clk(clk),.A(v1),.B(v7),.O(v9),.act(v17),.z(v10));
EX_MEM g15(.clk(clk),.rst(rst),.WB(v12),.M(v13),    
	 .adder(v11),.aluzero(v10),.alu(v9),.readdat2(v2),.vmux(v6),
	 .WBout(w5),.Mout({w6,w7,w8}),	 
	 .adderout(w0),.aluzeroout(w9),.aluout(w1),.readdat2out(w2),.vmuxout(w3),.hit(hit));



assign w10=w6&w9;
DataMem g16(.A(w1),.D(w2),.mr(w7),.mw(w8),.clk(clk),.O(w11));
Cache g17(.A(w1),.D(w11),.O(w4),.hit(hit),.mr(w7),.mw(w8),.clk(clk),.rst(rst));
MEM_WB g18(.clk(clk),.rst(rst),.WB(w5),
		.read_data(w4),.alu_result(w1),.write_reg(w3),
		.WBout({u4,u5}),.read_dataout(u0),.alu_resultout(u1),.write_regout(u2),.hit(hit));
Mux #(.N(32))g19(.c(u4),.A(u1),.B(u0),.O(u3));


endmodule
