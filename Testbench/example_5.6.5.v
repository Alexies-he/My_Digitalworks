`timescale 1ns/1ns
module shift_Duty_cycle (
    output clk1,clk2
);//具有相位偏移的信号
reg clk1;
   parameter High_time =5,
             Low_time =5,
             pshift_time =2; 
    initial begin
    $dumpfile("tb_shift");
    $dumpvars(0,shift_Duty_cycle);
        repeat(10)begin
          clk1=1;
          #High_time;
          clk1=0;
          #Low_time;
        end
    end
    assign #pshift_time clk2=clk1;//偏移的相位=360*pshift_time/(High_time+Low_time)
endmodule