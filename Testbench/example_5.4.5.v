module clk_time (
    input clk
);
 time posedge_time,negedge_time;
 time high_last_time,low_last_time,last_time;
 initial begin
     @(posedge clk);//等待，直到时钟发生正跳变后退出等待状态
     posedge_time=$time;
     @(negedge clk);
     negedge_time=$time;
     high_last_time=negedge_time-posedge_time;
     low_last_time=last_time-high_last_time;
     $display("The clk stay in High level for:%t",high_last_time);
     $display("The clk stay in Low level for:%t",low_last_time);
     $display("The clk signal Period is :%t",last_time);
          end 
endmodule