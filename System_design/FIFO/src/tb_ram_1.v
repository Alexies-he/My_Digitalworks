`timescale 1ns/1ns
module tb_ram_1;
reg clk,wr_,cs_;
reg [2:0] addr;
reg [7:0] data_in;//申明输入信号
wire [7:0]data_out;//申明输出信号
ram_1 U1(.clk(clk),.wr_(wr_),.cs_(cs_),.addr(addr),.data_in(data_in),.data_out(data_out));//调用模块实例化
initial 
	begin
	$display("start a clock pulse");
    	$dumpfile("tb_ram_1.vcd");
    	$dumpvars(0,tb_ram_1);
	end
initial begin
	clk = 0; addr = 0; cs_ = 1; wr_ = 0;data_in=0;
	#5 cs_=0;
	#315 wr_=1;
end
initial begin
	repeat(100)
	#10 clk=!clk;
end
initial begin
	repeat(7)
	begin
	  #40 addr=addr+1;
	end
	#40
	repeat(7)
	begin
	  #40 addr=addr-1;
	end
end
initial begin
	repeat(7)
	begin
	  #40data_in = data_in+1;
	end
end
endmodule