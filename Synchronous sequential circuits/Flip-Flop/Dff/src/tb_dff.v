`timescale 1ns/1ns
module tb_dff;
reg D,clk;//申明输入信号
wire Q;
wire q;//申明输出信号
initial 
	begin
    $dumpfile("tb_dff.vcd");
    $dumpvars(0,tb_dff.U1);/*$dumpvars(1,tb_dff)表示转储tb_dff模块下的第一层信号(也就是仅有测试平台的信号);
    $dumpvars(2,tb_dff)表示转储tb_dff模块下的两层信号（也就是有测试平台的端口信号+被验证的端口信号）；
    $dumpvars(0,tb_dff.U1)表示转储tb_dff.U1模块下的所以信号此时有可能报错，因为没有module dff*/
clk=0;D=0;
#10
clk=1;D=0;
#10
clk=0;D=0;
#10
clk=1;D=1;
#10
clk=0;D=1;
#10
clk=1;D=0;
#10
clk=0;D=0;
#10
$stop;
$finish;
	end
dff U1(.D(D),.clk(clk),.Q(Q),.q(q));
endmodule