module Duty_cycle (
    output clk
);//调控占空比
parameter High_time =5,
           Low_time=20 ;
reg clk;
initial begin
    $dumpfile("tb_Duty_cycle");
    $dumpvars(0,Duty_cycle);
    repeat(10) begin
    clk=0;
    #Low_time clk=1;
    #High_time clk=0;
        end
end
endmodule