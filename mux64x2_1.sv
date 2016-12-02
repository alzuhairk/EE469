module mux64x2_1 (zero, one, control, out);
	input logic [63:0] zero, one;
	input logic control;
	output logic [63:0] out;
	
	genvar i;
	generate
		for (i = 0; i < 64; i++) begin: generateMux
			mux2_1 m (.a(one[i]), .b(zero[i]), .x(control), .out(out[i]));
		end
	endgenerate


endmodule
