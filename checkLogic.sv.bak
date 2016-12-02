module checkLogic (reg2Loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, ALUOp, LBranch, isBR, addImm, opcode);
	output logic reg2Loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, LBranch, isBR, addImm;
	output logic [2:0] ALUOp;
	input logic [10:0] opcode;
	
	assign reg2Loc = ~opcode[7];
	assign ALUSrc = opcode[10] & opcode[7] & ~opcode[5] & ~opcode[4];
	assign MemToReg = opcode[1];
	assign RegWrite = (opcode[10] & opcode[9] & opcode[8] & opcode[7] & opcode[1]) | (opcode[10] & opcode[9] & opcode[8] & opcode[7] & opcode[6] & opcode[5]) | (opcode[10] & ~opcode[9] & ~opcode[8] & opcode[7] & ~opcode[6]) | (opcode[10] & opcode[8] & ~opcode[7] & opcode[6] & ~opcode[5]);
	assign MemWrite = opcode[10] & opcode[9] & opcode[8] & opcode[7] & ~opcode[1];
	assign BrTaken = opcode[5];
	assign UncondBr = ~(opcode[9] | opcode[8]);
	assign ALUOp = {1'b0, ~opcode[5], opcode[10] & opcode[9] & opcode[8] & opcode[4]};
	assign LBranch = opcode[10] & ~opcode[9] & ~opcode[8] & opcode[5];
	assign isBR = opcode[10] & opcode[9] & ~opcode[8];
	assign addImm = opcode[3];

endmodule

module checkLogicTestbench ();

	parameter ClockDelay = 5000;

	logic reg2Loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, LBranch, isBR, addImm, clk;
	logic [2:0] ALUOp;
	logic [10:0] opcode;
	
	checkLogic dut (reg2Loc, ALUSrc, MemToReg, RegWrite, MemWrite, BrTaken, UncondBr, ALUOp, LBranch, isBR, addImm, opcode);
	
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
	
	
		$stop;
	end

endmodule
