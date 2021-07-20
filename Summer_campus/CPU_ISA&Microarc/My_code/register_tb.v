module register_tb;
    reg         LD;
    reg [2:0]   DR;
    reg [2:0]   SR1;
    reg [2:0]   SR2;
    reg [15:0]  DR_IN;
    wire [15:0] SR1_OUT;
    wire [15:0] SR2_OUT;

    reg[3:0] i;

    register U_register_file(.LD(LD), .DR(DR), .SR1(SR1),. SR2(SR2), .DR_IN(DR_IN), .SR1_OUT(SR1_OUT), .SR2_OUT(SR2_OUT));

    initial begin
        $monitor("ideal result: LD = %h, DR = %h, SR1 = %h, SR2 = %h, DR_IN = %h, SR1_OUT = %h, SR2_OUT = %h",LD, DR, SR1, SR2, DR_IN, SR1_OUT, SR2_OUT);
        LD = 1;
        for ( i = 0 ; i< 8 ; i=i+1 ) begin
            $display("write:");
            DR = i ;
            DR_IN = i;
            LD = 1 ;
            #10 

            $display("read:");
            SR1 = i;
            SR2 = i-1;
            LD = 0 ;
            #10;

            DR_IN = i+8;
            #10;
        end
        $display("random test:");
        for ( i = 0 ; i< 8 ; i=i+1 ) begin
            $display("write:");
            DR = {$random}%8 ;
            DR_IN = {$random}%(1<<16);
            LD = 1 ;
            #10 
            
            $display("read:");
            SR1 = {$random}%8;
            SR2 = {$random}%8;
            LD = 0 ;
            #10;
        end
    end
endmodule