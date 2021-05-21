module set_ret_dff (
    output reg Q,
    output reg q,
    input D,clk,Sd,Rd
);
    always @(posedge clk,negedge Sd,negedge Rd) begin
        if (~Sd||~Rd) begin
            if (~Sd) begin
                Q<=1'b1;
                q<=1'b0;
            end else begin
                Q<=1'b0;
                q<=1'b1;
            end
        end else begin
            Q<=D;
        end
    end
endmodule