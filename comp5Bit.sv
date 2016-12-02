`timescale 1 ps/1 ps

module comp5Bit (a, b, out);

	input logic [4:0] a, b;
	output logic out;
	
	//Logic
	logic [4:0] xorOuts;
	logic lowOr, notOut;
	logic innerAnd, checkX31, outOrs;
	
	xor #50 xor0 (xorOuts[0], a[0], b[0]);
	xor #50 xor1 (xorOuts[1], a[1], b[1]);
	xor #50 xor2 (xorOuts[2], a[2], b[2]);
	xor #50 xor3 (xorOuts[3], a[3], b[3]);
	xor #50 xor4 (xorOuts[4], a[4], b[4]);
	
	or #50 or0 (lowOr, xorOuts[0], xorOuts[1], xorOuts[2]);
	or #50 outOr (notOut, lowOr, xorOuts[3], xorOuts[4]);
	not #50 invertOut (outOrs, notOut);
	
	and #50 innerAndOut (innerAnd, b[0], b[1], b[2]);
	and #50 checkX31And (checkX31, innerAnd, b[3], b[4]);
	
	mux2_1 outMux (.a(1'b0), .b(outOrs), .x(checkX31), .out(out));

endmodule

module comp5BitTestbench ();

	parameter ClockDelay = 10000;

	logic [4:0] a, b; 
	logic out, clk;
	comp5Bit dut (a, b, out);
	
	

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	initial begin
		a <= 5'b01110;
		b <= 5'b00110;	@(posedge clk);
		b <= 5'b01110; @(posedge clk);
		a <= 5'b00000;	@(posedge clk);
		
		$stop;
	end

endmodule
