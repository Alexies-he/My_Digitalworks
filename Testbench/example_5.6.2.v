`timescale 1ns/1ps
module tb_sequence();//数据信号测试向量的产生
    reg [3:0] q_out;
    parameter sample_period =4 ;
    parameter queue_num = 2;
    initial begin
        $dumpfile("tb_sequence");
        $dumpvars(0,tb_sequence);
        q_out=0;
        repeat(queue_num)begin
          #sample_period q_out=1;
          #sample_period q_out=2;
          #sample_period q_out=3;
          #sample_period q_out=5;
          #sample_period q_out=7;
          #sample_period q_out=11;
          #sample_period q_out=13;
        end
    end
endmodule