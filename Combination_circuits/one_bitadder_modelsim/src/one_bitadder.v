module one_bit_fulladder(sum,c_out,a,b,c_in);
parameter bit_num=1;
	input [bit_num-1:0]a;
	input [bit_num-1:0]b;
	input c_in;
	output [bit_num-1:0]sum;
	output c_out;
		assign {c_out,sum}=a+b+c_in;
endmodule
