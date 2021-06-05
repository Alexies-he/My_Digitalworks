module add_1 (
    input [7:0]x,y,
    output [8:0]out
);//down_module
    assign out = x+y;
endmodule
module add_2 (
    input [8:0]x,y,
    output[9:0]out
);
    assign out=x+y;
endmodule