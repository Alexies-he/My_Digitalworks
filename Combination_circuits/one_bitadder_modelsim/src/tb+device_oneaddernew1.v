module one_bit_fulladder(sum,c_out,a,b,c_in);
parameter bit_num=1;
	input [bit_num-1:0]a;
	input [bit_num-1:0]b;
	input c_in;
	output [bit_num-1:0]sum;
	output c_out;
		assign {c_out,sum}=a+b+c_in;
endmodule
`timescale 10ns/10ns
module tb_one_bitadder;
reg a,b,c_in;//申明输入信号
wire sum,c_out;//申明输出信号
initial 
    begin
    $display("start a clock pulse");
    $dumpfile("tb_one_bitaddernew.vcd");
    $dumpvars(0,tb_one_bitadder);
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
one_bit_fulladder U1(.a(a),.b(b),.c_in(c_in),.sum(sum),.c_out(c_out));//注意不仅要有把输入信号与加法器相连，testbench的输出也要与加法器的输出相连
endmodule