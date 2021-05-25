`timescale 1ns/1ns
module tb_one_bitadder;
reg a,b,c_in;//申明输入信号
wire sum,c_out;//申明输出信号
initial 
	begin
a=0;b=0;c_in=0;
#1
a=0;b=0;c_in=1;
#1
a=1;b=0;c_in=0;
#1
a=0;b=1;c_in=0;
#1
a=1;b=1;c_in=0;
#1
a=1;b=1;c_in=1;
#1
a=0;b=0;c_in=0;
$stop;
	end
one_bit_fulladder U1(.a(a),.b(b),.c_in(c_in),.sum(sum),.c_out(c_out));//注意不仅要有把输入信号与加法器相连，testbench的输出也要与加法器相连
endmodule