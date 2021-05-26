module tb_tryfact (

);
    function[31:0]factorial;
        input [3:0]operand;
        reg [3:0] index;
       begin
        factorial = 1;
        for ( index=1 ;index<=operand ; index=index+1) begin
            factorial=factorial*index;
        end
       end 
    endfunction
    reg [31:0] result;
    reg [3:0] n;
    initial begin
        result=1;
        for ( n=1 ;n<=9 ;n=n+1 ) begin
            result=factorial(n);//调用函数，并且n作为函数的输入值
            $display("n=%d result=%d",n,result);
        end
    end
endmodule