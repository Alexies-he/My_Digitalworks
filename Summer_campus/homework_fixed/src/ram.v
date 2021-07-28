module ram #(parameter ADDR_SIZE = 2 ,
             parameter DATA_SIZE = 8)
            (WE, ADDRESS, ram_in, ram_out);
    input                   WE;
    input  [ADDR_SIZE-1:0]  ADDRESS;
    input  [DATA_SIZE-1:0]  ram_in;
    output [DATA_SIZE-1:0]  ram_out;

    localparam MEM_DEPTH = 1<< ADDR_SIZE;    
    reg [DATA_SIZE-1:0] MEM [0:MEM_DEPTH-1];    // memory     

    reg [DATA_SIZE-1:0]  ram_out;
    
    always @(WE, ADDRESS, ram_in, ram_out) begin
        if (!WE)
            MEM[ADDRESS] <= ram_in;
        else
             ram_out <= MEM [ADDRESS];   
    end 
endmodule 

module ram_tb   #(parameter ADDR_SIZE = 2 ,
                  parameter DATA_SIZE = 8 );
    reg                   WE;
    reg  [ADDR_SIZE-1:0]  ADDRESS;
    reg  [DATA_SIZE-1:0]  ram_in;
    wire [DATA_SIZE-1:0]  ram_out;

    reg [DATA_SIZE-1:0]  i;
    
    ram U_ram(WE, ADDRESS, ram_in, ram_out);

    initial begin
        $monitor("WE = %h, ADDRESS = %h,  ram_in = %h, ram_out = %h",WE, ADDRESS, ram_in, ram_out);
        for ( i = 0 ; i< 8 ; i=i+1 ) begin
            $display("write:");
            ADDRESS = i ;
            ram_in = i;
            WE = 1 ;
            #10 

            $display("read:");
            WE = 0 ;
            #10;
        end
        $display("random test:");
        for ( i = 0 ; i< 8 ; i=i+1 ) begin
            $display("write:");
            ADDRESS = {$random}%ADDR_SIZE ;
            ram_in = {$random}%(1<<DATA_SIZE);
            WE = 1 ;
            #10 
            
            $display("read:");
            WE = 0 ;
            #10;
        end
    end

endmodule
