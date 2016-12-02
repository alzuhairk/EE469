module pc (writeEnable, writeData, dataOut, reset, clk);
	input logic writeEnable, clk, reset;
	input logic [63:0] writeData;
	output logic [63:0] dataOut;
	logic [63:0] d;
	
	genvar i;
	generate
		for (i = 0; i < 64; i = i + 1) begin: flipflopWiring
		
			mux2_1 enableMux (.a(writeData[i]), .b(dataOut[i]), .x(writeEnable), .out(d[i]));
		
			D_FF flipflop (.q(dataOut[i]), .d(d[i]), .reset(reset), .clk(clk));
		
		end
	endgenerate

endmodule

module pcTestbench();

	parameter ClockDelay = 5000;

	logic writeEnable, clk, reset;
	logic [63:0] writeData;
	logic [63:0] dataOut;
	
	pc dut (.writeEnable, .writeData, .dataOut, .reset, .clk);
	
	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
		writeEnable <= 0;
		reset <= 1;
		writeData <= 64'h00000000000000A0;	@(posedge clk);
		reset <= 0;									@(posedge clk);
		writeEnable <= 1;							@(posedge clk);
		writeEnable <=0;							@(posedge clk);
		writeEnable <= 1;
		writeData <= 64'h0000010204080001;	@(posedge clk);
		writeEnable <= 0;							@(posedge clk);
		reset <= 1;									@(posedge clk);
		reset <= 0;									@(posedge clk);

		$stop;
	end
	
endmodule