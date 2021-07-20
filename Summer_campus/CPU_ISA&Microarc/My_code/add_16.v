module add_16 #(
	parameter WIDTH = 16
) (
	input [WIDTH-1:0]OP_A,OP_B,
	input CYI,
	output [WIDTH-1:0]SUM,
	output CYO
);
	assign {CYO,SUM} = OP_A+OP_B+CYI;
endmodule