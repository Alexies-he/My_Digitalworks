`timescale 1ns/1ns
module tb_int_2to4;
reg E_,a0,a1;//申明输入信号
wire out0,out1,out2,out3;//申明输出信号
initial 
	begin
	$display("start a clock pulse");
    $dumpfile("tb_int_2to4.vcd");
    $dumpvars(0,tb_int_2to4);
E_=1;a0=0;a1=0;//输入信号的波形
#10
E_=1;a0=1;a1=1;
#10
E_=0;a0=0;a1=0;//输入信号的波形
#10
E_=0;a0=0;a1=1;
#10
E_=0;a0=1;a1=0;//输入信号的波形
#10
E_=0;a0=1;a1=1;
#10
$stop;
$finish;
    end
    int_2to4 U1(.E_(E_),.a0(a0),.a1(a1),.out0(out0),.out1(out1),.out2(out2),.out3(out3));
endmodule
