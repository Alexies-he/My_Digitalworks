`timescale 1ns/1ps//计时单位值/计时精度值（采样频率）
module tb_realtime;
    reg ts;
    parameter delay = 0.1;
    initial begin
        #10;
    #delay ts=1;
    #delay ts=0;
    #delay ts=1;
    #delay ts=0;
    end
    initial begin
        $monitor($realtime,,"ts=%d",ts);
    end
endmodule