module decoder3_8(in, enable, out);
input logic [2:0] in; 
input logic enable;
output logic [7:0] out; 

assign out[0] = ~in[0] & ~in[1] & ~in[2] & enable ;
assign out[1] = in[0] & ~in[1] & ~in[2] & enable;
assign out[2] = ~in[0] & in[1] & ~in[2] & enable;
assign out[3] = in[0] & in[1] & ~in[2] & enable;

assign out[4] = ~in[0] & ~in[1] & in[2] & enable;
assign out[5] = in[0] & ~in[1] & in[2] & enable;
assign out[6] = ~in[0] & in[1] & in[2] & enable;
assign out[7] = in[0] & in[1] & in[2] & enable;



endmodule 