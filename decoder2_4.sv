module decoder2_4 (in, out)
input logic [1:0] in;
output logic [3:0] out;
out[0] = ~in[0] & ~in[1];
out[1] = in[0] & ~in[1];
out[2] = ~in[0] & in[1];
out[3] = in[0] & in[1];

endmodule



// testbench
