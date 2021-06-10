module fifo_top (
	input write_signal,read_signal,clk,rst,
	input [7:0] data_in,
	output [7:0] data_out
);
	control_module C1(.write_signal(write_signal),.read_signal(read_signal),.clk(clk),.rst(rst),.stack_full(),.stack_empty(),.write_addr(),.read_addr());
	ram_module R2(.addr_in(),.addr_out(),.data_in(),.data_out(),.clk(),.rst());
endmodule