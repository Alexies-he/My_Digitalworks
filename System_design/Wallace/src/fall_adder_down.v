module fall_adder_down (
    input x,y,in,
    output out_in,out
);
	assign out = x^y^in;
	assign out_in = x&y|(x^y)&in;
endmodule