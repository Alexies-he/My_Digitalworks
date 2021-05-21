module signal_creater_3 (
    input clk,rst,
    output out
);
reg [3:0]count;
reg out;
initial begin
    count<=3'b000;
end
   always @(posedge clk) begin
    if (~rst) begin
        count<=3'b000;
    end else begin
        if (count==3'b101) begin
            count<=3'b000;
        end else begin
            count<=count+1;
        end
    end
   end 
   always @(count) begin
        case (count)
            3'b000:out=1;
            3'b001:out=0;
            3'b010:out=0;
            3'b011:out=1;
            3'b100:out=1;
            3'b101:out=1; 
            default: out=0;
        endcase
   end
endmodule