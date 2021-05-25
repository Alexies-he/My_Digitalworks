module counter_4 (
    input clk,rst,
    output reg [divider_width:0] count,
    output  out0,out1,out2,out3
);
parameter divider_width = 4;//2^（divider_width）次方的分频
    always @(posedge clk) begin
            if (!rst) begin
                count<=5'b00000;
            end else begin
                if (count==5'b01111) begin
                    count<=5'b00000;
                end else begin
                    count<=count+1;
                end

            end
    end
                    assign out0=count[0];//二分频
                    assign out1=count[1];//四分频
                    assign out2=count[2];//八分频
                    assign out3=count[3];//十六分频
endmodule