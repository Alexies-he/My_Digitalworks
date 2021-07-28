module rd_ptr #(
	parameter ADDR_DEPTH = 16
)
(
	clk,reset_n,valid_rd,//input port
	rd_addr	    //output port
);
	input clk,reset_n,valid_rd;
	output reg[ADDR_DEPTH-1:0] rd_addr;
	always @(posedge clk ) begin
		if (!reset_n) begin
			rd_addr<={ADDR_DEPTH{1'b0}};
		end else begin
			if(valid_rd) begin
				if(rd_addr==ADDR_DEPTH) begin
				rd_addr<={ADDR_DEPTH{1'b0}};
			end
				else begin
				rd_addr+=1;
			end
		end
			else begin
			rd_addr='bz;
		end
		end
	end
endmodule