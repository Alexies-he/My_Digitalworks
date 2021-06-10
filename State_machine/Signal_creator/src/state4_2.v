module state4(
    input clk,clr,
    output reg [3:0] out
);//这是一个两段式的状态机写法
    reg [1:0] current_state,next_state;
    always @(posedge clk or negedge clr) begin//状态转换方程
        if (!clr) begin
            current_state <= 2'b00;
        end else begin
            current_state <= next_state;
        end
    end
    always @(current_state)begin
      case (current_state)
            2'b00: begin
									 next_state = 2'b01;
									 out<=4'b1000;
									 end
            2'b01: begin
									 next_state = 2'b10;
									 out<=4'b0100;
									 end
            2'b10: begin
									 next_state = 2'b11;
									 out<=4'b0010;
									 end
            2'b11: begin
									 next_state = 2'b00;
									 out<=4'b0001;
									 end
      endcase
    end
endmodule