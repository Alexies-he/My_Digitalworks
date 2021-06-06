module mul_addtree_2_stage (
    input [3:0]x,y,
    input clk,clr,
    output [7:0]out
);
    wire [3:0] stored1,stored2,stored3,stored4,out1,out2;
    reg [3:0] add_tmp1,add_tmp2;
    reg [7:0] out;
    assign stored1 = y[3]?{1'b0,y[3:0],3'b0}:8'b0;//8'b0=00000000,不用把零都打出来
    assign stored2 = y[2]?{2'b0,y[3:0],2'b0}:8'b0;
    assign stored3 = y[1]?{3'b0,y[3:0],1'b0}:8'b0;
    assign stored4 = y[0]?{4'b0,y[3:0]}:8'b0;
    always @(posedge clk or negedge clr)begin
        if (!clr) begin//记得时序电路要设置初态
            add_tmp1<=8'b0;
            add_tmp2<=8'b0;
            out<=8'b0;
        end else begin//注意流水线的语句写法，对于流水线理解要深
        add_tmp1<=stored1+stored2;
        add_tmp2<=stored3+stored2;
        out<=add_tmp1+add_tmp2;
        end
    end
endmodule