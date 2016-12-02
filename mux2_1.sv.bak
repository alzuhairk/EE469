`timescale 1 ps/ 1 ps	

module mux2_1 (a, b, x, out);
	input logic a, b, x;
	output logic out;
	logic notX, aX, bNotX;
	
	not #50 notControl (notX, x);
	and #50 aAndX (aX, a, x);
	and #50 bAndNotX (bNotX, b, notX);
	or #50 outAssign (out, aX, bNotX);

endmodule

// Testbench

module mux2_1Testbench();
	parameter ClockDelay = 5000;

	logic a, b, x, out;
	logic clk;
	
	Mux2_1 dut (.a, .b, .x, .out);
	
	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
		a <= 1;
		b <= 0;
		x <= 0;			@(posedge clk);
							@(posedge clk);
		x <= 1;			@(posedge clk);
							@(posedge clk);
		x <= 0;			@(posedge clk);
							@(posedge clk);
			
		$stop;
	end

endmodule
