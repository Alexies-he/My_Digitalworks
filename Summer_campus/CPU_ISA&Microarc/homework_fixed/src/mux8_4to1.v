
module mux8_4to1(SEL, D_IN0, D_IN1, D_IN2, D_IN3, D_OUT);
   input [1:0]   SEL;
   input [7:0]  D_IN0;
   input [7:0]  D_IN1;
   input [7:0]  D_IN2;
   input [7:0]  D_IN3;
   output [7:0] D_OUT;

   //********* The first design method ****************
   reg [7:0] D_OUT;

   always @(SEL,D_IN0,D_IN1,D_IN2,D_IN3) begin
      case (SEL)
         2'b00: D_OUT <= D_IN0;
         2'b01: D_OUT <= D_IN1; 
         2'b10: D_OUT <= D_IN2;
         2'b11: D_OUT <= D_IN3;
         default: D_OUT <= 0; 
      endcase
   end   

   //********** the second design method ***************
   // wire [15:0] D_OUT0,D_OUT1;
   // mux16_2to1 U_4to1_sel01(.SEL(SEL[0]), .D_IN0(D_IN0) , .D_IN1(D_IN1) , .D_OUT(D_OUT0));
   // mux16_2to1 U_4to1_sel23(.SEL(SEL[0]), .D_IN0(D_IN2) , .D_IN1(D_IN3) , .D_OUT(D_OUT1));
   // mux16_2to1 U_4to1_sel  (.SEL(SEL[1]), .D_IN0(D_OUT0), .D_IN1(D_OUT1), .D_OUT(D_OUT));   

   //********** the third design method ****************
   // assign D_OUT = SEL[0] ? (SEL[1] ? D_IN3 : D_IN1) :  (SEL[1] ? D_IN2 : D_IN0) ;

endmodule

module  mux8_4to1_tb;
   reg [7:0]  D_IN0,D_IN1,D_IN2,D_IN3;   // input
   reg [ 1:0]  SEL;
   wire[7:0]  D_OUT;  // output
   
   //instantiation
   mux8_4to1 U_mux8_4to1(.SEL(SEL),
                           .D_IN0(D_IN0),
                           .D_IN1(D_IN1),
                           .D_IN2(D_IN2),
                           .D_IN3(D_IN3),
                           .D_OUT(D_OUT)); 
   initial begin
      $monitor("SEL = %h , D_IN0 = %h ,D_IN1 = %h ,D_IN2 = %h ,D_IN3 = %h ,D_OUT = %h",SEL,D_IN0,D_IN1,D_IN2,D_IN3,D_OUT);
      D_IN0 = 8'h12;
      D_IN1 = 8'h11;
      D_IN2 = 8'h00;
      D_IN3 = 8'h10;

      #10 SEL = 2'b00;
      #10 SEL = 2'b01;
      #10 SEL = 2'b10;
      #10 SEL = 2'b11;
   end
endmodule