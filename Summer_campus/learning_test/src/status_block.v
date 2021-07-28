module status_block #(
	parameter DATA_SIZE = 8,
	parameter ADDR_DEPTH = 8
) (
	wr_ptr,rd_ptr,wr_en,rd_en,clk,//input port
	fifo_full,fifo_empty,fifo_count,valid_rd,valid_wr
);
	input [ADDR_DEPTH-1:0]wr_ptr,rd_ptr;
	input wr_en,rd_en,clk,reset_n;
	output reg fifo_count,fifo_full,fifo_empty,valid_wr,valid_rd;
	always @(posedge clk or negedge reset_n) begin
		if(!reset_n) begin
			fifo_empty<=1'b1;
			fifo_full<=1'b0;
		end
		else if ( wr_en & wr_ptr==ADDR_DEPTH-1)begin
			valid_wr=1'b0;
			fifo_full=1'b1;
			fifo_count=1'b0;
		end
		else if (wr_en & wr_ptr!=ADDR_DEPTH-1) begin
			valid_wr=1'b1;
			fifo_count=1'b1;
		end
		else if (rd_en & rd_ptr==ADDR_DEPTH-1) begin
			valid_rd=1'b0;
			fifo_empty=1'b1;
			fifo_count=1'b0;
		end
		else if (rd_en & rd_ptr!=ADDR_DEPTH-1) begin
			valid_rd=1'b1;
			fifo_count=1'b1;
		end
		else
			begin
				valid_rd=1'b0;valid_wr=1'b0;fifo_full=1'b0;fifo_empty=1'b1;fifo_count=1'b0;
			end
	end
endmodule