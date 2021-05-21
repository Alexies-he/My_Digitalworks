module D_latch (
    input D,
    input E,
    output Q,
    output q
);
  wire w1;//注意中间变量的w1、w2、w3的设置，不要遗漏
  wire w2;
  wire w3;
  cmos U1 (w1,D,E,!E);//注意输出在前，输入在后
  cmos U2 (w2,w1,!E,E);
  not U3 (w3,w1);
  not U4 (w2,w3);
  assign q=w3;
  assign Q=w2;
endmodule