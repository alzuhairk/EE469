module register32Bit (writeEnable, writeData, dataOut, reset, clk);
	input logic writeEnable, clk, reset;
	input logic [31:0] writeData;
	output logic [31:0] dataOut;
	logic [31:0] d;
	
	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin: flipflopWiring
		
			mux2_1 enableMux (.a(writeData[i]), .b(dataOut[i]), .x(writeEnable), .out(d[i]));
		
			D_FF flipflop (.q(dataOut[i]), .d(d[i]), .reset(reset), .clk(clk));
		
		end
	endgenerate

endmodule
