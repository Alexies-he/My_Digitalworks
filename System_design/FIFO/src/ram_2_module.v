module ram_module (
	input[7:0]data_in,
	input [2:0]write_addr,read_addr,
	input wr,rd,
	input clk1,clk2,
	output reg[7:0]data_out
);
	reg [7:0]mem[7:0];
	always @(posedge clk1) begin
		if (wr) begin
			mem[write_addr]<=data_in;
		end else begin
			
		end
	end
	always @(posedge clk2 ) begin
		if (rd) begin
			data_out<=mem[read_addr];
		end else begin
			
		end
	end
endmodule