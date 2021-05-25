module one_bitadder(
							input wire [7:0]a,
							input wire [7:0]b,
							output reg [8:0]sum
);
	always @(*)
	begin
	sum = a + b;
	end
	endmodule 