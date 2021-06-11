module control_module
#(
	parameter  DATA_WIDTH =  8,
	parameter  DATA_DEPTH =  8,
	parameter  RAM_DEPTH  =  (1 << DATA_DEPTH)
)
(
	input      							clk,
	input      							rst_n,
	input  	  [DATA_WIDTH-1:0]   data_in,
	input      							write_signal,
	input      							read_signal,
	output  reg   				[2:0]  write_addr,read_addr,data_addr,
	output 								fall,empty
);

	assign fall=(data_addr==DATA_DEPTH-1)?1'b1:1'b0;
	assign empty=(data_addr==1'b0)?1'b1:1'b0;
//-------------------------------------------------------
	always @(posedge clk or negedge rst_n)begin
		if(rst_n == 1'b0)begin
			write_addr <= 0;
		end
		else if(write_addr == RAM_DEPTH-1)
			write_addr <= 0;
		else if(write_signal)begin
			write_addr <= write_addr + 1'b1;
		end
		else
			write_addr <= write_addr;
	end

//-------------------------------------------------------
	always @(posedge clk or negedge rst_n)begin
		if(rst_n == 1'b0)begin
			read_addr <= 0;
		end
		else if(read_addr == RAM_DEPTH-1)
			read_addr <= 0;
		else if(read_signal)begin
			read_addr <= read_addr + 1'b1;
		end
		else
			read_addr <= read_addr;
	end
///-------------------------------------------------------
	always @(posedge clk or negedge rst_n) begin
		if (rst_n==1'b0) begin
			data_addr=0;
		end 
		else if (read_signal&&!write_signal&&data_addr!=0) begin
			data_addr<=data_addr-1;
		end
		else if (!read_signal&&write_signal&&data_addr!=DATA_DEPTH-1) begin
			data_addr<=data_addr+1;
		end
		else begin
			data_addr<=data_addr;
		end
	end
endmodule