module two_divider(
    input cp,rst,
    output reg Q0,
    output q
);//行为级建模
    always @(posedge cp or negedge rst) begin
        if (!rst) begin
            Q0<=0;
        end else begin
             Q0<=~Q0;
        end
    end
    assign q=~Q0;
endmodule
module two_four_divider (
    output Q0,Q1,
    input cp,rst
);
wire w1;
    two_divider U1(.cp(cp),.rst(rst),.Q0(Q0),.q(w1));
    two_divider U2(.cp(w1),.rst(rst),.Q0(Q1),.q());
endmodule