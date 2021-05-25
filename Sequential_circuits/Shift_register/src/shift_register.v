module shift_register (
    input clk,
    input data_in,
    input rst,
    output reg [SG_width-1:0] data_out
);
    parameter SG_width =4;
    always @(clk) begin
        if (!rst) begin
            data_out=4'b0000;
        end else begin
            data_out<={data_out[SG_width-2:0],data_out[SG_width-1]};
        end
    end
endmodule