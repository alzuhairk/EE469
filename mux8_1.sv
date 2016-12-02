`timescale 1 ps/ 1 ps	

module mux8_1 (in, x, out);
	input logic[7:0] in;
	input logic[2:0] x;
	output logic out;
	logic[1:0] temp;

	mux4_1 m1 (.in(in[7:4]), .x(x[1:0]), .out(temp[1]));
	mux4_1 m2 (.in(in[3:0]), .x(x[1:0]), .out(temp[0]));
	mux2_1 m3 (.a(temp[1]), .b(temp[0]), .x(x[2]), .out(out));

endmodule

module mux4_1 (in, x, out);
	input logic[3:0] in;
	input logic[1:0] x;
	output logic out;
	logic[1:0] temp;
	
	mux2_1 m1 (.a(in[3]), .b(in[2]), .x(x[0]), .out(temp[1]));
	mux2_1 m2 (.a(in[1]), .b(in[0]), .x(x[0]), .out(temp[0]));
	mux2_1 m3 (.a(temp[1]), .b(temp[0]), .x(x[1]), .out(out));

endmodule

// Testbench

module mux8_1Testbench();
	parameter ClockDelay = 5000;

	logic[7:0] in;
	logic[2:0] x;
	logic out, clk;
	
	mux8_1 dut (.in, .x, .out);
	
	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
		in <= 8'b01000000;
		x <= 3'b000;	@(posedge clk);
							@(posedge clk);
		x <= 3'b001;	@(posedge clk);
							@(posedge clk);
		x <= 3'b111;	@(posedge clk);
							@(posedge clk);
			
		$stop;
	end

endmodule
