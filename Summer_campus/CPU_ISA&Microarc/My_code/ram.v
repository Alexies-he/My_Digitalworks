module ram #(
	parameter DATA_SIZE = 16,
	parameter ADDR_SIZE = 16
) (
	input [DATA_SIZE-1:0]DATA_IN,
	input WE,//写/读使能信号，WE=0为写操作；WE=1为读操作
	input [ADDR_SIZE-1:0]ADDRESS,
	output reg[DATA_SIZE-1:0]DATA_OUT
);
localparam MEM_DEPTH=1<<ADDR_SIZE;
	reg [DATA_SIZE-1:0]MEM[0:MEM_DEPTH-1];
	always @(WE or DATA_IN or ADDRESS) begin
		if(WE==1'b1) begin
			DATA_OUT<=MEM[ADDRESS];
		end
		else begin
		  	MEM[ADDRESS]<=DATA_IN;
		end

	end
endmodule