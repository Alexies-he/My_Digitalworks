module register #(
	parameter DATA_SIZE = 16,
	parameter ADDR_SIZE = 3
) (
	input [ADDR_SIZE-1:0] SR1,SR2,//3bits读寄存器地址
	input [ADDR_SIZE-1:0] DR,//3bits写寄存器地址
	input [DATA_SIZE-1:0] DR_IN,//16bits写数据
	input LD,//寄存器文件写使能信号
	output [DATA_SIZE-1:0]SR1_OUT,SR2_OUT//16bits寄存器输出
);
	//READ part:LD=0
	wire [7:0] SEL_1,SEL_2,WR;
	wire [7:0]R_LD;
	wire [15:0]R0_OUT;
	wire [15:0]R1_OUT;
	wire [15:0]R2_OUT;
	wire [15:0]R3_OUT;
	wire [15:0]R4_OUT;
	wire [15:0]R5_OUT;
	wire [15:0]R6_OUT;
	wire [15:0]R7_OUT;
	wire [15:0]SR1_IN;
	wire [15:0]SR2_IN;
	decoder_3to8 coder1(.DATA_IN(SR1),.DATA_OUT(SEL_1));
	decoder_3to8 coder2(.DATA_IN(SR2),.DATA_OUT(SEL_2));

	// Write part1:select Register(R0-R7) by DR

	decoder_3to8 comp_ld(.DATA_IN(DR),.DATA_OUT(WR));
	assign R_LD[0] = WR[0] & LD;
	assign R_LD[1] = WR[1] & LD;
	assign R_LD[2] = WR[2] & LD;
	assign R_LD[3] = WR[3] & LD;
	assign R_LD[4] = WR[4] & LD;
	assign R_LD[5] = WR[5] & LD;
	assign R_LD[6] = WR[6] & LD;
	assign R_LD[7] = WR[7] & LD;

	//Write part2:put DR_IN into Rn
	register_16 R0(.LD(R_LD[0]),.DATA_IN(DR_IN),.DATA_OUT(R0_OUT));
	register_16 R1(.LD(R_LD[1]),.DATA_IN(DR_IN),.DATA_OUT(R1_OUT));
	register_16 R2(.LD(R_LD[2]),.DATA_IN(DR_IN),.DATA_OUT(R2_OUT));
	register_16 R3(.LD(R_LD[3]),.DATA_IN(DR_IN),.DATA_OUT(R3_OUT));
	register_16 R4(.LD(R_LD[4]),.DATA_IN(DR_IN),.DATA_OUT(R4_OUT));
	register_16 R5(.LD(R_LD[5]),.DATA_IN(DR_IN),.DATA_OUT(R5_OUT));
	register_16 R6(.LD(R_LD[6]),.DATA_IN(DR_IN),.DATA_OUT(R6_OUT));
    	register_16 R7(.LD(R_LD[7]), .DATA_IN(DR_IN), .DATA_OUT(R7_OUT)); 
	
	//Read part1:select Register(R0-R7) by SR1 and SR2	

    	mux16_8to1 ChosenSR1( .SEL(SR1),      .D_IN0(R0_OUT), .D_IN1(R1_OUT), .D_IN2(R2_OUT), .D_IN3(R3_OUT),
                         .D_IN4(R4_OUT), .D_IN5(R5_OUT), .D_IN6(R6_OUT), .D_IN7(R7_OUT),.D_OUT(SR1_IN));//让SR1_IN与选中的Rx_OUT相连
    
    	mux16_8to1 ChosenSR2( .SEL(SR2),      .D_IN0(R0_OUT), .D_IN1(R1_OUT), .D_IN2(R2_OUT), .D_IN3(R3_OUT),
                          .D_IN4(R4_OUT), .D_IN5(R5_OUT), .D_IN6(R6_OUT), .D_IN7(R7_OUT),.D_OUT(SR2_IN)); 

	//Read Part2:ouput the Rn to SRx_OUT

	assign SR1_LD = !LD;//在register16中LD=1时，DATA_OUT=DATA_IN
	assign SR2_LD = !LD;
	register_16 SR1_REG(.LD(SR1_LD),.DATA_IN(SR1_IN),.DATA_OUT(SR1_OUT));
	register_16 SR2_REG(.LD(SR2_LD),.DATA_IN(SR2_IN),.DATA_OUT(SR2_OUT));

	// display message for test
    always @(LD) begin
        if(SR1_LD) $display("%m:At time %0t: The real result SR1_LD= %b , SR1= %b, SR1_OUT= %b, SR1_IN=%b, Rx_OUT=%b",$time,SR1_LD,SR1,SR1_OUT,SR1_IN,{R0_OUT,R1_OUT,R2_OUT,R3_OUT,R4_OUT,R5_OUT,R6_OUT,R7_OUT});//SR1_LD or SR2_LD=1 means in the process of reading part 
        if(SR2_LD) $display("%m:At time %0t: The real result SR2_LD= %b , SR2= %b, SR2_OUT= %b,SR2_IN=%b",$time,SR2_LD,SR2,SR2_OUT,SR2_IN);
        if(   LD ) $display("%m:At time %0t: The real result LD= %b , DR= %b, DR_IN= %b, Rx_OUT=%b",$time,LD,DR,DR_IN,{R0_OUT,R1_OUT,R2_OUT,R3_OUT,R4_OUT,R5_OUT,R6_OUT,R7_OUT});//LD=1 means in the process of writing part
    end
endmodule