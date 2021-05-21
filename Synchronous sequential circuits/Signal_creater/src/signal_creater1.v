module signal_creater_1 (
    input clk,load,
    input [5:0] D,
    output out
);
    reg [5:0]Q;
    initial begin
        Q<=6'b100111;
    end
    always @(posedge clk) begin
        if (!load) begin
            Q[5:0]<=D[5:0];
        end else begin
            Q<={Q[4:0],Q[5]};
        end
    end
    assign out=Q[5];
endmodule