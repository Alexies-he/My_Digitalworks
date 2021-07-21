
module full_adder(A, B, CYI, SUM, CYO);
    input   A;
    input   B;
    input   CYI;
    output  SUM;
    output  CYO;
        
    wire    A_XOR_B;
    
    assign A_XOR_B = A ^ B;
    assign SUM = (A_XOR_B) ^ CYI;
    assign CYO = ((A_XOR_B) & CYI) | (A & B);
    
endmodule
