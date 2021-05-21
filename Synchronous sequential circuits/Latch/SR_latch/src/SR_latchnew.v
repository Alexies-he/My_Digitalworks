module SR_latch (
				input S,
				input R,
				output Q,
				output q
);
reg Q;
assign q=!Q;
always@(S or R)
	case ({S,R})
		2'b00: Q=Q;
		2'b01: Q=1'b0;
		2'b10: Q=1'b1;
		2'b11: Q=1'bx;
	endcase
endmodule