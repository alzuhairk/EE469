`timescale 1 ps/1 ps

module controlFlagLogic (opcode, instruction, aluNegativePrev, aluOverflowPrev, flags, ALUOp, dataMemReadEn, Rd);
	input logic [10:0] opcode;
	input logic [31:0] instruction;
	input logic aluNegativePrev, aluOverflowPrev;
	output logic [9:0] flags;
	output logic [2:0] ALUOp;
	output logic dataMemReadEn;
	output logic [4:0] Rd;
	
	xor #50 blt (BLTTaken, aluNegativePrev, aluOverflowPrev);

	always_comb begin
		casez (opcode)
			11'b000101?????: begin // B
				flags = 10'b???001100?;
				ALUOp = 3'b???;
				dataMemReadEn = 1'b0;
				Rd = instruction[4:0];
			end
			
			11'b100101?????: begin // BL
				flags = 10'b???101110?;
				ALUOp = 3'b???;
				dataMemReadEn = 1'b0;
				Rd = 5'b11110;
			end
			
			11'b01010100???: begin // B.LT
				flags = {5'b???00, BLTTaken, 4'b0?0?};
				ALUOp = 3'b???;
				dataMemReadEn = 1'b0;
				Rd = instruction[4:0];
			end
			
			11'b10110100???: begin // CBZ
				flags = {5'b00?00, /*SET TO USE ACCEL BRANCHES */ 1'b0, 4'b0?0?};
				ALUOp = 3'b000;
				dataMemReadEn = 1'b0;
				Rd = instruction[4:0];
			end
			
			11'b10101011000: begin // ADDS
				flags = 10'b100100?00?;
				ALUOp = 3'b010;
				dataMemReadEn = 1'b0;
				Rd = instruction[4:0];
			end
			
			11'b11101011000: begin // SUBS
				flags = 10'b100100?00?;
				ALUOp = 3'b011;
				dataMemReadEn = 1'b0;
				Rd = instruction[4:0];
			end
			
			11'b11010110000: begin // BR
				flags = 10'b0??00???1?;
				ALUOp = 3'b???;
				dataMemReadEn = 1'b0;
				Rd = instruction[4:0];
			end
			
			11'b1001000100?: begin // ADDI
				flags = 10'b?10100?001;
				ALUOp = 3'b010;
				dataMemReadEn = 1'b0;
				Rd = instruction[4:0];
			end
			
			11'b11111000010: begin // LDUR
				flags = 10'b?11100?000;
				ALUOp = 3'b010;
				dataMemReadEn = 1'b1;
				Rd = instruction[4:0];
			end
			
			11'b11111000000: begin // STUR
				flags = 10'b01?010??00;
				ALUOp = 3'b010;
				dataMemReadEn = 1'b0;
				Rd = instruction[4:0];
			end			
			
			default: begin
				flags = {3'b?, 1'b0, 1'b0, 5'b?};
				ALUOp = 3'b???;
				dataMemReadEn = 1'b0;
				Rd = instruction[4:0];
			end
		endcase
	end

endmodule
