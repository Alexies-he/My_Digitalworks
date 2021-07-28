`timescale 1ns/1ns
module tb_Flow_Control_Flow;
parameter DATA_SIZE = 8;
reg Valid_i,Ready_i,CLK,RESET_n;//申明输入信号
reg [7:0] Data_i;
wire [7:0]Data_o;
wire Ready_o;//申明输出信号
Flow_Control_Flow F1(.Valid_i(Valid_i),.Ready_i(Ready_i),.Valid_o(Valid_o),.Ready_o(Ready_o),.Data_i(Data_i),.CLK(CLK),.RESET_n(RESET_n),.Data_o(Data_o));
initial begin
$dumpfile ("tb_Control_Flow_top.vcd");
$dumpvars (0,tb_Flow_Control_Flow);

end
initial begin
	CLK=0;
	RESET_n=0;
#10 RESET_n=1;
end
always #10 CLK=~CLK;
initial begin 
#10 Data_i={$random}%(1<<DATA_SIZE);#20 Data_i={$random}%(1<<DATA_SIZE);
#20 Data_i={$random}%(1<<DATA_SIZE);#20 Data_i={$random}%(1<<DATA_SIZE);
#20 Data_i={$random}%(1<<DATA_SIZE);#20 Data_i={$random}%(1<<DATA_SIZE);
#20 Data_i={$random}%(1<<DATA_SIZE);#20 Data_i={$random}%(1<<DATA_SIZE);
#20 Data_i={$random}%(1<<DATA_SIZE);#20 Data_i={$random}%(1<<DATA_SIZE);
#20 Data_i={$random}%(1<<DATA_SIZE);
#20 
#60 Data_i={$random}%(1<<DATA_SIZE);
#20 Data_i={$random}%(1<<DATA_SIZE);#20 Data_i={$random}%(1<<DATA_SIZE);
#20 Data_i={$random}%(1<<DATA_SIZE);#20 Data_i={$random}%(1<<DATA_SIZE);
end

initial begin

#10 Valid_i=0;Ready_i=0;
#20 Valid_i=0;Ready_i=1;
#20 Valid_i=1;Ready_i=0;
#20 Valid_i=1;Ready_i=1;
#100 Valid_i=1;Ready_i=0;
#60 Valid_i=0;Ready_i=1;
#60 Valid_i=1;Ready_i=1;
end
initial begin
	#1000 
	$stop;
end
endmodule