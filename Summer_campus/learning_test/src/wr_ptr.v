module wr_ptr #(
	parameter ADDR_DEPTH = 16
)
(
	clk,reset_n,valid_wr,//input port
	wr_addr	    //output port
);
	input clk,reset_n,valid_wr;
	output reg[ADDR_DEPTH-1:0] wr_addr;
	always @(posedge clk ) begin
		if (!reset_n) begin
			wr_addr<={ADDR_DEPTH{1'b0}};
		end else begin
			if(valid_wr) begin
			if(wr_addr==ADDR_DEPTH) begin
				wr_addr<={ADDR_DEPTH{1'b0}};
			end
			else begin
				wr_addr+=1;
			end
		end
		else begin
			wr_addr='bz;
		end
		end
	end
endmodule