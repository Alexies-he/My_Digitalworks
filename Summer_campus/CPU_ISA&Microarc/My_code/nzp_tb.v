module nzp_tb;
   reg [ 15:0 ] D_IN;
   reg LD;
   wire [2:0]NZP;

   nzp U_nzp(.D_IN(D_IN),.LD(LD),.NZP(NZP));

   initial begin
      $monitor("D_IN = %b ,LD = %h, NZP=%b",D_IN,LD,NZP );
      D_IN = 16'hf011;
      LD = 1;
      #10 LD = 0;
      #10 D_IN = 16'h0111;
      #10 LD = 1;
      #10 LD = 0;
      #10 D_IN = 16'h0000;
      #10 LD = 1;
   end
   
endmodule