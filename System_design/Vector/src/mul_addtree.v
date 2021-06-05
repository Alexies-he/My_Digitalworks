module mul_addtree (
    input [3:0]x,y,
    output [7:0]out
);//down_module
    wire [3:0] stored1,stored2,stored3,stored4,out1,out2;
    assign stored1 = y[3]?{1'b0,y[3:0],3'b0}:8'b0;//8'b0=00000000,不用把零都打出来
    assign stored2 = y[2]?{2'b0,y[3:0],2'b0}:8'b0;
    assign stored3 = y[1]?{3'b0,y[3:0],1'b0}:8'b0;
    assign stored4 = y[0]?{4'b0,y[3:0]}:8'b0;
    assign out1 = stored1+stored2;//这种写法的组合电路延迟很大，out的部分电路必须等到out1与out2结果才运行，可用流水线提高速度
    assign out2 = stored3+stored4;
    assign out=out1+out2;
endmodule