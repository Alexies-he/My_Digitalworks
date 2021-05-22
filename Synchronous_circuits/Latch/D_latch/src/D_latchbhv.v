module D_latch (
    input E,
    input D,
    output Q,
    output q
);
reg Q;
assign q=!Q;
    always @(E or D) begin
        if (E) begin
            Q<=D;
        end else begin
            Q<=Q;
        end
    end
endmodule