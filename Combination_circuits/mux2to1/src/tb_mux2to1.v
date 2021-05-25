`timescale 1ns/1ns
module tb_mux2to1;
reg D0,D1,S;//申明输入信号
wire Y;//申明输出信号
initial 
	begin
S=0;D1=0;D0=0;
#1
S=0;D1=0;D0=1;
#1
S=0;D1=1;D0=0;
#1
S=0;D1=1;D0=1;
#1
S=1;D1=0;D0=0;
#1
S=1;D1=0;D0=1;
#1
S=0;D1=1;D0=0;
#1
S=0;D1=1;D0=1;
#1
S=0;D1=0;D0=0;
#1
$stop;
end
mux2to1 mux2to1_inst(.D0(D0),.D1(D1),.S(S),.Y(Y));
endmodule
