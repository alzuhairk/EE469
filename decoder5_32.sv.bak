module decoder5_32 (in, out);
	input logic [4:0] in;
	output logic [31:0] out;
	logic [3:0] temp;

	decoder2_4 d1 (.in(in[4:3]), .out(temp[3:0]));
	decoder3_8 d2 (.in(in[2:0]), .enable(temp[0]), .out(out[7:0]));
	decoder3_8 d3 (.in(in[2:0]), .enable(temp[1]), .out(out[15:8]));
	decoder3_8 d4 (.in(in[2:0]), .enable(temp[2]), .out(out[23:16]));
	decoder3_8 d5 (.in(in[2:0]), .enable(temp[3]), .out(out[31:24]));

endmodule 



// testbench
module decoder5_32_testbench();
	logic [4:0] in;
	logic [31:0] out;
	logic clk;
	decoder5_32 dut (in, out);

	// set up the clock
	 parameter CLOCK_PERIOD=5;
	 initial begin
		 clk <= 0;
		 forever #(CLOCK_PERIOD/2) clk <= ~clk;
	 end
	 
	 
	initial begin

		in <= 5'b00000; @(posedge clk);
		in <= 5'b00010; @(posedge clk);
		in <= 5'b00100; @(posedge clk);
		 @(posedge clk);
		 in <= 5'b11111; @(posedge clk);
		 @(posedge clk);
		 @(posedge clk);
		 

		 $stop; // End the simulation.
	 end
 endmodule 