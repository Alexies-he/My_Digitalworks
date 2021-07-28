module FIFO_Memory #(
	parameter DATA_SIZE = 16,
	parameter ADDR_DEPTH = 16
) (
	clk,wr_data,wr_addr,wr_fifo,//input port
	rd_data,rd_addr,rd_fifo     //output port
);
	input clk;
	input [DATA_SIZE-1:0]wr_data;
	input [ADDR_DEPTH-1:0]wr_addr,rd_addr;
	input wr_fifo,rd_fifo;
	output reg [DATA_SIZE-1:0]rd_data;
	reg [DATA_SIZE-1:0] ram [0:ADDR_DEPTH-1];
	always @(posedge clk) begin
		if (wr_fifo&!rd_fifo) begin
			ram[wr_addr]<=wr_data;
		end 
		else if(!wr_fifo&rd_fifo) begin
			rd_data<=ram[rd_addr];
		end
		else begin
			rd_data<=rd_data;
		end
	end
endmodule