module  add16_tb;
    reg         CYI;
    reg [15:0]  OP_A;
    reg [15:0]  OP_B;
    wire        CYO;
    wire [15:0] SUM;

    add_16 U_add16(CYI, OP_A, OP_B, CYO, SUM); //instantiation

    initial begin
        $monitor("CYI=%h, OP_A=%h, OP_B=%h, CYO=%h, SUM=%h",CYI, OP_A, OP_B, CYO, SUM);
		#10 OP_A=16'h1111; OP_B=16'h1111; CYI=0;	
		#10 OP_A=16'h1111; OP_B=16'h0000; CYI=0;

      #10 OP_A=16'h1111; OP_B=16'h1100; CYI=1;	
		#10 OP_A=16'h1111; OP_B=16'h1234; CYI=1;	

    end

endmodule