module comparetor (
	input [15:0]A,B,
	input LD,
	output reg [1:0] OUT
);
	always @(A or B or LD) begin
		if(LD) begin
			if (A[15]>B[15]) begin
				OUT<=2'b11;//在上层比较中，如果A=1代表负数，因此D_IN<0,选择2’b11信号
			end 
			else if(A[14:0]==B[14:0]) begin
				OUT<=2'b10;
			end
			else if(A[14:0]>B[14:0]) begin
				OUT<=2'b01;
			end
		end
		else begin
		  OUT<=2'b00;
		end
	end
endmodule