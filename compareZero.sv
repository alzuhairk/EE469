`timescale 1 ps/1 ps

module compareZero (result, isZero);
	input logic [63:0] result;
	output logic isZero;
	logic [15:0] tier1Zero;
	logic [3:0] tier2Zero;
	genvar i;
	generate
	
		for (i = 0; i < 16; i++) begin: zeroing
			nor #50 noZero (tier1Zero[i], result[i], result[i + 16], result[i + 32], result[i + 48]);
		end
		
		for (i = 0; i < 4; i++) begin: zeroing2
			and #50 oZero (tier2Zero[i], tier1Zero[i], tier1Zero[i + 4], tier1Zero[i + 8], tier1Zero[i + 12]);
		end
	
	endgenerate
	
	and #50 zed (isZero, tier2Zero[0], tier2Zero[1], tier2Zero[2], tier2Zero[3]);
endmodule