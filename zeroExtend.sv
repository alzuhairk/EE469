module zeroExtend (in, out);
input logic [11:0] in; 
output logic [63:0] out; 

assign out = {52'b0, in}; 




endmodule 