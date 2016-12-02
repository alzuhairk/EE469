module register32_64Bit (writeEnable, writeData, dataOut, reset, clk);
	input logic [31:0] writeEnable;
	input logic [63:0] writeData;
	input logic clk, reset;
	output logic [63:0] dataOut [31:0];
	
	genvar i;
	generate
		for (i = 0; i < 31; i++) begin: regGen				
			register64Bit register (.writeEnable(writeEnable[i]), .writeData(writeData), .dataOut(dataOut[i][63:0]), .reset(reset), .clk(clk));
			
		end
		
		register64Bit register (.writeEnable(writeEnable[31]), .writeData(), .dataOut(dataOut[31][63:0]), .reset(1'b1), .clk(clk));
	
	endgenerate

endmodule

module register32_64BitTestbench();

	parameter ClockDelay = 50;

	logic [31:0] writeEnable;
	logic [63:0] writeData;
	logic clk, reset;
	logic [63:0] dataOut [31:0];
	
	register32_64Bit dut (.writeEnable, .writeData, .dataOut, .reset, .clk);
	
	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
		writeEnable <= 32'b0;
		reset <= 1;
		writeData <= 64'h00000000000000A0;									@(posedge clk);
		reset <= 0;																	@(posedge clk);
																						@(posedge clk);
		writeEnable <= 32'b00000000000000000000000000000010;			@(posedge clk);
																						@(posedge clk);
		writeEnable <= 32'b00000000000000000000000000000100;			@(posedge clk);
																						@(posedge clk);
		writeEnable <= 32'b01000000000000000000000000000000;			@(posedge clk);
																						@(posedge clk);
		writeEnable <= 32'b10000000000000000000000000000000;			@(posedge clk);
																						@(posedge clk);
		writeEnable <= 1;
		writeData <= 64'h0000010204080001;									@(posedge clk);
		writeEnable <= 32'b00000000000000000000000000000010;			@(posedge clk);
																						@(posedge clk);
		reset <= 1;																	@(posedge clk);
		reset <= 0;																	@(posedge clk);
																						@(posedge clk);

		$stop;
	end
	
endmodule