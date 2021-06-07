`timescale 1ns/1ns
module tb_wallace();
reg [3:0]x,y;//申明输入信号
wire [7:0]out;//申明输出信号
wallace_top U1(.x(x),.y(y),.out(out));//调用模块实例化
initial 
	begin
	$display("start a clock pulse");
    $dumpfile("tb_wallace.vcd");
    $dumpvars(1,tb_wallace);
	end
initial begin
    x=3;y=4;
    #20 x=2;y=3;
    #20 x=6;y=8;
end
endmodule