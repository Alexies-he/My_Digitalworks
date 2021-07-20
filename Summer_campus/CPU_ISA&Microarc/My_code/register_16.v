module register_16 #(
	parameter WIDTH = 16
) (
	input LD,
	input [WIDTH-1:0]DATA_IN,
	output reg [WIDTH-1:0]DATA_OUT
);
	always @(LD or DATA_IN) begin
		if(LD==1'b1) begin
			DATA_OUT=DATA_IN;
		end
		else DATA_OUT=DATA_OUT;
	end
endmodule