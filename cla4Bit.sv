/*	Single 4-bit unit for ALU using CLA
	000 > result = bO
	010 > result = A + bO
	011 > result = A - bO
	100 > result = bitwise A & bO
	101 > result = bitwise A | bO
	110 > result = bitwise A XOR bO
*/

`timescale 1 ps/ 1 ps	


module cla4Bit (a, b, cIn, cOut, ctrl, result);

	input logic [3:0] a, b;
	input logic cIn;
	input logic ctrl;
	
	output logic cOut;
	output logic [3:0] result;
	
	// Set up for subtraction
	logic [3:0] bO;
	logic [3:0] notB;
	
	not #50 setNotB0 (notB[0], b[0]);
	not #50 setNotB1 (notB[1], b[1]);
	not #50 setNotB2 (notB[2], b[2]);
	not #50 setNotB3 (notB[3], b[3]);
	
	mux2_1 b0 (.a(notB[0]), .b(b[0]), .x(ctrl), .out(bO[0]));
	mux2_1 b1 (.a(notB[1]), .b(b[1]), .x(ctrl), .out(bO[1]));
	mux2_1 b2 (.a(notB[2]), .b(b[2]), .x(ctrl), .out(bO[2]));
	mux2_1 b3 (.a(notB[3]), .b(b[3]), .x(ctrl), .out(bO[3]));
	
	// CLA variables. G for generate, p for propogate, c for carry
	logic [3:0] g, p, c;
	logic c1Term, cOutTerm;
	logic [1:0] c2Term;
	logic [2:0] c3Term;
	
	// Setup c
	buf #50 setC0 (c[0], cIn);										// c_0 = g_-1
	
	and #50 term1C1 (c1Term, cIn, p[0]);						// c_1 = g_-1&p_0 | g_0
	or #50 setC1 (c[1], c1Term, g[0]);		
	
	and #50 term1c2 (c2Term[1], cIn, p[0], p[1]);			// c_2 = g_-1&p_0&p_1 | g_0&p_1 | g_1
	and #50 term2c2 (c2Term[0], g[0], p[1]);
	or #50 setC2 (c[2], c2Term[1], c2Term[0], g[1]);
	
	and #50 term1c3 (c3Term[2], cIn, p[0], p[1], p[2]);	// c_3 = g_-1&p_0&p_1&p_2 | g_0&p_1&p_2 | g_1&p_2 | g_2
	and #50 term2c3 (c3Term[1], g[0], p[1], p[2]);
	and #50 term3c3 (c3Term[0], g[1], p[2]);
	or #50 setC3 (c[3], c3Term[2], c3Term[1], c3Term[0], g[2]);
	
	// Setup p and g
	or #50 setP0 (p[0], a[0], bO[0]);
	or #50 setP1 (p[1], a[1], bO[1]);
	or #50 setP2 (p[2], a[2], bO[2]);
	or #50 setP3 (p[3], a[3], bO[3]);
	
	and #50 setG0 (g[0], a[0], bO[0]);
	and #50 setG1 (g[1], a[1], bO[1]);
	and #50 setG2 (g[2], a[2], bO[2]);
	and #50 setG3 (g[3], a[3], bO[3]);
	
	// Setup result and cOut
	xor #50 setResult0 (result[0], a[0], bO[0], c[0]);
	xor #50 setResult1 (result[1], a[1], bO[1], c[1]);
	xor #50 setResult2 (result[2], a[2], bO[2], c[2]);
	xor #50 setResult3 (result[3], a[3], bO[3], c[3]);
	
	and #50 termCOut (cOutTerm, p[3], c[3]);
	or #50 setCOut(cOut, cOutTerm, g[3]);
		
endmodule


// Testbench
module cla4BitTestbench();
	parameter ClockDelay = 5000;

	logic [3:0] a, b;
	logic cIn, cOut, clk;
	logic ctrl;
	
	logic [3:0] result;
	
	cla4Bit dut (a, b, cIn, cOut, ctrl, result);
	
	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
		a <= 4'b0011;
		b <= 4'b1001;
		ctrl <= 1'b0;
		cIn <= 1'b0;		@(posedge clk);
								@(posedge clk);
		b <= 4'b1011;		@(posedge clk);
								@(posedge clk);
		b <= 4'b0011;
		ctrl <= 1'b1;
		cIn <= 1'b1;		@(posedge clk);
								@(posedge clk);
		b <= 4'b0001;		@(posedge clk);
								@(posedge clk);
		
		$stop;
	end

endmodule

















