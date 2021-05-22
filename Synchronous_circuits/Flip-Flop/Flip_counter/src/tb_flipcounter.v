`timescale 1ns/1ns
module tb_flipcounter;
reg cp,rst;//申明输入信号
wire out0,out1,out2,out3;//申明输出信号
initial 
	begin
	$display("start a clock pulse");
    $dumpfile("tb_flipcounter.vcd");
    $dumpvars(0,tb_flipcounter);
cp=1;rst=0;//输入信号的波形
#10
cp=0;rst=0;
#10
cp=1;rst=1;
#10
cp=0;rst=1;
#10
cp=1;rst=1;
#10
cp=0;rst=1;
#10cp=1;rst=1;
#10
cp=0;rst=1;
#10cp=1;rst=1;
#10
cp=0;rst=1;
#10cp=1;rst=1;
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
#10cp=1;rst=1;
#10
cp=0;rst=1;
#10cp=1;rst=1;
#10
cp=0;rst=1;
#10cp=1;rst=1;
#10
cp=0;rst=1;
#10
$stop;
$finish;
    end
    flip_counter U1(.cp(cp),.rst(rst),.out0(out0),.out1(out1),.out2(out2),.out3(out3));
endmodule
