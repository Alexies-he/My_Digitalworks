`timescale 1ns/1ns
module tb_Flow_Control_Flow;
reg Valid_i,Ready_i,CLK,RESET_n;//申明输入信号
reg [7:0] Data_i;
reg [3:0] i;
wire [7:0]Data_o;
wire Ready_o;//申明输出信号
Flow_Control_Flow F1(.Valid_i(Valid_i),.Ready_i(Ready_i),.Valid_o(Valid_o),.Ready_o(Ready_o),.Data_i(Data_i),.CLK(CLK),.RESET_n(RESET_n),.Data_o(Data_o));
initial 
	begin
    $dumpfile("tb_Flow_Control_Flow.vcd");
    $dumpvars(0,tb_Flow_Control_Flow);	
    	end
initial begin
	CLK=0;
	repeat(100) #10 CLK=~CLK;
end
initial begin
RESET_n=0;Valid_i=1'b0;Ready_i=1'b0;
#10 RESET_n=1;
Valid_i=1;Ready_i=1;
Data_i=8'b00000001;
for(i=0;i<10;i=i+1)begin
  #20 Data_i=Data_i+1;
end

$stop;
$finish;
end
initial begin
#100Valid_i=1;Ready_i=0;
#100;
Valid_i=1;Ready_i=1;
end
endmodule