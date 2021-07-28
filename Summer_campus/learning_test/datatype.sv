module data_type (
	
);
byte byte_number1 = 10_000_000;
bit [7:0]bit_number1 = 10_000_000;
initial begin
$display("%dbytenum,%dbitnum",byte_number1,bit_number1);	
end
endmodule