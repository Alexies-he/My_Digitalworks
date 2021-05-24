module tb_random;
reg signed [7:0]r;
parameter delay =2 ;
    initial begin
    #delay r=$random%5;
    #delay r=$random%5;
    #delay r={$random}%24;
    #delay r={$random}%24;
    end
    initial begin
    $monitor($time,"The random number is %d",r);
    end
endmodule
