`timescale 1ps/1ps
module tb_SR_latch;
reg S,R;//申明输入信号
wire Q,q;//申明输出信号
initial 
	begin
    $display("start a clock pulse");
    $dumpfile("tb_SR_latch.vcd");
    $dumpvars(0,tb_SR_latch);
S=0;R=0;
#15
S=0;R=1;
#15
S=1;R=0;
#15
S=1;R=1;
#15
S=0;R=1;
#15
S=1;R=0;
#15
S=0;R=0;
#15
$stop;
$finish;
	end
SR_latch U1(.S(S),.R(R),.Q(Q),.q(q));//注意不仅要有把输入信号与加法器相连，testbench的输出也要与加法器相连
endmodule