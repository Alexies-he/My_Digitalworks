`timescale 1ns/1ns
module tb_mul_addtree_2_stag;
reg [3:0]x,y;
reg clk,clr;//申明输入信号
wire [7:0]out;//申明输出信号
mul_addtree_2_stage U1(.x(x),.y(y),.clk(clk),.clr(clr),.out(out));
    initial 
    begin
	$display("start a clock pulse");
    $dumpfile("tb_mul_addtree_2_stag.vcd");
    $dumpvars(0,tb_mul_addtree_2_stag);
    end
    initial
        begin clk=0;clr=0;x=5;y=5;
        #5
        clr=1;
    repeat(100)
        #10
        clk=~clk;
        end
    initial begin
        repeat(10)
        begin
        #20 x=x+1;y=y+1;
        end
    end
endmodule