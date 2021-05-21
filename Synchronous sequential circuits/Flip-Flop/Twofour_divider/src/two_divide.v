module dff(
    input cp,rst,
    output reg Q0
);//行为级建模
    always @(posedge cp or negedge rst) begin
        if (!rst) begin
            Q0<=0;
        end else begin
             Q0<=~Q0;
        end
    end
endmodule