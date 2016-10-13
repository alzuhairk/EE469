`timescale 1 ps/ 1 ps

module decoder3_8(in, enable, out);
	input logic [2:0] in; 
	input logic enable;
	output logic [7:0] out;
	logic [2:0] nots;

	not #50 not0 (nots[0], in[0]);
	not #50 not1 (nots[1], in[1]);
	not #50 not2 (nots[2], in[2]);
	
	and #50 out0 (out[0], nots[0], nots[1], nots[2], enable);
	and #50 out1 (out[1], in[0], nots[1], nots[2], enable);
	and #50 out2 (out[2], nots[0], in[1], nots[2], enable);
	and #50 out3 (out[3], in[0], in[1], nots[2], enable);
	
	and #50 out4 (out[4], nots[0], nots[1], in[2], enable);
	and #50 out5 (out[5], in[0], nots[1], in[2], enable);
	and #50 out6 (out[6], nots[0], in[1], in[2], enable);
	and #50 out7 (out[7], in[0], in[1], in[2], enable);

endmodule 
