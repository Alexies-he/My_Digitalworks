`include "/Users/alexieshe/Desktop/MyDigitalworks/My_Digitalworks/Summer_campus/CPU_ISA&Microarc/homework/src/control.v"
`include "/Users/alexieshe/Desktop/MyDigitalworks/My_Digitalworks/Summer_campus/CPU_ISA&Microarc/homework/src/DFF.v"
`include "/Users/alexieshe/Desktop/MyDigitalworks/My_Digitalworks/Summer_campus/CPU_ISA&Microarc/homework/src/counter.v"
`include "/Users/alexieshe/Desktop/MyDigitalworks/My_Digitalworks/Summer_campus/CPU_ISA&Microarc/homework/src/ram_1.v"
module Flow_Control_Flow (
	input Valid_i,Ready_i,CLK,RESET_n,
	input [7:0]Data_i,
	output [7:0]Data_o,
	output Ready_o,Valid_o
);
	wire [2:0] LD;
	wire [1:0] addr;
	wire [7:0] Q1,Q2,Q3;
	wire [7:0] Data_o_DFF,Data_o_ram;
	assign Data_o_DFF=Q3;

	control c1(.Valid_i(Valid_i),.Ready_i(Ready_i),.Valid_o(Valid_o),.Ready_o(Ready_o),.LD(LD),.Data_o(Q3));
	counter count(.CLK(CLK),.addr(addr),.Reset_n(RESET_n));
	ram_1 #(8,2)ram(.clk(CLK),.wr_(Ready_i),.addr(addr),.data_in(Data_o_DFF),.data_out(Data_o_ram));
	DFF#(8) D0(.D(Data_i),.CLK(CLK),.RESET_n(RESET_n),.LD(LD[0]),.Q(Q1));
	DFF#(8) D1(.D(Q1),.CLK(CLK),.RESET_n(RESET_n),.LD(LD[1]),.Q(Q2));
	DFF#(8) D2(.D(Q2),.CLK(CLK),.RESET_n(RESET_n),.LD(LD[2]),.Q(Q3));

endmodule