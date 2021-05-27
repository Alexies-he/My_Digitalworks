module clk1 (
    output clk
);//占空比50%的时钟信号
   parameter clk_period = 10;
   reg clk;
   initial begin
       $dumpfile("tb_clk1");
       $dumpvars(0,clk1);
       clk=0;
       repeat(10) begin
           #clk_period clk=~clk;
       end
   end 
endmodule