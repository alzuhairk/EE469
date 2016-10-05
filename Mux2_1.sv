module Mux2_1 (a, b, x, Out)
	input a, b, x;
	output Out;
	
	Out = (a & ~x) | (b & x);


endmodlue

// Testbench
