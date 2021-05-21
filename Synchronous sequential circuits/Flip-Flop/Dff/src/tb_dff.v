`timescale 1ns/1ns
module tb_dff;
reg D,clk;//申明输入信号
wire Q;
wire q;//申明输出信号
initial 
	begin
	$display("start a clock pulse");
    $dumpfile("tb_dff.vcd");
    $dumpvars(0,tb_dff);
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