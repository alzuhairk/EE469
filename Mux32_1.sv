module Mux32_1 (in[31:0], x[4:0], out)
	input logic[31:0] in;
	input logic[4:0] x;
	output logic out;
	
	Mux16_1 m1 (.in(in[31:16]), .x(x[3:0]), .out(temp[1]));
	Mux16_1 m2 (.in(in[15:0]), .x(x[3:0]), .out(temp[0]));
	Mux2_1 m3 (.a(temp[1]), .b(temp[0]), .x(x[4]), .out(out));

endmodule

module Mux16_1 (in[15:0], x[3:0], out)
	input logic[15:0] in;
	input logic[3:0] x;
	output logic out;
	logic[1:0] temp;

	Mux8_1 m1 (.in(in[15:8]), .x(x[2:0]), .out(temp[1]));
	Mux8_1 m2 (.in(in[7:0]), .x(x[2:0]), .out(temp[0]));
	Mux2_1 m3 (.a(temp[1]), .b(temp[0]), .x(x[3]), .out(out));
endmodule

module Mux8_1 (in[7:0], x[2:0], out)
	input logic[7:0] in;
	input logic[2:0] x;
	output logic out;
	logic[1:0] temp;

	Mux4_1 m1 (.in(in[7:4]), .x(x[1:0]), .out(temp[1]));
	Mux4_1 m2 (.in(in[3:0]), .x(x[1:0]), .out(temp[0]));
	Mux2_1 m3 (.a(temp[1]), .b(temp[0]), .x(x[2]), .out(out));

endmodule

module Mux4_1 (in[3:0], x[1:0], out)
	input logic[3:0] in;
	input logic[1:0] x;
	output logic out;
	logic[1:0] temp;
	
	Mux2_1 m1 (.a(in[3]), .b(in[2]), .x(x[0]), .out(temp[1]));
	Mux2_1 m2 (.a(in[1]), .b(in[0]), .x(x[0]), .out(temp[0]));
	Mux2_1 m3 (.a(temp[1]), .b(temp[0]), .x(x[1]), .out(out));

endmodule
