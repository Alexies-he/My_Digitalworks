module nzp (
	input [15:0]D_IN,
	input LD,
	output [2:0]NZP
);
	wire [1:0] SEL;
	comparetor com(.A(D_IN),.B({16{1'b0}}),.LD(LD),.OUT(SEL));
	mux16_4to1 #(3)mux(.SEL(SEL),.D_IN0(NZP),.D_IN1(3'b001),.D_IN2(3'b010),.D_IN3(3'b100),.D_OUT(NZP));
endmodule