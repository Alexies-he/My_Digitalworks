module SR_latch(
    input S,
    input R,
    output Q,
    output q
);
wire w1,w2;
nor U1(w1,R,w2);
nor U2(w2,S,w1);
assign Q=w1;
assign q=w2; 
endmodule