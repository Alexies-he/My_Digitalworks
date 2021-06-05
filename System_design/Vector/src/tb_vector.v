`timescale 1ns/1ns
module tb_vector;
reg [3:0] a1,a2,a3,a4,b1,b2,b3,b4;//申明输入信号
wire [9:0]out;//申明输出信号
victor U1(.a1(a1),.b1(b1),.a2(a2),.b2(b2),.a3(a3),.b3(b3),.a4(a4),.b4(b4),.out(out));
initial 
	begin
	$display("start a clock pulse");
    $dumpfile("tb_vector.vcd");
    $dumpvars(1,tb_vector);
    a1=0;a2=0;a3=0;a4=0;
    b1=0;b2=0;b3=0;b4=0;
    repeat(5)
    #10
    a1=1;b1=1;a2=0;b2=0;a3=0;b3=0;a4=1;b4=1;
    repeat(5)
    #10
    a1=3'd1;b1=3'd1;a2=3'd2;b2=3'd2;a3=3'd3;b3=3'd3;a4=0;b4=0;
    #10
    $stop;
    $finish;
	end

endmodule