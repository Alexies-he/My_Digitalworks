`timescale 1ps/1ps
module D_latch_tb;
reg D,E;//申明输入信号
wire Q,q;//申明输出信号
initial 
	begin
    $display("start a clock pulse");
    $dumpfile("D_latch_tb.vcd");
    $dumpvars(0,D_latch_tb);
E=0;D=0;
#10
E=0;D=1;
#10
E=1;D=0;
#10
E=1;D=1;
#10
E=0;D=0;
#10
E=0;D=1;
#10
E=1;D=0;
#10
E=1;D=1;
#10
E=0;D=0;
#10
E=0;D=1;
#10
E=1;D=0;
#10
E=1;D=1;
#10
$stop;
$finish;
	end
D_latch U1(.D(D),.E(E),.Q(Q),.q(q));//注意不仅要有把输入信号与加法器相连，testbench的输出也要与加法器相连
endmodule
