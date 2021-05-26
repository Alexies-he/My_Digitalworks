`timescale 1ns/1ns
module D (
    output out,
    input a,b,c
);
    wire e;
    and #(4,5) a1(e,a,b);
    or #(3,4) o1(out,e,c);
endmodule

module tb_D (
    
);
  reg A,B,C;
  wire OUT;
  D U1(.out(OUT),.a(A),.b(B),.c(C));
  initial begin
      $dumpfile("tb_D");
      $dumpvars(1,tb_D);
      A=1'b0;B=1'b0;C=1'b0;
      #10 A=1'b1;B=1'b1;C=1'b1;
      #10 A=1'b1;B=1'b0;C=1'b0;
      #20 $finish;
  end  
endmodule