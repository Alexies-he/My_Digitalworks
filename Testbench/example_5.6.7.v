module tb_bus_wr (
    
);//具有写操作的AHB总线功能模型
reg clk;
reg cs;//片选信号，低电平有效
reg wr;//写信号，低电平有效
reg [31:0] addr;
reg [31:0] data;
initial begin
$dumpfile("tb_bus_wr");
$dumpvars(1,tb_bus_wr);
end
initial begin
    clk=1;
    repeat(100)begin
      #5 clk=~clk;
    end
end
initial begin
    cs=1'b1;wr=1'b1;
    #30;
    bus_wr(32'h1100008a,32'h11113000);//调用了bus_wr的任务模块
    bus_wr(32'h1100009a,32'h1113001);
    bus_wr(32'h110000aa,32'h11113002);
    bus_wr(32'h1100008a,32'h11113000);
    bus_wr(32'h1100009a,32'h1113001);
    bus_wr(32'h110000aa,32'h11113002);
end
    task bus_wr;
    input [31:0]ADDR;
    input [31:0]DATA;
    begin
      #10cs=1'b0;
      wr=1'b0;
      addr=ADDR;//addr是顶层模块选取地址操作，ADDR是外部给出的地址值
      data=DATA;
      #30 cs=1'b1;wr=1'b1;
    end
    endtask
endmodule