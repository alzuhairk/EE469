module decoder2_4 (in, out);
input logic [1:0] in;
output logic [3:0] out;
assign out[0] = ~in[0] & ~in[1];
assign out[1] = in[0] & ~in[1];
assign out[2] = ~in[0] & in[1];
assign out[3] = in[0] & in[1];

endmodule



// testbench
module decoder2_4_testbench();
logic [1:0] in;
logic [3:0] out;
logic clk;
decoder2_4 dut (in, out);

// set up the clock
 parameter CLOCK_PERIOD=5;
 initial begin
 clk <= 0;
 forever #(CLOCK_PERIOD/2) clk <= ~clk;
 end
 
 
initial begin

in <= 2'b00; @(posedge clk);
 @(posedge clk);
 @(posedge clk);
 @(posedge clk);
 in <= 2'b11; @(posedge clk);
 @(posedge clk);
 @(posedge clk);

 $stop; // End the simulation.
 end
 endmodule 