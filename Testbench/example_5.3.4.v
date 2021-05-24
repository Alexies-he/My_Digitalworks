`timescale 1ns/1ns
module tb_time;
reg ts;
parameter delay =4 ;
initial begin
    #delay ts=1;
    #delay ts=0;
    #delay ts=1;
    #delay ts=0;
end
initial begin
    $monitor($time,,,"ts=%d",ts);
end
endmodule