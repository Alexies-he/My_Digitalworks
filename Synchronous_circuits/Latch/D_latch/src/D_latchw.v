module D_latch (
    input D,E,
    output reg Q,q
);
   initial begin
      wait(E==1)
        begin
        Q<=D;
        q<=!Q;
        end  
   end
endmodule