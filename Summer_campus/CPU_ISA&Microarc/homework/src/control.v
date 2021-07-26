module control (
	input Valid_i,Ready_i,
	input [7:0]Data_o,
	output Valid_o,Ready_o,
	output [2:0] LD
);
	assign Valid_o=(Data_o>8'b00_000_000)?1'b1:1'b0;
	assign  Ready_o=Ready_i;
	assign LD=(Valid_i)?3'b111:3'b000;
endmodule