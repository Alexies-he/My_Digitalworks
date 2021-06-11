module fifo_top (
	input write_signal,read_signal,clk,rst_n,
	input [7:0] data_in,
	output [7:0] data_out
);
wire [2:0]write_addr,read_addr;
wire fall,empty;
	control_module C1(.write_signal(write_signal),.read_signal(read_signal),.clk(clk),.rst_n(rst_n),.write_addr(write_addr),.read_addr(read_addr),.fall(fall),.empty(empty));
	ram_module R2(.write_addr(write_addr),.read_addr(read_addr),.data_in(data_in),.data_out(data_out),.clk1(clk),.clk2(clk),.wr(write_signal),.rd(read_signal));
endmodule