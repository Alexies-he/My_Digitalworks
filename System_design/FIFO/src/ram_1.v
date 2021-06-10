module ram_1 (
	input clk,wr_,cs_,
	input [2:0]addr,
	input [7:0] data_in,
	output reg [7:0] data_out

);
	reg [7:0] ram [7:0];
	always @(posedge clk ) begin
		if (cs_) begin
			data_out <= 8'bz;
		end else begin
			if (!wr_) begin
				ram[addr] <= data_in;
			end else begin
				data_out <=ram[addr];
			end
		end
	end
endmodule