module dff (
    input D,
    input cp,
    input rst,
    output Q,
    output q
);
    reg Q;
    assign q=!Q;
    always @(posedge cp) begin
        if (!rst) begin
            Q<=1'b0;
        end else begin
           Q<=D; 
        end
    end
endmodule