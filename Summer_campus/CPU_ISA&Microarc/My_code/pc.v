module pc (
	input CLK,
	input [1:0]PCSEL,//模式选择信号
	input [15:0]OFFSET,DIRECT,//OFFSET;地址偏移所得指令地址、DIRECT；内存读取所得指令地址
	input RESET,//复位信号高电平复位
	input LD,//使能信号
	output 	[15:0]PC_OUT,mux_out//输出为内存地址
);
	wire [15:0] add_out;
	wire [15:0] mux_out;
	wire [15:0] PC_REG_OUT;
	mux16_4to1 mux(.SEL(PCSEL),.D_IN0(add_out),.D_IN1(OFFSET),.D_IN2(DIRECT),.D_IN3(),.D_OUT(mux_out));
	add_16 adder(.CYI(1'b0),.OP_A(PC_REG_OUT),.OP_B({{15{1'b0}},1'b1}),.CYO(),.SUM(add_out));
	pc_reg register(.CLK(CLK),.RESET(RESET),.LD(LD),.DATA_IN(mux_out),.DATA_OUT(PC_REG_OUT));
	assign PC_OUT = PC_REG_OUT;
endmodule