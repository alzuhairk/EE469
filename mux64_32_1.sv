`timescale 1 ps/ 1 ps

module mux64_32_1 (in, x, out);
input logic [63:0] in [31:0];
input logic [4:0] x;
output logic [63:0] out;
logic [31:0] temp [63:0];
	genvar i, j;
	generate
		for (i = 0; i < 64; i++) begin: Mux
				for (j = 0; j <32; j++) begin: Single_mux
					buf #50 buffer (temp[i][j], in[j][i]);
				end
			Mux32_1 mux1 (.in(temp[i]), .x(x[4:0]), .out(out[i]));
		end
	endgenerate

endmodule 

// Testbench

module mux64_32_1Testbench();
	parameter ClockDelay = 5000;

	logic[63:0] in [31:0];
	logic[4:0] x;
	logic [63:0]out;
	logic clk;
	integer i;
	mux64_32_1 dut (.in, .x, .out);
	
	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
	for (i=0; i<32; i=i+1) begin
		in[i] <= 64'b1;
	end
		 // 00000 goes to 0 after b
		in[4] <= 64'hffffffffffffffff; 
		in[7] <= 64'haaaaaaaaaaaaaaaa;
		x <= 5'b00000;			@(posedge clk);
									@(posedge clk);
		x <= 5'b00100; 		@(posedge clk);
									@(posedge clk);
		x <= 5'b00111; 		@(posedge clk);
									@(posedge clk);
									@(posedge clk);
			
		$stop;
	end

endmodule