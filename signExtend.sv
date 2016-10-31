module signExtend19 (in, out);
input logic [18:0] in; 
output logic [63:0] out; 
logic extendBit;


genvar i;
	generate
		for (i = 63; i > 18; i--) begin: Extend
			assign out[i] = in[18];
		end
	endgenerate
	assign out[18:0] = in[18:0];

endmodule 


module signExtend26 (in, out);
input logic [25:0] in; 
output logic [63:0] out; 
logic extendBit;


genvar i;
	generate
		for (i = 63; i > 25; i--) begin: Extend
			assign out[i] = in[25];
		end
	endgenerate
	assign out[25:0] = in[25:0];

endmodule 