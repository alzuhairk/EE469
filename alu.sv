`timescale 1 ps/1 ps

module alu (A, B, cntrl, result, negative, zero, overflow, carry_out);
	input logic [63:0] A, B;
	input logic [2:0] cntrl;
	output logic [63:0] result;
	output logic carry_out, zero, negative, overflow;
	logic [63:0] andOut, orOut, xorOut, adderOut;
	logic [15:0] tier1Zero;
	logic [3:0] tier2Zero;
	
	
	fastAdder adder(.A(A), .B(B), .cntrl(cntrl[0]), .result(adderOut), .cOut(carry_out), .overflow(overflow));
	
	genvar i;
	generate
		for (i = 0; i < 64; i++) begin: wiring
			and #50 aOut (andOut[i], A[i], B[i]);
			or #50 oOut (orOut[i], A[i], B[i]);
			xor #50 xoOut (xorOut[i], A[i], B[i]);
			
			mux8_1 outputMux (.in({1'bx, xorOut[i], orOut[i], andOut[i], adderOut[i], adderOut[i], 1'bx, B[i]}), .x(cntrl), .out(result[i]));
		end
	
		for (i = 0; i < 16; i++) begin: zeroing
			nor #50 noZero (tier1Zero[i], result[i], result[i + 16], result[i + 32], result[i + 48]);
		end
		
		for (i = 0; i < 4; i++) begin: zeroing2
			and #50 oZero (tier2Zero[i], tier1Zero[i], tier1Zero[i + 4], tier1Zero[i + 8], tier1Zero[i + 12]);
		end
	
	endgenerate
	
	and #50 zed (zero, tier2Zero[0], tier2Zero[1], tier2Zero[2], tier2Zero[3]);
	assign negative = result[63];
	
endmodule

module alustim();

	parameter delay = 100000;

	logic		[63:0]	A, B;
	logic		[2:0]		cntrl;
	logic		[63:0]	result;
	logic					negative, zero, overflow, carry_out ;

	parameter ALU_PASS_B=3'b000, ALU_ADD=3'b010, ALU_SUBTRACT=3'b011, ALU_AND=3'b100, ALU_OR=3'b101, ALU_XOR=3'b110;
	

	alu dut (.A, .B, .cntrl, .result, .negative, .zero, .overflow, .carry_out);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	integer i;
	logic [63:0] test_val;
	initial begin
	
		$display("%t testing PASS_A operations", $time);
		cntrl = ALU_PASS_B;
		for (i=0; i<100; i++) begin
			A = $random(); B = $random();
			#(delay);
			assert(result == B && negative == B[63] && zero == (B == '0));
		end
		
		$display("%t testing addition", $time);
		cntrl = ALU_ADD;
		A = 64'h0000000000000001; B = 64'h0000000000000001;
		#(delay);
		assert(result == 64'h0000000000000002 && carry_out == 0 && overflow == 0 && negative == 0 && zero == 0);
		
		A <= 64'h0000000000000010;
		B <= 64'h0000000000000010; #(delay);
		A <= 64'h0000000000000001;
		B <= 64'h0000000000000002;
		cntrl <= ALU_SUBTRACT;		#(delay);#(delay);
		
	end
endmodule