module sp6_ex3 (
	input ext_clk_25m,
	input ext_rst_n,
	input SW,
	output reg beep
);
	always @(posedge ext_clk_25m or negedge ext_rst_n) begin
		if (!ext_rst_n) begin
			beep<=1'b0;
		end else begin
			if (!SW) begin
				beep<=1'b1;
			end else begin
				beep<=1'b0;
			end
		end
	end
endmodule