module add (
    input [5:0] add_a,add_b,
    output [6:0]out
);//依旧是一个半加器，不过是输入为六位比特的半加器
    assign out=add_a+add_b;
endmodule