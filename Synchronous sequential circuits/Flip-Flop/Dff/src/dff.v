module dff (
    input D,
    input clk,
    output Q,
    output q
);
    reg Q;
    assign q=!Q;
    always @(posedge clk) begin
        Q<=D;
    end
endmodule