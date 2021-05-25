module counter_2 (
    input cp,
    input rst,
    output reg Q0
);
always @(posedge cp or negedge rst) begin//注意上升沿
    if (~rst) begin
        Q0<=1'b0;
    end else begin
        Q0<=~Q0;
    end
end
endmodule
module counter_4 (
    input cp,rst,
    output Q1,Q0
);
    counter_2 U1(.cp(cp),.rst(rst),.Q0(Q0));
    counter_2 U2(.cp(~w1),.rst(rst),.Q0(Q1));
endmodule