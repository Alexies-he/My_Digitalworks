`timescale 1ns/1ns
module tb_JK_ff;
reg J,K,clk;//申明输入信号
wire Q,q;//申明输出信号
initial 
	begin
	$display("start a clock pulse");
    $dumpfile("tb_JK_ff.vcd");
    $dumpvars(0,tb_JK_ff);
clk=1;J=1;K=1;//输入信号的波形
#10
clk=1;J=1;K=0;
#2
clk=0;J=1;K=0;
#2
clk=1;J=1;K=1;
#6
clk=1;J=1;K=1;
#10
clk=0;J=0;K=1;
#10
clk=0;J=0;K=1;
#2
clk=1;J=1;K=1;
#2
clk=1;J=1;K=1;
#6
clk=0;J=1;K=1;
#2
clk=1;J=1;K=0;
#2
clk=1;J=1;K=1;
#6
$stop;
$finish;
    end
    JK_ff U1(.J(J),.K(K),.clk(clk),.Q(Q),.q(q));
endmodule