module cpu ();
	logic [31:0] instruction;
	logic [9:0] flags;
	logic [2:0] ALUOp;
	logic [10:0] opcode;
	logic [4:0] Rd, Rn, Rm;
	logic [8:0] DT_Address9;
	logic [18:0] CondAddr19;
	logic [11:0] ALU_Imm12;
	
	logic [63:0] readData1, readData2, writeDataRegister, writeDataMem, readDataMem;
	
	logic [4:0] reg2LocMuxOut;
	logic [63:0] aluInput2MuxOut, ADDImmMuxOut, dataMemOutputMuxOut, ALUSrcMuxOutput, aluOutput, DAddr9SEOut, ALU_Imm12ZEOut, MemToRegMuxOut, BLMuxOut;
	logic aluNegative, aluZero, aluOverflow, aluCarry_out;
	
	
	logic [63:0] address; 
	logic [18:0] Imm19;
	logic [25:0] Imm26;
	logic [63:0] Imm19Extended, Imm26Extended; 
	logic [63:0] muxToShiftLeft, shiftLeftToAdder, adderToMux1, adderToMux0, muxBrTakenToMuxBr, muxBrToPC; 
	logic cOut0, cOut1, overflow0, overflow1;
	logic reset;
	
	assign opcode = instruction[31:21];
	assign Rd = instruction[4:0];
	assign Rn = instruction[9:5];
	assign Rm = instruction[20:16];
	assign DT_Address9 = instruction[20:12];
	assign CondAddr19 = instruction[23:5];
	assign ALU_Imm12 = instruction[21:10];	
	
	// Flags = reg2loc,ALUSrc,MemToReg,RegWrite,MemWrite,BrTaken,UnCondBr,LBranch,IsBr,AddImm;
	always_comb begin
		casez (opcode)
			11'b000101?????: begin // B
				flags = 10'b???001100?;
				ALUOp = 3'b???;
			end
			
			11'b100101?????: begin // BL
				flags = 10'b???101110?;
				ALUOp = 3'b???;
			end
			
			11'b01010100???: begin // B.LT
				flags = 10'b???0010?0?;
				ALUOp = 3'b???;
			end
			
			11'b10110100???: begin // CBZ
				flags = {5'b00?00, aluZer0, 4'b0?0?};
				ALUOp = 3'b000;
			end
			
			11'b10101011000: begin // ADDS
				flags = 10'b100100?00?;
				ALUOp = 3'b010;
			end
			
			11'b11101011000: begin // SUBS
				flags = 10'b100100?00?;
				ALUOp = 3'b011;
			end
			
			11'b11010110000: begin // BR
				flags = 10'b0??00???1?;
				ALUOp = 3'b???;
			end
			
			11'b1001000100?: begin // ADDI
				flags = 10'b?10100?001;
				ALUOp = 3'b010;
			end
			
			11'b11111000010: begin // LDUR
				flags = 10'b?11100?000;
				ALUOp = 3'b010;
			end
			
			11'b11111000000: begin // STUR
				flags = 10'b01?010??00;
				ALUOp = 3'b010;
			end			
			
			default: begin
				flags = {3'b?, 1'b0, 1'b0, 5'b?};
				ALUOp = 3'b???;
			end
		endcase
	end
	
	
	genvar i;
	generate
		for (i = 0; i < 5; i++) begin: regMux
			mux2_1 m (.a(Rm[i]), .b(Rd[i]), .x(flags[9]), .out(reg2LocMuxOut[i]));
		end
	
	endgenerate
	
	signExtend9 se9 (.in(DT_Address9), .out(DAddr9SEOut));
	zeroExtend ze (.in(ALU_Imm12), .out(ALU_Imm12ZEOut));
	
	mux64x2_1 ALUSrcMux (.zero(readData2), .one(ADDImmMuxOut), .control(flags[8]), .out(ALUSrcMuxOutput));
	mux64x2_1 ADDImmMux (.zero(DAddr9SEOut), .one(ALU_Imm12ZEOut), .control(flags[0]), .out(ADDImmMuxOut));
	mux64x2_1 MemToRegMux (.zero(aluOutput), .one(readDataMem), .control(flags[7]), .out(MemToRegMuxOut));
	mux64x2_1 BLMux (.zero(MemToRegMuxOut), .one(adderToMux0), .control(flags[2]), .out(BLMuxOut));
	
	regfile registerFile (.ReadData1(readData1), .ReadData2(readData2), .WriteData(BLMuxOut), .ReadRegister1(Rn), .ReadRegister2(reg2LocMuxOut), .WriteRegister(Rd), .RegWrite(flags[6]), .clk(clk));
	alu arithmeticLogic (.A(readData1), .B(ALUSrcMuxOutput), .cntrl(ALUOp), .result(aluOutput), .negative(aluNegative), .zero(aluZero), .overflow(aluOverflow), .carry_out(aluCarryOut));
	datamem dataMemory (.address(aluOutput), .write_enable(flag[5]), .read_enable(1), .write_data(readData2), .clk(clk), .xfer_size(4'b1000), .read_data(readDataMem));
	
	
endmodule

