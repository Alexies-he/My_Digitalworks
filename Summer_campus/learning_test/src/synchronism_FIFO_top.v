module synchronism_FIFO_top #(
	parameter DATA_SIZE = 8,
	parameter ADDR_DEPTH = 8
)
(
	input [DATA_SIZE-1:0]wr_data,rd_data,
	input clk,reset_n,wr_en,rd_en
);
wire [ADDR_DEPTH-1:0] wr_addr,rd_addr;
wire wr_fifo_en,rd_fifo_en;
	FIFO_Memory#(DATA_SIZE,ADDR_DEPTH) fifo_mem(.wr_data(wr_data),.rd_data(rd_data),.clk,.wr_addr(wr_addr),.rd_addr(rd_addr),.wr_fifo(wr_fifo_en),.rd_fifo(rd_fifo_en));//wr_fifo rd_fifo 分别代表读使能信号和写使能信号
	wr_ptr#(ADDR_DEPTH)wr_ptr(.clk(clk),.wr_addr(wr_addr),.valid_wr(wr_fifo_en));
	rd_ptr#(ADDR_DEPTH) rd_ptr(.clk(clk),.rd_addr(rd_addr),.valid_rd(rd_fifo_en));
	status_block#(DATA_SIZE,ADDR_DEPTH) status(.wr_ptr(wr_addr),.rd_ptr(rd_addr),.valid_rd(rd_fifo_en),.valid_wr(wr_fifo_en),.wr_en(wr_en),.rd_en(rd_en),.fifo_full(),.fifo_empty(),.fifo_count(),.clk(clk),.reset_n(reset_n));
endmodule