module register14Bit (writeEnable, writeData, dataOut, reset, clk);
	input logic writeEnable, clk, reset;
	input logic [13:0] writeData;
	output logic [13:0] dataOut;
	logic [13:0] d;
	
	genvar i;
	generate
		for (i = 0; i < 14; i = i + 1) begin: flipflopWiring
		
			mux2_1 enableMux (.a(writeData[i]), .b(dataOut[i]), .x(writeEnable), .out(d[i]));
		
			D_FF flipflop (.q(dataOut[i]), .d(d[i]), .reset(reset), .clk(clk));
		
		end
	endgenerate

endmodule