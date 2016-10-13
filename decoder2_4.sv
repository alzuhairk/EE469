`timescale 1 ps/ 1 ps

module decoder2_4 (in, data, out);
	input logic [1:0] in;
	input logic data;
	output logic [3:0] out;
	logic [1:0] nots;

	not #50 nots0 (nots[0], in[0]);
	not #50 nots1 (nots[1], in[1]);
	
	and #50 out0 (out[0], nots[0], nots[1], data);
	and #50 out1 (out[1], in[0], nots[1], data);
	and #50 out2 (out[2], nots[0], in[1], data);
	and #50 out3 (out[3], in[0], in[1], data);

endmodule



// testbench
module decoder2_4_testbench();
logic [1:0] in;
logic [3:0] out;
logic data;
logic clk;
decoder2_4 dut (in, data, out);

// set up the clock
 parameter ClockDelay=5000;
 // Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
 
 
initial begin
data <= 1;
in <= 2'b00; @(posedge clk);
 @(posedge clk);
 @(posedge clk);
 @(posedge clk);
 in <= 2'b11; @(posedge clk);
 @(posedge clk);
 @(posedge clk);

 $stop; // End the simulation.
 end
 endmodule 