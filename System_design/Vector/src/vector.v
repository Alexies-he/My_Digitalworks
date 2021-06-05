module victor (
     a1,a2,a3,a4,
     b1,b2,b3,b4,
     out
);//top_module
parameter bits_num = 4;
input [bits_num-1:0] a1,a2,a3,a4,b1,b2,b3,b4;
output [9:0]out;
wire [7:0] mulout1,mulout2,mulout3,mulout4;
wire [8:0] out1,out2;
wire [9:0] out;
mul_addtree U1(.x(a1),.y(b1),.out(mulout1));
mul_addtree U2(.x(a2),.y(b2),.out(mulout2));
mul_addtree U3(.x(a3),.y(b3),.out(mulout3));
mul_addtree U4(.x(a4),.y(b4),.out(mulout4));
add_1#(8) U5(.x(mulout1),.y(mulout2),.out(out1));
add_1#(8) U6(.x(mulout3),.y(mulout4),.out(out2));
add_2#(9) U7(.x(out1),.y(out2),.out(out));
endmodule