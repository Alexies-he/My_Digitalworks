module mem;
reg [7:0] mem [127:0];//定义了一个8位宽，128个比特深度的存储器
reg [15:0] a;//a为地址变量;且只有寄存器类型与端口连接
reg [31:0] b;//b为读取出的输出
initial begin
    a=0;
    read_memory(a,b);//a与b分别与地址以及数据端口连接
    #10;
    a=64;
    read_memory(a,b);
end
task read_memory;//读存储器例子
    input [15:0] address;
    output [31:0] data;
    reg [3:0]counter;
    reg [7:0]temp[1:4];//一个具有四个八位寄存器的存储器
    begin//语句块任务被调用时执行
      for(counter=1;counter<=4;counter=counter+1)
      temp[counter]=mem[address+counter-1];
      data={temp[1],temp[2],temp[3],temp[4]};
    end
endtask
 endmodule