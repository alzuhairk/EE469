`timescale 1 ps/1 ps
module fastAdder (A, B, cntrl, result, cOut, overflow);
	input logic [63:0] A, B;
	input logic cntrl;
	output logic [63:0] result;
	output logic cOut, overflow;
	logic [63:0] g, p, term;
	logic [64:0] c;
	logic [63:0] bAfterSub, notB;
	
	assign c[0] = cntrl;
	assign cOut = c[64];
	
	genvar i;
	generate
		for (i = 0; i < 64; i++) begin: wiring
		
			not #50 negB (notB[i], B[i]);
			mux2_1 bCtrl (.a(notB[i]), .b(B[i]), .x(cntrl), .out(bAfterSub[i]));
			and #50 gI (g[i], A[i], bAfterSub[i]);
			xor #50 pI (p[i], A[i], bAfterSub[i]);
			and #50 termCalc (term[i], p[i], c[i]);
			or #50 cI (c[i + 1], term[i], g[i]);
			xor #50 out (result[i], A[i], bAfterSub[i], c[i]);
			
		end
	endgenerate

	xor #50 oF (overflow, c[64], c[63]);

endmodule

module fastAdderTestbench();

	parameter ClockDelay = 5000;

	logic [63:0] A, B;
	logic cntrl;
	logic [63:0] result;
	logic cOut, overflow;
	logic clk;
	
	fastAdder dut (.A, .B, .cntrl, .result, .cOut, .overflow);
	
	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
		A <= 64'b0;
		B <= 64'b0;
		cntrl <= 1'b0;					@(posedge clk);
		A <= 64'h0000000000000001;	
		B <= 64'h0000000000000002;	@(posedge clk);
		A <= 64'h097319282773ffff;
		B <= 64'h1111111111111111; @(posedge clk);
		A <= 64'h1111111111111111;
		B <= 64'h097319282773ffff;	@(posedge clk);
		cntrl <= 1'b1;
		A <= 64'h0000000000000001;	
		B <= 64'h0000000000000002;	@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		A <= 64'h097319282773ffff;
		B <= 64'h1111111111111111; @(posedge clk);
		A <= 64'h1111111111111111;
		B <= 64'h097319282773ffff;	@(posedge clk);
			
		$stop;
	end

endmodule
