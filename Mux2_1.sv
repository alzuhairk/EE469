module Mux2_1 (a, b, x, out)
	input logic a, b, x;
	output logic out;
	
	out = (a & ~x) | (b & x);


endmodlue

// Testbench
