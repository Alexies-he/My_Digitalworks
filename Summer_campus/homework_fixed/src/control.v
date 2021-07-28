module control (
	input Valid_i,
	output [2:0] LD
);

	assign LD=(Valid_i)?3'b111:3'b000;
endmodule