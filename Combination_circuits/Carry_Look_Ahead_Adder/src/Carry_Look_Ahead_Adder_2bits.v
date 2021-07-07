module two_bits_fastadder(sum_out,c_out,a,b,c_in);
	input [1:0] a,b;
	input c_in;
	output [1:0] sum_out;
	output c_out;
	wire [2:0] g,p,c;
		assign g=a&b;//按位与运算
		assign p=a^b;
		assign c[0]=c_in;
		assign c[1]=g[0]|p[0]&c[0];
		assign c[2]=g[1]|p[1]&c[1];
		assign sum_out=p^c[1:0];//异或操作
		assign c_out=c[2];
endmodule