`timescale 1ns/1ns
module tb_signal_creater2;
reg clk,load;
reg [0:3]D;//申明输入信号
wire out;//申明输出信号
initial 
	begin
	$display("start a clock pulse");
    $dumpfile("tb_signal_creater2.vcd");
    $dumpvars(0,tb_signal_creater2);
clk=0;load=0;D=4'b1001;//输入信号的波形
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
clk=0;load=1;D=4'b1001;
#10
clk=1;load=1;D=4'b1001;
#10
$stop;
$finish;
		end
signal_creater_2 U1(.clk(clk),.load(load),.out(out),.D(D));
endmodule