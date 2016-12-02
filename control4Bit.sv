`timescale 1 ps/ 1 ps	

module control4Bit (a, b, cIn, cOut, ctrl, result);
	input logic [3:0] a, b;
	input logic [2:0] ctrl;
	input logic cIn;
	
	output logic [3:0] result;
	output logic cOut;
	
	// Possible outputs
	logic [3:0] outputAnd, outputOr, outputXor, outputAlg;
	
	// Setup outputs
	cla4Bit cla (.a, .b, .cIn, .cOut, .ctrl(ctrl[0]), .result(outputAlg));
	
	and #50 and0 (outputAnd[0], a[0], b[0]);
	and #50 and1 (outputAnd[1], a[1], b[1]);
	and #50 and2 (outputAnd[2], a[2], b[2]);
	and #50 and3 (outputAnd[3], a[3], b[3]);
	
	or #50 or0 (outputOr[0], a[0], b[0]);
	or #50 or1 (outputOr[1], a[1], b[1]);
	or #50 or2 (outputOr[2], a[2], b[2]);
	or #50 or3 (outputOr[3], a[3], b[3]);
	
	xor #50 xor0 (outputXor[0], a[0], b[0]);
	xor #50 xor1 (outputXor[1], a[1], b[1]);
	xor #50 xor2 (outputXor[2], a[2], b[2]);
	xor #50 xor3 (outputXor[3], a[3], b[3]);
	
	genvar i;
	generate
		for (i = 0; i < 4; i++) begin: makeMuxes
	
			mux8_1 m (.in({1'bx, outputXor[i], outputOr[i], outputAnd[i], outputAlg[i], outputAlg[i], 1'bx, b[i]}), .x(ctrl), .out(result[i]));
	
		end
	endgenerate
	
endmodule

// Testbench
module control4BitTestbench();
	parameter ClockDelay = 5000;

	logic [3:0] a, b;
	logic cIn, cOut, clk;
	logic [2:0] ctrl;
	
	logic [3:0] result;
	
	integer i;
	
	control4Bit dut (a, b, cIn, cOut, ctrl, result);
	
	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
		cIn <= 1'b0;
		a <= 4'b0010;
		b <= 4'b0110;
		ctrl <= 3'b000;
		
		for (i = 0; i < 8; i++)begin
		
			ctrl <= i;
			
			@(posedge clk);
		end
		
		cIn <= 1'b0;
		ctrl <= 3'b010;
		a <= 4'b0001;
		b <= 4'b0010;
		@(posedge clk);
		ctrl <= 3'b011;
		cIn = 1'b1;
		@(posedge clk);
		
		cIn <= 1'b0;
		ctrl <= 3'b010;
		a <= 4'b0111;
		b <= 4'b0010;
		@(posedge clk);
		ctrl <= 3'b011;
		cIn = 1'b1;
		@(posedge clk);
		
		$stop;
	end

endmodule
