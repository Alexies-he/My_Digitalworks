`timescale 1ns/1ns
module tb_control_module;
reg clk,rst,write_signal,read_signal;//申明输入信号
wire [2:0]write_addr,read_addr;//申明输出信号
control_module U1(.clk(clk),.rst(rst),.write_signal(write_signal),.read_signal(read_signal),.write_addr(write_addr),.read_addr(read_addr));//调用模块实例化
initial 
	begin
	$display("start a clock pulse");
    	$dumpfile("tb_control_module.vcd");
    	$dumpvars(0,tb_control_module);
	end
initial begin
	clk=0;rst=0;
	repeat(50)
	#5 clk=!clk;
	$stop;
end
initial begin
	write_signal=0;read_signal=0;
	#15 rst=1;#15 write_signal=1; #120 write_signal=0;
end
initial begin
	#125 read_signal=1;
end
endmodule