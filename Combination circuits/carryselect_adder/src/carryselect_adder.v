module carryselect_adder (
    input[31:0] a,
    input[31:0] b,
    output[31:0] sum
);
wire [15:0] w3,w4;
wire sel;
   add16 U1(.a(a[15:0]),.b(b[15:0]),.cin(1'b0),.cout(sel),.sum(sum[15:0]));
   add16 U2(.a(a[31:16]),.b(b[31:16]),.cin(1'b0),.cout(),.sum(w3));
   add16 U3(.a(a[31:16]),.b(b[31:16]),.cin(1'b1),.cout(),.sum(w4)); 
  assign sum[31:16]= sel?w3:w4;
endmodule