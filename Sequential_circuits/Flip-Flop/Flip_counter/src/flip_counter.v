module flip_counter (
    output out0,out1,out2,out3,
    input cp,rst
);
wire w1,w2,w3;
    dff U1(.cp(cp),.rst(rst),.Q(w2),.q(),.D(w1));
    dff U2(.cp(cp),.rst(rst),.Q(w3),.q(w1),.D(w2));
    int_2to4 U3(.E_(cp),.a0(w2),.a1(w3),.out0(out0),.out1(out1),.out2(out2),.out3(out3));
endmodule