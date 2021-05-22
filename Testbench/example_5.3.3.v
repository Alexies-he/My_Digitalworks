module tb_strobe;
reg a,b;
    initial begin
        a=0;//阻塞赋值
        $display("a by display is:",a);
        $strobe("a by strobe is:",a);
        a=1;
    end
    initial begin//两个initial语句并行运行
        b<=0;
        $display("b by display is:",b);
        $strobe("b by display is:",b);
        #5;
       $display("#5 b by display is:",b);
        $strobe("#5 b by display is:",b);
        b<=1;
    end
endmodule