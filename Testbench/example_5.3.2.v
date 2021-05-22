module tb_monitor;
integer a,b;
    initial begin
        a=2;
        b=4;
        forever begin
            #5 a=a+b;//5个时间单位延时后，阻塞赋值把a+b给a
            #5 b=a-1;
        end
    end
    initial begin
        #40 $finish;
    end
    initial begin
        $monitor($time,"a=%d,b=%d",a,b);
    end
endmodule