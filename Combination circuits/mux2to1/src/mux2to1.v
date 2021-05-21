module mux2to1(
input D0,
input D1,
input S,
output reg Y);
always @(D0,D1,S)
	case(S)
	1'b0:Y=D0;
	1'b1:Y=D1;
	endcase
endmodule
