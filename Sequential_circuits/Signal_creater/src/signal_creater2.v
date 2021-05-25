module signal_creater_2 (
    input clk,load,
    input [0:3] D,
    output out
);
    reg [0:3] Q;
    reg w1;
    always @(posedge clk) begin
        if (~load) begin
            Q<=D;
        end else begin
            Q<={Q[1:3],w1};
        end
    end
    always @(Q[0],Q[1],Q[2],Q[3]) begin
        case ({Q[0],Q[1],Q[2],Q[3]})
            4'b1001:w1=1;
            4'b0011:w1=1;
            4'b0111:w1=1;
            4'b1111:w1=0;
            4'b1110:w1=0;
            4'b1100:w1=1; 
            default:w1=0;
        endcase
    end
    assign out=Q[0];
endmodule