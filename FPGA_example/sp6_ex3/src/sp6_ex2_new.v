module ep6_ex2_new (
	input ext_clk_25m,
	input ext_rst_n,
	input SW,
	output reg beep
);
reg [19:0] count;
	always @(posedge ext_clk_25m or negedge ext_rst_n) begin
		if (!ext_rst_n) begin
			count<=20'd0;
		end else begin
			if (count<20'd999_999) begin
				count<=count+1'b1;
			end else begin
				count<=20'd0;
			end
		end
	end
	always @(posedge ext_clk_25m or negedge ext_rst_n) begin
		if (!ext_rst_n) begin
			beep<=1'b0;
		end else begin
			if (!SW&count<20'd500_000) begin
				beep<=1'b1;
			end else begin
				beep<=1'b0;
			end
		end
	end
endmodule