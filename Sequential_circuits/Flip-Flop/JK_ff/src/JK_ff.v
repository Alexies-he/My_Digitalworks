module JK_ff(
		output reg Q,
		output q,
		input J,K,clk
);
assign q=~Q;
always@(negedge clk)
	case ({J,K})
		2'b00:Q<=Q;
		2'b01:Q<=0;
		2'b10:Q<=1;
		2'b11:Q<=~Q;
	endcase
endmodule