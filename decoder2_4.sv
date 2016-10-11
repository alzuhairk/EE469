module decoder2_4 (in, out);
	input logic [1:0] in;
	output logic [3:0] out;
	logic [1:0] nots;

	not nots0 (nots[0], in[0]);
	not nots1 (nots[1], in[1]);
	
	and out0 (out[0], nots[0], nots[1]);
	and out1 (out[1], in[0], nots[1]);
	and out2 (out[2], nots[0], in[1]);
	and out3 (out[3], in[0], in[1]);

endmodule



// testbench
module decoder2_4_testbench();
logic [1:0] in;
logic [3:0] out;
logic clk;
decoder2_4 dut (in, out);

// set up the clock
 parameter CLOCK_PERIOD=5;
 initial begin
 clk <= 0;
 forever #(CLOCK_PERIOD/2) clk <= ~clk;
 end
 
 
initial begin

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