module decoder5_32 (in, out)
input logic [4:0] in;
output logic [31:0] out;
logic [3:0] temp;

decoder2_4 d1 (.in(in[4:3]), .out(temp[3:0]));
decoder3_8 d2 (.in(in[2:0]), .enable(temp[0]), .out(out[7:0]));
decoder3_8 d3 (.in(in[2:0]), .enable(temp[1]), .out(out[15:8]));
decoder3_8 d4 (.in(in[2:0]), .enable(temp[2]), .out(out[23:16]));
decoder3_8 d5 (.in(in[2:0]), .enable(temp[3]), .out(out[31:24]));

endmodule 
