module Databus (
	input write,//“写”信号
	input link_bus,//向总线输出信号的数据控制电平
	inout [11:0]Data_bus//12位宽的总线双向端口，总线=数据传输的高速通道
);
/*************************
 *** 模块一：数据输出到总线 **
 *************************/
	reg [11:0] insigs;//模块内的数据寄存器
	reg [13:0] outsigs;
	assign Data_bus = (link_bus)? insigs:12'hzzz;
/*******************************
 *** 模块二：接受总线上的数据并乘3 **
 *******************************/
	always @(posedge write ) begin
		outsigs<=Data_bus*3;
	end
endmodule