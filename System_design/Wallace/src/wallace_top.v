module wallace_top (
    input [3:0] x,y,
    output [7:0] out
);//顶层模块
wire HA_in_1,HA_out_1,HA_in_2,HA_out_2,HA_in_3,HA_out_3,FA_in_1,FA_out_1,FA_in_2,FA_out_2,FA_in_3,FA_out_3 ;
wire [6:0]out_tmp;
    half_adder_down h1(.x(x[0]&y[3]),.y(x[1]&y[2]),.out_in(HA_in_1),.out(HA_out_1));
    half_adder_down h2(.x(x[1]&y[3]),.y(x[2]&y[2]),.out_in(HA_in_2),.out(HA_out_2));
    half_adder_down h3(.x(x[0]&y[2]),.y(x[1]&y[1]),.out_in(HA_in_3),.out(HA_out_3));
    fall_adder_down f1(.x(x[2]&y[1]),.y(x[3]&y[0]),.in(HA_out_1),.out_in(FA_in_1),.out(FA_out_1));
    fall_adder_down f2(.x(x[3]&y[1]),.y(HA_out_2),.in(HA_in_1),.out_in(FA_in_2),.out(FA_out_2));
    fall_adder_down f3(.x(x[3]&y[2]),.y(HA_in_2),.in(x[2]&y[3]),.out_in(FA_in_3),.out(FA_out_3));
    add a1(.add_a({FA_in_3,FA_out_3,FA_out_2,FA_out_1,x[2]&y[0],x[0]&y[1]}),.add_b({x[3]&y[3],FA_in_2,FA_in_1,HA_in_3,HA_out_3,x[1]&y[0]}),.out(out_tmp));//注意这里的add模块中，最后是输出7位比特的信号，out={add_a+add_b,x[0]&y[0]}
    assign out={out_tmp,x[0]&y[0]};
endmodule