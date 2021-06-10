module state4 (
    input clk,clr,
    output reg [3:0] out
);
    reg [1:0] current_state,next_state;
    always @(posedge clk or negedge clr) begin
        if (!clr) begin
            current_state <= 2'b00;
        end else begin
            current_state <= next_state;
        end
    end
    always @(current_state) begin
        case (current_state)
            2'b00: next_state = 2'b01;
            2'b01: next_state = 2'b10;
            2'b10: next_state = 2'b11;
            2'b11: next_state = 2'b00;
        endcase
    end
    always @(posedge clk or negedge clr) begin
        case (current_state)
            2'b00:out<=4'b1000;
            2'b01:out<=4'b0100;
            2'b10:out<=4'b0010;
            2'b11:out<=4'b0001;
        endcase
    end
endmodule