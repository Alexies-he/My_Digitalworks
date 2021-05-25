module bits_counter(
    input clk,rst,
    output reg [2:0]count,
	output out0,out1,out2
);

    always @(posedge clk) begin
        if (~rst) begin
            count<=3'b000;
        end else begin
            if (count==3'b111) begin
                count<=3'b000;
            end else begin
                count<=count+1;
            end
        end
    end
	assign out0=count[0];
	assign out1=count[1];
	assign out2=count[2];
endmodule