module counter (
	input CLK,Reset_n,
	output reg[1:0]addr
);
	always @(posedge CLK or negedge Reset_n) begin
		if (!Reset_n) begin
			addr=2'b00;
		end else begin
			if (addr==2'b10) begin
				addr<=2'b00;
			end else begin
				addr<=addr+1'b1;
			end
		end
	end
endmodule