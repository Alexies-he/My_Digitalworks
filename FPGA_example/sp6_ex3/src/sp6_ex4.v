module sp6_ex4_LED (
	input ext_clk_25m,ext_rst_n,
	output reg [7:0]D,
	output LED_0,LED_1,LED_2,LED_3,LED_4,LED_5,LED_6,LED_7
);
	CLK U1(.ext_clk_25m(ext_clk_25m),.ext_rst_n(ext_rst_n),.clk_25(clk_25));
	assign LED_0 = D[0];
	assign LED_1 = D[1];
	assign LED_2 = D[2];
	assign LED_3 = D[3];
	assign LED_4 = D[4];
	assign LED_5 = D[5];
	assign LED_6 = D[6];
	assign LED_7 = D[7];
	always @(posedge clk_25 or negedge ext_rst_n ) begin
		if(!ext_rst_n) begin
			D<=8'b11_111_110;
		end
		else begin
		 D<={D[6:0],D[7]};
		end
	end
endmodule
module CLK (
	input ext_clk_25m,ext_rst_n,
	output reg clk_25
);
		always @(posedge ext_clk_25m or negedge ext_rst_n) begin
		if (!ext_rst_n) begin
			clk_25<=20'd0;
		end else begin
			if (clk_25<20'd999_999) begin
				clk_25<=clk_25+1'b1;
			end else begin
				clk_25<=20'd0;
			end
		end
	end
endmodule