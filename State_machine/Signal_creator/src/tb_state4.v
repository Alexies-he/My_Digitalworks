`timescale 1ns/1ns
module tb_state4;
reg clk,clr;//申明输入信号
wire [3:0]out;//申明输出信号
state4 U1(.clr(clr),.clk(clk),.out(out));//调用模块实例化
initial 
	begin
	$display("start a clock pulse");
    $dumpfile("tb_state4.vcd");
    $dumpvars(0,tb_state4);
	end
initial begin
    clr=1;clk=1;
    #5 clr=0;clk=0;
    #5 clr<=1;
    #2 clk=1;
    repeat(15)
     #5 clk = !clk;
end
endmodule