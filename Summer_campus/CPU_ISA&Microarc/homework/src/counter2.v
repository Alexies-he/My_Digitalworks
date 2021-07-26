module counter_r (
	input CLK,Ready_i,Valid_i,Reset,
	output reg[0:1]addr
);
	always @(posedge CLK) begin
		if (Ready_i) begin
			addr=2'b00;
		end else begin
			if (addr==2'b10) begin
				addr=2'b00;
			end else begin
				addr=addr+1;
			end
		end
	end
endmodule