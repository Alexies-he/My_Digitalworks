module int_2to4 (
    output reg out0,out1,out2,out3,
    input E_,a0,a1
);
always @(E_,a0,a1) begin
    if (E_) begin
        out0=1;
        out1=1;
        out2=1;
        out3=1;
    end else begin
         case ({a1,a0})
                2'b00: out0=0;
                2'b01: out1=0;
                2'b10: out2=0;
                2'b11: out3=0;
         endcase
        
    end
end
endmodule