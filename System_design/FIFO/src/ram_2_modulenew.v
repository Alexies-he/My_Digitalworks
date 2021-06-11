module ram_2_modulenew(
	input rst_n,clk,write_signal,read_signal,
	input [7:0]data_in,
	input [3:0] write_addr,read_addr,
	output reg [7:0]data_out
);
integer   i;
	reg   [8-1:0]  register[8-1:0];
	always @(posedge clk or negedge rst_n)begin
		if(rst_n == 1'b0)begin
			for(i = 0; i < 8; i = i + 1)
				register[i] <= 0;
		end
		else if(write_signal == 1'b1)
			register[write_addr] <= data_in;
	end

	always @(posedge clk or negedge rst_n)begin
		if(rst_n == 1'b0)begin
			data_out <= 0;
		end
		else if(read_signal == 1'b1)
			data_out <= register[read_addr];
		else
			data_out <= data_out;
	end
endmodule