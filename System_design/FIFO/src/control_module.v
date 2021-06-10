module control_module (
	input clk,rst,
	input write_signal,read_signal,
	output reg[2:0] write_addr,read_addr
);
reg write_full,read_empty;
reg [3:0] write_index,read_index;
	always @(posedge clk or negedge rst) begin
		if (rst) begin
			if (write_signal & ~write_full) begin
				if (write_index<8) begin
					write_index=write_index+1;
					write_addr=write_index-1;
				end else begin
					write_full=1'b1;
					write_index=4'b0001;
					write_addr=3'b0;
				end
			end else begin
				write_addr=3'b000;
			end
			if (read_signal) begin
				if (read_index<8) begin
					read_index=read_index+1;
					read_addr=read_index-1;
				end else begin
					read_empty=1'b1;
					read_index=4'b0001;
					read_addr=3'b000;
				end
			end else begin
				read_addr=3'b000;
			end
		end else begin
			write_index=4'b0000;
			write_addr=3'b000;
			read_index=4'b0000;
			read_addr=3'b000; 
			write_full=1'b0;
			read_empty=1'b0;
		end
	end
endmodule