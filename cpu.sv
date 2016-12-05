`timescale 1 ps/1 ps

module cpu (clk, reset);
	input logic clk, reset;

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
	logic aluNegative, aluZero, aluOverflow, aluCarry_out, dataMemReadEn, BLTTaken, aluNegativePrev, aluOverflowPrev;
	
	logic exRdRfRnMatchComp5Out, dmRdRfRnMatchComp5Out;
	logic exRdRfRmMatchComp5Out, dmRdRfRmMatchComp5Out, NOTexIsSTURorCBZ, NOTdmIsSTURorCBZ;
	
	logic [63:0] address, address0; 
	logic [18:0] Imm19;
	logic [25:0] Imm26;
	logic [63:0] Imm19Extended, Imm26Extended; 
	logic [63:0] muxToShiftLeft, shiftLeftToAdder, adderToMux1, adderToMux0, muxBrTakenToMuxBr, muxBrToPC, pcOutCycleLate; 
	logic cOut0, cOut1, overflow0, overflow1;
	
	// PIPELINE LOGICS //
	logic [31:0] ifInstruction, rfInstruction, exInstruction, dmInstruction, wbInstruction;
	logic [13:0] rfFlags, exFlags, dmFlags, wbFlags;
	logic [4:0] wbRd;
	logic [63:0] rfDa, rfDb, exAluOutput, dmMemToRegToL, forwardingDataDa, forwardingDataDb, regDataDa, regDataDb, rfDb2, exReadData2Out, dmReadData2Out, dmPcForBL, exPcForBL, rfPcForBL, wbPcForBL, exDataPassthroughValue, forwardedDataRfRm, forwardedDataRfRd, forwardingDataRfDb;
	logic dmRdRfRnMatch, dmRdRfRmMatch, exRdRfRnMatch, exRdRfRmMatch, useForwardedDataDa, useForwardedDataDb, isZero, aluNegativeFlag, aluOverflowFlag, doBr, aluOveSaveValue, aluNegSaveValue, isSTURorCBZ, exRfRdExRdMatch, dmRfRdExRdMatch, rfIsSTURorCBZ, exIsSTURorCBZ, dmIsSTURorCBZ;
	logic [4:0] rfRn, rfRm, exRd, dmRd, dmComp5BitAVal, exComp5BitAVal, forwardingRfRdMuxValForComp;
	logic [1:0] brType, rfBrType;
	
	assign Imm19 = instruction[23:5]; 
	assign Imm26 = instruction[25:0];
	assign opcode = instruction[31:21];
	assign Rm = instruction[20:16];
	assign CondAddr19 = instruction[23:5];
	assign exRd = exInstruction[4:0];
	assign dmRd = dmInstruction[4:0];
	assign rfRn = rfInstruction[9:5];
	assign rfRm = rfInstruction[20:16];
	
	// B.LT XOR
	
	
	// Flags = reg2loc,ALUSrc,MemToReg,RegWrite,MemWrite,BrTaken,UnCondBr,LBranch,IsBr,AddImm;
	// rfFlags = aluop, dmreadenable, reg2loc,ALUSrc,MemToReg,RegWrite,MemWrite,BrTaken,UnCondBr,LBranch,IsBr,AddImm;
	// dmFlags = aluop, dmreadenable, reg2loc,ALUSrc,MemToReg,RegWrite,MemWrite,BrTaken,UnCondBr,LBranch,IsBr,AddImm;
	// wbFlags = aluop, dmreadenable, reg2loc,ALUSrc,MemToReg,RegWrite,MemWrite,BrTaken,UnCondBr,LBranch,IsBr,AddImm;
	
	compareZero cmp (.result(regDataDb), .isZero(isZero));
	xor #50 blt (BLTTaken, aluNegativeFlag, aluOverflowFlag);

	
	// INSTRUCTION FETCH //
	
	pc programCounter (.writeEnable(1'b1), .writeData(muxBrToPC), .dataOut(address0), .reset(reset), .clk(clk));
	register64Bit pcFlipFlop (.writeEnable(1'b1), .writeData(address0), .dataOut(pcOutCycleLate), .reset(reset), .clk(clk));
	mux64x2_1 pcCycleLateMux (.zero(address0), .one(pcOutCycleLate), .control(doBr), .out(address));
	
	instructmem insMem(.address(address0), .instruction(instruction), .clk(clk));
		
	signExtend19 SE1 (.in(rfInstruction[23:5]), .out(Imm19Extended));
	signExtend26 SE2(.in(rfInstruction[25:0]), .out(Imm26Extended));
	shiftLeft SL (.in(muxToShiftLeft), .out(shiftLeftToAdder));
	
	fastAdder FA0 (.A(address), .B(64'h0000000000000004), .cntrl(1'b0), .result(adderToMux0), .cOut(cOut0), .overflow(overflow0)); // control is 0 to do addition
	fastAdder FA1 (.A(shiftLeftToAdder), .B(address), .cntrl(1'b0), .result(adderToMux1), .cOut(cOut1), .overflow(overflow1)); // control is 0 to do addition
	
	mux64x2_1 brTaken (.zero(adderToMux0), .one(adderToMux1), .control(doBr), .out(muxBrTakenToMuxBr));
	mux64x2_1 isBr (.zero(muxBrTakenToMuxBr), .one(readData2), .control(rfFlags[1]), .out(muxBrToPC));
	mux64x2_1 uncondBr (.zero(Imm19Extended), .one(Imm26Extended), .control(rfFlags[3]), .out(muxToShiftLeft));
	
	controlFlagLogic controlLogic (.opcode(opcode), .instruction(instruction), .BrTaken(isZero), .flags(flags), .ALUOp(ALUOp), .dataMemReadEn(dataMemReadEn), .Rd(Rd), .brType(brType), .isSTURorCBZ(isSTURorCBZ));

	mux4_1 doBrMux (.in({1'b1, isZero, BLTTaken, 1'b0}), .x(rfBrType), .out(doBr));
	
	// REGISTER FETCH //
	
	regfile registerFile (.ReadData1(readData1), .ReadData2(readData2), .WriteData(BLMuxOut), .ReadRegister1(rfInstruction[9:5]), .ReadRegister2(reg2LocMuxOut), .WriteRegister(wbRd), .RegWrite(wbFlags[6]), .posClk(clk));
	
	register32Bit rfInstructionRegister (.writeEnable(1'b1), .writeData(instruction), .dataOut(rfInstruction), .reset(reset), .clk(clk));
	register64Bit rfDaRegister (.writeEnable(1'b1), .writeData(regDataDa), .dataOut(rfDa), .reset(reset), .clk(clk));
	register64Bit rfDb2Register (.writeEnable(1'b1), .writeData(regDataDb), .dataOut(rfDb2), .reset(reset), .clk(clk));
	register64Bit rfDbRegister (.writeEnable(1'b1), .writeData(ALUSrcMuxOutput), .dataOut(rfDb), .reset(reset), .clk(clk));
	register14Bit rfFlagsRegister (.writeEnable(1'b1), .writeData({ALUOp, dataMemReadEn, flags}), .dataOut(rfFlags), .reset(reset), .clk(clk));
	
	D_FF rfBrTypeSet1 (.q(rfBrType[1]), .d(brType[1]), .reset(reset), .clk(clk));
	D_FF rfBrTypeSet0 (.q(rfBrType[0]), .d(brType[0]), .reset(reset), .clk(clk));
	D_FF rfSetIsSTURorCBZ (.q(rfIsSTURorCBZ), .d(isSTURorCBZ), .reset(reset), .clk(clk));
	
	signExtend9 se9 (.in(rfInstruction[20:12]), .out(DAddr9SEOut));
	zeroExtend ze (.in(rfInstruction[21:10]), .out(ALU_Imm12ZEOut));
	
	mux64x2_1 ALUSrcMux (.zero(regDataDb), .one(ADDImmMuxOut), .control(rfFlags[8]), .out(ALUSrcMuxOutput));
	mux64x2_1 ADDImmMux (.zero(DAddr9SEOut), .one(ALU_Imm12ZEOut), .control(rfFlags[0]), .out(ADDImmMuxOut));
	
	genvar i;
	generate
		for (i = 0; i < 5; i++) begin: regMux // Reg2LocMux
			mux2_1 m (.a(rfInstruction[i + 16]), .b(rfInstruction[i]), .x(rfFlags[9]), .out(reg2LocMuxOut[i]));
		end
	
	endgenerate	
	
	// EXECUTE //
	
	alu arithmeticLogic (.A(rfDa), .B(rfDb), .cntrl(exFlags[13:11]), .result(aluOutput), .negative(aluNegative), .zero(aluZero), .overflow(aluOverflow), .carry_out(aluCarryOut));
	D_FF aluNegSave (.q(aluNegativePrev), .d(aluNegSaveValue), .reset(reset), .clk(clk));
	D_FF aluOvSave (.q(aluOverflowPrev), .d(aluOveSaveValue), .reset(reset), .clk(clk));
	
	mux2_1 useNewValAluNegativePrev (.a(aluNegative), .b(aluNegativePrev), .x(exFlags[9]), .out(aluNegSaveValue));
	mux2_1 useNewValAluOverflowPrev (.a(aluOverflow), .b(aluOverflowPrev), .x(exFlags[9]), .out(aluOveSaveValue));
	
	D_FF exSetIsSTURorCBZ (.q(exIsSTURorCBZ), .d(rfIsSTURorCBZ), .reset(reset), .clk(clk));
	
	register32Bit exInstructionRegister (.writeEnable(1'b1), .writeData(rfInstruction), .dataOut(exInstruction), .reset(reset), .clk(clk));
	register14Bit exFlagsRegister (.writeEnable(1'b1), .writeData(rfFlags), .dataOut(exFlags), .reset(reset), .clk(clk));
	register64Bit exAluOutRegister (.writeEnable(1'b1), .writeData(exDataPassthroughValue), .dataOut(exAluOutput), .reset(reset), .clk(clk));
	register64Bit exReadData2Register (.writeEnable(1'b1), .writeData(regDataDb), .dataOut(exReadData2Out), .reset(reset), .clk(clk));
	register64Bit exPcForBLRegister (.writeEnable(1'b1), .writeData(address0), .dataOut(exPcForBL), .reset(reset), .clk(clk));
	
	mux2_1 chooseFlagSourceNegative (.a(aluNegative), .b(aluNegativePrev), .x(exFlags[9]), .out(aluNegativeFlag));
	mux2_1 chooseFlagSourceOverflow (.a(aluOverflow), .b(aluOverflowPrev), .x(exFlags[9]), .out(aluOverflowFlag));
	mux64x2_1 pickALUPassthroughMux (.zero(aluOutput), .one(exPcForBL), .control(exFlags[2]), .out(exDataPassthroughValue));
	
	// DATA MEMORY //
	
	datamem dataMemory (.address(exAluOutput), .write_enable(dmFlags[5]), .read_enable(dmFlags[10]), .write_data(dmReadData2Out), .clk(clk), .xfer_size(4'b1000), .read_data(readDataMem));
	
	register32Bit dmInstructionRegister (.writeEnable(1'b1), .writeData(exInstruction), .dataOut(dmInstruction), .reset(reset), .clk(clk));
	register14Bit dmFlagsRegister (.writeEnable(1'b1), .writeData(exFlags), .dataOut(dmFlags), .reset(reset), .clk(clk));
	register64Bit dmMemToRegToLRegister (.writeEnable(1'b1), .writeData(MemToRegMuxOut), .dataOut(dmMemToRegToL), .reset(reset), .clk(clk));
	register64Bit dmReadData2Register (.writeEnable(1'b1), .writeData(exReadData2Out), .dataOut(dmReadData2Out), .reset(reset), .clk(clk));
	register64Bit dmPcForBLRegister (.writeEnable(1'b1), .writeData(exPcForBL), .dataOut(dmPcForBL), .reset(reset), .clk(clk));
	
	D_FF dmSetIsSTURorCBZ (.q(dmIsSTURorCBZ), .d(exIsSTURorCBZ), .reset(reset), .clk(clk));

	mux64x2_1 MemToRegMux (.zero(exAluOutput), .one(readDataMem), .control(dmFlags[7]), .out(MemToRegMuxOut));
	
	// WRITE BACK //
	register32Bit wbInstructionRegister (.writeEnable(1'b1), .writeData(dmInstruction), .dataOut(wbInstruction), .reset(reset), .clk(clk));
	register14Bit wbFlagsRegister (.writeEnable(1'b1), .writeData(dmFlags), .dataOut(wbFlags), .reset(reset), .clk(clk));
	register64Bit wbPcForBLRegister (.writeEnable(1'b1), .writeData(dmPcForBL), .dataOut(wbPcForBL), .reset(reset), .clk(clk));
	
	mux64x2_1 BLMux (.zero(dmMemToRegToL), .one(wbPcForBL), .control(wbFlags[2]), .out(BLMuxOut));
	
	// FORWARDING //
	generate
		for (i = 1; i < 5; i++) begin: setUpBL // rd = 30 if BL
			mux2_1 m1 (.a(1'b1), .b(exRd[i]), .x(exFlags[2]), .out(exComp5BitAVal[i]));
			mux2_1 m2 (.a(1'b1), .b(dmRd[i]), .x(dmFlags[2]), .out(dmComp5BitAVal[i]));
		end
		mux2_1 m1 (.a(1'b0), .b(exRd[0]), .x(exFlags[2]), .out(exComp5BitAVal[0]));
		mux2_1 m2 (.a(1'b0), .b(dmRd[0]), .x(dmFlags[2]), .out(dmComp5BitAVal[0]));
	
	endgenerate	
	
	
	comp5Bit dmToRfRn (.a(dmComp5BitAVal), .b(rfRn), .out(dmRdRfRnMatchComp5Out));
	comp5Bit dmToRfRm (.a(dmComp5BitAVal), .b(rfRm), .out(dmRdRfRmMatchComp5Out));
	comp5Bit exToRfRn (.a(exComp5BitAVal), .b(rfRn), .out(exRdRfRnMatchComp5Out));
	comp5Bit exToRfRm (.a(exComp5BitAVal), .b(rfRm), .out(exRdRfRmMatchComp5Out));
	
	not #50 notExIsSTURorCBZGate (NOTexIsSTURorCBZ, exIsSTURorCBZ);
	not #50 notDmIsSTURorCBZGate (NOTdmIsSTURorCBZ, dmIsSTURorCBZ);
	and #50 exRdRfRmMatchGate (exRdRfRmMatch, exRdRfRmMatchComp5Out, NOTexIsSTURorCBZ);
	and #50 exRdRfRnMatchGate (exRdRfRnMatch, exRdRfRnMatchComp5Out, NOTexIsSTURorCBZ);
	and #50 dmRdRfRmMatchGate (dmRdRfRmMatch, dmRdRfRmMatchComp5Out, NOTdmIsSTURorCBZ);
	and #50 dmRdRfRnMatchGate (dmRdRfRnMatch, dmRdRfRnMatchComp5Out, NOTdmIsSTURorCBZ);
	
	//assign exRdRfRmMatch = exRdRfRmMatchComp5Out & ~ exIsSTURorCBZ;
	//assign dmRdRfRmMatch = dmRdRfRmMatchComp5Out & ~ dmIsSTURorCBZ;
	
	//assign exRdRfRnMatch = exRdRfRnMatchComp5Out & ~ exIsSTURorCBZ;
	//assign dmRdRfRnMatch = dmRdRfRnMatchComp5Out & ~ dmIsSTURorCBZ;
	
	// For rd as a read, i.e. STUR and CBZ
	generate
		for (i = 0; i < 5; i++) begin: SetIsSTURorCBZMuxes // rd = 30 if BL
			mux2_1 m3 (.a(rfInstruction[i]), .b(1'b1), .x(rfIsSTURorCBZ), .out(forwardingRfRdMuxValForComp[i]));
		end	
	endgenerate
	
	comp5Bit exToRfRd (.a(forwardingRfRdMuxValForComp), .b(exComp5BitAVal), .out(exRfRdExRdMatch));
	comp5Bit dmToRfRd (.a(forwardingRfRdMuxValForComp), .b(dmComp5BitAVal), .out(dmRfRdDmRdMatch));
	
	or #50 setUseForwardedDataRfRd (useForwardedDataRfRd, exRfRdExRdMatch, dmRfRdDmRdMatch);
	
	mux64x2_1 chooseSourceForForwardedDataForRfRd (.zero(exAluOutput), .one(aluOutput), .control(exRfRdExRdMatch), .out(forwardingDataRfDb));
	mux64x2_1 setRfDbForwardedFromDwMux (.zero(readData2), .one(forwardingDataRfDb), .control(useForwardedDataRfRd), .out(forwardedDataRfRd));
	
	mux64x2_1 setDataDb (.zero(forwardedDataRfRm), .one(forwardedDataRfRd), .control(rfIsSTURorCBZ), .out(regDataDb));
	
	or #50 setUseForwardedDataDa (useForwardedDataDa, dmRdRfRnMatch, exRdRfRnMatch);
	or #50 setUseForwardedDataDb (useForwardedDataDb, dmRdRfRmMatch, exRdRfRmMatch);	
	
	mux64x2_1 setForwardingDataDa (.zero(MemToRegMuxOut), .one(aluOutput), .control(exRdRfRnMatch), .out(forwardingDataDa));
	mux64x2_1 setDataDa (.zero(readData1), .one(forwardingDataDa), .control(useForwardedDataDa), .out(regDataDa));
	mux64x2_1 setForwardingDataDb (.zero(exAluOutput), .one(aluOutput), .control(exRdRfRmMatch), .out(forwardingDataDb));
	mux64x2_1 setForwardingDataDbForSetData (.zero(readData2), .one(forwardingDataDb), .control(useForwardedDataDb), .out(forwardedDataRfRm));
		
	generate
		for (i = 1; i < 5; i++) begin: setRd // rd = 30 if BL
			mux2_1 m (.a(1'b1), .b(wbInstruction[i]), .x(wbFlags[2]), .out(wbRd[i]));
		end
		mux2_1 m (.a(1'b0), .b(wbInstruction[0]), .x(wbFlags[2]), .out(wbRd[0]));
	
	endgenerate
	
endmodule

module cpuTestbench ();

	parameter ClockDelay = 15000;
	parameter loopEnd = 1000;

	logic clk;
	logic reset;
	cpu dut (.clk, .reset);
	
	integer i;
	

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	initial begin
		reset <= 1; @(posedge clk);
		reset <= 0; @(posedge clk);
		
		for (i=0; i<loopEnd; i++) begin
			@(posedge clk);
		end
		
		$stop;
	end

endmodule