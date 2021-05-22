module ramdom_creater (
    input load,clk,
    input [4:0]D,
    output out

);
    reg [4:0]Q;
    always @(posedge clk) begin
        if (~load) begin
            Q<=D;
        end else begin
            Q<={F,Q[4:1]};
        end
    end
    assign F=(Q[2]^Q[0])|(~Q[4]&~Q[3]&~Q[2]&~Q[1]&~Q[0]);
    assign out=Q[4];
endmodule