module ALU_3basic #(
	parameter DATA_SIZE = 16
)
(
	input [DATA_SIZE-1:0] OP_A,OP_B,
	input [1:0]ALUK,
	output CYO,
	output  [DATA_SIZE-1:0]Y
);
	wire [15:0]Cout;
	wire[15:0]ADD_DATA;
	wire[15:0]AND_DATA;
	wire[15:0]NOT_DATA;
	assign AND_DATA=OP_A&OP_B ;
	assign NOT_DATA =~OP_A; 
	add_16 adder(.OP_A(OP_A),.OP_B(OP_B),.CYI(1'b0),.SUM(ADD_DATA),.CYO(CYO));
	mux16_4to1 comp_result(.SEL(ALUK),.D_IN0(ADD_DATA),.D_IN1(AND_DATA),.D_IN2(NOT_DATA),.D_IN3({16{1'b0}}),.D_OUT(Y));
endmodule
module  alu_tb;
    reg [1:0]   ALUK;
    reg [15:0]  OP_A;
    reg [15:0]  OP_B;
    wire [15:0] RESULT;

    reg [15:0] compare;
    integer i=0;

    parameter TEST_NUM=100; // test number

    ALU_3basic U_alu(.ALUK(ALUK),.OP_A(OP_A),.OP_B(OP_B),.Y(RESULT),.CYO()); //instantiation

    initial begin   
        repeat(TEST_NUM) begin
            //Generate random input
            OP_A = {$random}%(1<<16);
            OP_B = {$random}%(1<<16);
            ALUK = {$random}%(1<<2);
            #1;
            // compare result
            compare = ALUK==2'b00 ? (OP_A + OP_B):
                      ALUK==2'b01 ? (OP_A & OP_B):
                      ALUK==2'b10 ? (~OP_A):
                      0;         
            if (compare == RESULT) ;
            else begin
                $display("%m: at time %0t: ERROR!!! \n LUK=%h, OP_A=%d, OP_B=%d, RESULT=%d, compare=%d\n",$time,ALUK, OP_A, OP_B, RESULT,compare);
                i=i+1;
            end
            #9;
        end
        $display("the test is finished! There are %d error!",i);
        $stop;
    end
endmodule