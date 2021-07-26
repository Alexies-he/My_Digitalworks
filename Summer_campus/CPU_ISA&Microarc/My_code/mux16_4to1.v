
module mux16_4to1#(
   parameter DATA_SIZE = 16
)
(SEL, D_IN0, D_IN1, D_IN2, D_IN3, D_OUT);
   input [1:0]   SEL;
   input [DATA_SIZE-1:0]  D_IN0;
   input [DATA_SIZE-1:0]  D_IN1;
   input [DATA_SIZE-1:0]  D_IN2;
   input [DATA_SIZE-1:0]  D_IN3;
   output reg[DATA_SIZE-1:0] D_OUT;

   //********* The first design method ****************
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