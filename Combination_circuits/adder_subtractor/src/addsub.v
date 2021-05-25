module addsub (
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire c1;
    wire [31:0]b1;
    assign b1=b[31:0]^{32{sub}};//注意这里的运算，b[31:0]中的每一位都要跟sub求异或，若是b^sub=32'bx...x^32'b00...1
    add16 U1(.a(a[15:0]),.b(b1[15:0]),.cin(sub),.cout(c1),.sum(sum[15:0]));
    add16 U2(.a(a[31:16]),.b(b1[15:0]),.cin(c1),.cout(),.sum(sum[31:16]));
endmodule