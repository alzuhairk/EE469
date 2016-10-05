module decoder3_8(in, out)
input logic [2:0] in; 
output logic [7:0] out; 

out[0] = ~in[0] & ~in[1] & ~in[2];
out[1] = in[0] & ~in[1] & ~in[2];
out[2] = ~in[0] & in[1] & ~in[2];
out[3] = in[0] & in[1] & ~in[2];

out[4] = ~in[0] & ~in[1] & in[2];
out[5] = in[0] & ~in[1] & in[2];
out[6] = ~in[0] & in[1] & in[2];
out[7] = in[0] & in[1] & in[2];



endmodule 