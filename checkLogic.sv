module checkLogic (flags, ALUOp, opcode);
	output logic [9:0] flags;
	output logic [2:0] ALUOp;
	input logic [10:0] opcode;
	
	// Flags = reg2loc,ALUSrc,MemToReg,RegWrite,MemWrite,BrTaken,UnCondBr,LBranch,IsBr,AddImm;
	always_comb begin
		casez (opcode)
			11'b000101?????: begin
				flags = 10'b???001100?;
				ALUOp = 3'b???;
			end
			
			11'b100101?????: begin
				flags = 10'b???101110?;
				ALUOp = 3'b???;
			end
			
			11'b01010100???: begin
				flags = 10'b???0010?0?;
				ALUOp = 3'b???;
			end
			
			11'b10110100???: begin
				flags = 10'b00?00?0?0?;
				ALUOp = 3'b000;
			end
			
			11'b10101011000: begin
				flags = 10'b100100?00?;
				ALUOp = 3'b010;
			end
			
			11'b11101011000: begin
				flags = 10'b100100?00?;
				ALUOp = 3'b011;
			end
			
			11'b11010110000: begin
				flags = 10'b0??00???1?;
				ALUOp = 3'b???;
			end
			
			11'b1001000100?: begin
				flags = 10'b?10100?001;
				ALUOp = 3'b010;
			end
			
			11'b11111000010: begin
				flags = 10'b?11100?000;
				ALUOp = 3'b010;
			end
			
			11'b11111000000: begin
				flags = 10'b01?010??00;
				ALUOp = 3'b010;
			end			
			
			default: begin
				flags = {3'b?, 1'b0, 1'b0, 5'b?};
				ALUOp = 3'b???;
			end
		endcase
	end

endmodule

module checkLogicTestbench ();

	parameter ClockDelay = 5000;

	logic [9:0] flags;
	logic [2:0] ALUOp;
	logic [10:0] opcode;
	logic clk;
	
	checkLogic dut (flags, ALUOp, opcode);
	
	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
	
	initial begin
		opcode <= 11'b000101xxxxx; @(posedge clk);
		opcode <= 11'b100101xxxxx; @(posedge clk);
		opcode <= 11'b01010100xxx; @(posedge clk);
		opcode <= 11'b10110100xxx; @(posedge clk);
		opcode <= 11'b10101011000; @(posedge clk);
		opcode <= 11'b11101011000; @(posedge clk);
		opcode <= 11'b11010110000; @(posedge clk);
		opcode <= 11'b1001000100x; @(posedge clk);
		opcode <= 11'b11111000010; @(posedge clk);
		opcode <= 11'b11111000000; @(posedge clk);
		opcode <= 11'b0; @(posedge clk);
	
		$stop;
	end

endmodule
