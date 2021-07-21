module ram_tb   #(parameter ADDR_SIZE = 16 ,
                  parameter DATA_SIZE = 16 );
    reg                   WE;
    reg  [ADDR_SIZE-1:0]  ADDRESS;
    reg  [DATA_SIZE-1:0]  DATA_IN;
    wire [DATA_SIZE-1:0]  DATA_OUT;

    reg [DATA_SIZE-1:0]  i;
    
    ram U_ram(.WE(WE), .ADDRESS(ADDRESS), .DATA_IN(DATA_IN), .DATA_OUT(DATA_OUT));

    initial begin
        $monitor("WE = %h, ADDRESS = %h,  DATA_IN = %h, DATA_OUT = %h",WE, ADDRESS, DATA_IN, DATA_OUT);
        for ( i = 0 ; i< 8 ; i=i+1 ) begin
            $display("write:");
            ADDRESS = i ;
            DATA_IN = i;
            WE = 0 ;
            #10 

            $display("read:");
            WE = 1 ;
            #10;
        end
        $display("random test:");
        for ( i = 0 ; i< 8 ; i=i+1 ) begin
            $display("write:");
            ADDRESS = {$random}%ADDR_SIZE ;
            DATA_IN = {$random}%(1<<DATA_SIZE);
            WE = 0;
            #10 
            
            $display("read:");
            WE = 1;
            #10;
        end
    end

endmodule