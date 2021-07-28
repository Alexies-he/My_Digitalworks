module DFF #(
	parameter DATA_SIZE = 8
) (
	input [DATA_SIZE-1:0]D,
	input CLK,RESET_n,LD,
	output reg[DATA_SIZE-1:0]Q
);
	always @(posedge CLK or negedge RESET_n) begin
		if(!RESET_n) begin
			Q <= 0;
		end
		else begin
		  if (LD) begin
			  Q<=D;
		  end else begin
			  Q<=Q;
		  end
		end
	end
endmodule