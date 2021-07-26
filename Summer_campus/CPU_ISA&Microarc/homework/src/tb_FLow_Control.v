`timescale 1ns/1ns
module tb_Flow_Control_Flow;
parameter DATA_SIZE = 8;
reg Valid_i,Ready_i,CLK,RESET_n;//申明输入信号
reg [7:0] Data_i;
wire [7:0]Data_o;
wire Ready_o;//申明输出信
Flow_Control_Flow F1(.Valid_i(Valid_i),.Ready_i(Ready_i),.Valid_o(Valid_o),.Ready_o(Ready_o),.Data_i(Data_i),.CLK(CLK),.RESET_n(RESET_n),.Data_o(Data_o));
initial begin
$dumpvars (0,tb_Flow_Control_Flow);
$dumpfile("tb_Flow_Control_Flow.vcd");
end
initial begin
 CLK=0;
 RESET_n=0;
#10 RESET_n=1;
end
always #10 CLK=~CLK;
always #20 Data_i={$random}%(1<<DATA_SIZE);
initial begin

#10 Valid_i=0;Ready_i=0;
#10 Valid_i=0;Ready_i=1;
#10 Valid_i=1;Ready_i=0;
#10 Valid_i=1;Ready_i=1;
#100 Valid_i=1;Ready_i=0;
#60 Valid_i=1;Ready_i=1;
#100
$stop;
$finish;
end
endmodule