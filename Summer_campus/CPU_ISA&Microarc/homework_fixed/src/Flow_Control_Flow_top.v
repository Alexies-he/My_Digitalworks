module Flow_Control_Flow (
	input Valid_i,Ready_i,CLK,RESET_n,
	input [7:0]Data_i,
	output [7:0]Data_o,
	output wire Ready_o,Valid_o
);
	wire [2:0] LD;
	wire [1:0] addr;
	wire [7:0] Q1,Q2,Q3,Q4;
	wire Q5,Q6,Q7,Q8,Q9,Q10;
	wire [7:0] Data_o_DFF,ram_out;
	wire [1:0]  SEL;
	
	assign SEL[0] = Ready_o;
	assign SEL[1] = Ready_i;
	
	control control(.Valid_i(Valid_i),.LD(LD));
	counter count(.CLK(CLK),.addr(addr),.Reset_n(RESET_n));
	//ram_1 #(8,2)ram(.clk(CLK),.wr_(Ready_i),.addr(addr),.ram_in(Q3),.ram_out(ram_out));
	ram MEM(.WE(Ready_i), .ADDRESS(addr),.ram_in(Q4),.ram_out(ram_out));
	DFF#(8) D0(.D(Data_i),.CLK(CLK),.RESET_n(RESET_n),.LD(LD[0]),.Q(Q1));
	DFF#(8) D1(.D(Q1),.CLK(CLK),.RESET_n(RESET_n),.LD(LD[1]),.Q(Q2));
	DFF#(8) D2(.D(Q2),.CLK(CLK),.RESET_n(RESET_n),.LD(LD[2]),.Q(Q3));
	DFF#(8) D3(.D(Q3),.CLK(CLK),.RESET_n(RESET_n),.LD(LD[2]),.Q(Q4));
	
	DFF#(8) Delay0(.D(Ready_i),.CLK(CLK),.RESET_n(RESET_n),.LD(1'b1),.Q(Q5));
	DFF#(8) Delay1(.D(Q5),.CLK(CLK),.RESET_n(RESET_n),.LD(1'b1),.Q(Q6));
	DFF#(8) Delay2(.D(Q6),.CLK(CLK),.RESET_n(RESET_n),.LD(1'b1),.Q(Q7));
	DFF#(8) Delay3(.D(Q7),.CLK(CLK),.RESET_n(RESET_n),.LD(1'b1),.Q(Ready_o));
	
	DFF#(8) Delay4(.D(Valid_i),.CLK(CLK),.RESET_n(RESET_n),.LD(1'b1),.Q(Q8));
	DFF#(8) Delay5(.D(Q8),.CLK(CLK),.RESET_n(RESET_n),.LD(1'b1),.Q(Q9));
	DFF#(8) Delay6(.D(Q9),.CLK(CLK),.RESET_n(RESET_n),.LD(1'b1),.Q(Q10));
	DFF#(8) Delay7(.D(Q10),.CLK(CLK),.RESET_n(RESET_n),.LD(1'b1),.Q(Valid_o));
	mux8_4to1 mux8_4to1(.SEL(SEL),.D_IN0(),.D_IN1(),.D_IN2(ram_out),.D_IN3(Q4),.D_OUT(Data_o));

endmodule

