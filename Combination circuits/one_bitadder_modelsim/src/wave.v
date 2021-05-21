`timescale 10ns/10ns
module tb_one_bitadder;
reg a,b,c_in;//申明输入信号
wire sum,c_out;//申明输出信号
initial 
    begin
    $display("start a clock pulse");
    $dumpfile("tb_one_bitadder.vcd");
    $dumpvars(0,tb_one_bitadder);
    a=0;b=0;c_in=0;
    #1
    a=0;b=0;c_in=1;
    #1
    a=1;b=0;c_in=0;
    #1
    a=0;b=1;c_in=0;
    #1
    a=1;b=1;c_in=0;
    #1
    a=1;b=1;c_in=1;
    #1
    a=0;b=0;c_in=0;
    $stop;
    end
endmodule //wave