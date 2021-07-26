module ram_1 #(
	parameter DATA_SIZE = 8,
	parameter DATA_DEPTH = 3
)
(
	input clk,wr_,cs_,
	input [DATA_DEPTH-1:0]addr,
	input [DATA_SIZE-1:0] data_in,
	output reg [DATA_SIZE-1:0] data_out


);
	reg [DATA_SIZE-1:0] ram [0:DATA_DEPTH-1];
	always @(posedge clk) begin
			if (!wr_) begin
				ram[addr] <= data_in;
			end else begin
				data_out <=ram[addr];
			end
		end
endmodule