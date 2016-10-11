module decoder3_8(in, enable, out);
	input logic [2:0] in; 
	input logic enable;
	output logic [7:0] out;
	logic [2:0] nots;

	not not0 (nots[0], in[0]);
	not not1 (nots[1], in[1]);
	not not2 (nots[2], in[2]);
	
	and out0 (out[0], nots[0], nots[1], nots[2], enable);
	and out1 (out[1], in[0], nots[1], nots[2], enable);
	and out2 (out[2], nots[0], in[1], nots[2], enable);
	and out3 (out[3], in[0], in[1], nots[2], enable);
	
	and out4 (out[4], nots[0], nots[1], in[2], enable);
	and out5 (out[5], in[0], nots[1], in[2], enable);
	and out6 (out[6], nots[0], in[1], in[2], enable);
	and out7 (out[7], in[0], in[1], in[2], enable);

endmodule 