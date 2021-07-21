module pc_tb;
    reg          CLK;
    reg          RESET;
    reg          LD;
    reg  [1:0]   PCSEL;
    reg  [15:0]  OFFSET;
    reg  [15:0]  DIRECT;
    wire [15:0] PC_OUT,mux_out;  

    reg [3:0]i;

    pc U_pc(.CLK(CLK), .RESET(RESET),.LD(LD), .PCSEL(PCSEL), .OFFSET(OFFSET), .DIRECT(DIRECT), .PC_OUT(PC_OUT),.mux_out(mux_out));

    always #10 CLK=~CLK;
    initial begin
        $monitor("LD=%b, PCSEL=%b, OFFSET=%b, DIRECT=%b, PC_OUT=%b, mux_out=%b",LD, PCSEL, OFFSET, DIRECT, PC_OUT,mux_out);
        CLK = 0;
        RESET =1;
        LD=0;
        #20;
        LD=1;
        RESET =0;
        #30;
        PCSEL=0;
        OFFSET= 'b11111;
        DIRECT= 16'd123;
        for ( i = 0 ; i<= 4 ; i=i+1 ) begin
            #40 PCSEL = PCSEL +1;
        end




    end
endmodule