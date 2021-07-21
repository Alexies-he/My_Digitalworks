module pc_reg (
	input CLK,RESET,LD,
	input [15:0]DATA_IN,
	output reg [15:0]DATA_OUT
);
	always @(posedge CLK or negedge RESET) begin
		if(RESET) begin
			DATA_OUT<={16{1'b0}};
		end
		else begin
		  if(LD==1'b1) begin//LD为1为读取
			DATA_OUT<=DATA_IN;
		  end
		  else 
		  begin
		    	DATA_OUT<=DATA_OUT;
		  end
		end
	end
endmodule
