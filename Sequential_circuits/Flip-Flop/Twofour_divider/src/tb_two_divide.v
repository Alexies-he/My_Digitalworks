`timescale 1ns/1ns
module tb_two_divide;
reg cp,rst;//申明输入信号
wire Q1,Q0;//申明输出信号
initial 
	begin
	$display("start a clock pulse");
    $dumpfile("tb_two_divide.vcd");
    $dumpvars(0,tb_two_divide);
cp=0;rst=0;//输入信号的波形
#10
cp=1;rst=0;
#10
cp=0;rst=0;//输入信号的波形
#10
cp=1;rst=1;
#10
cp=0;rst=1;
#10
cp=1;rst=1;
#10
cp=0;rst=1;
#10
cp=1;rst=1;
#10
cp=0;rst=1;
#10
cp=1;rst=1;
#10
cp=0;rst=0;
#10
cp=1;rst=0;
#10
cp=0;rst=0;
#10
cp=1;rst=0;
#10
cp=0;rst=0;
#10
cp=1;rst=0;
#10
$stop;
$finish;
    end
    two_four_divider U1(.cp(cp),.rst(rst),.Q1(Q1),.Q0(Q0));
endmodule