module cpSideOfCPU (); 

logic [63:0] address; 
logic [31:0] instruction;
logic [18:0] Imm19;
logic [25:0] Imm26;
logic [63:0] Imm19Extended, Imm26Extended; 
logic [63:0] muxToShiftLeft, shiftLeftToAdder, adderToMux1, adderToMux0, muxBrTakenToMuxBr, muxBrToPC; 
logic cOut0, cOut1, overflow0, overflow1;
logic reset; 


pc programCounter (.writeEnable(1'b1), .writeData(muxBrToPC), .dataOut(address), .reset(reset), .clk(clk));
instructmem insMem(.address(address), .instruction(instruction), .clk);


Imm19 = instruction[23:5];
Imm26 = instruction[25:0]; 
signExtend19 SE1 (.in(Imm19), .out(Imm19Extended));
signExtend26 SE2(.in(Imm26), .out(Imm26Extended));


mux64x2_1 uncondBr (.zero(Imm19Extended), .one(Imm26Extended), .control(flags[3]), .out(muxToShiftLeft));

shiftLeft SL (.in(muxToShiftLeft), .out(shiftLeftToAdder)); 

fastAdder FA0 (.A(Address), .B(64'h0000000000000004), .cntrl(1'b0), .result(adderToMux0), .cOut(cOut0), .overflow(overflow0)); // control is 0 to do addition
fastAdder FA1 (.A(shiftLeftToAdder), .B(Address), .cntrl(1'b0), .result(adderToMux1), .cOut(cOut1), .overflow(overflow1)); // control is 0 to do addition

mux64x2_1 uncondBr (.zero(adderToMux0), .one(adderToMux1), .control(flags[4]), .out(muxBrTakenToMuxBr));

mux64x2_1 uncondBr (.zero(muxBrTakenToMuxBr), .one(readData2), .control(flags[1]), .out(muxBrToPC));





endmodule 