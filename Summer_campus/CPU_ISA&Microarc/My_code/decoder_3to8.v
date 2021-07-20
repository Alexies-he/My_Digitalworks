module decoder_3to8(
	input [2:0] DATA_IN,
	output reg [7:0] DATA_OUT
);
	always @(DATA_IN) begin
		case (DATA_IN)
			3'b000:DATA_OUT<=8'b00_000_001 ;
			3'b001:DATA_OUT<=8'b00_000_010 ;
			3'b010:DATA_OUT<=8'b00_000_100 ;
			3'b011:DATA_OUT<=8'b00_001_000 ;
			3'b100:DATA_OUT<=8'b00_010_000 ;
			3'b101:DATA_OUT<=8'b00_100_000 ;
			3'b110:DATA_OUT<=8'b01_000_000 ;
			3'b111:DATA_OUT<=8'b10_000_000 ;
			default: DATA_OUT<=8'b00_000_000 ;
		endcase
	end
endmodule