`timescale 1ns/1ns
module tb_fifo_top;
reg write_signal,read_signal,clk,rst_n;
reg [7:0] data_in;//申明输入信号
wire [7:0] data_out;//申明输出信号
fifo_top U1(.write_signal(write_signal),.read_signal(read_signal),.clk(clk),.rst_n(rst_n),.data_in(data_in),.data_out(data_out));//调用模块实例化
initial 
	begin
	$display("start a clock pulse");
    	$dumpfile("tb_fifo_top.vcd");
    	$dumpvars(0,tb_fifo_top);
	end
initial begin
	clk=0;rst_n=1;data_in=0;
	write_signal=1;read_signal=0;
	#5 rst_n=0;
	#1 rst_n=1;
	#155 write_signal=0;
		 read_signal=1;
end	
initial begin
	repeat(40)
	#10clk=!clk;
end
initial begin
	repeat(7)
	#20 data_in=data_in+1;
end
endmodule
