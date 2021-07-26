//--------------------------------------------------------------------------------------------
//
// Generated by X-HDL VHDL Translator - Version 2.0.0 Feb. 1, 2011
// ?? 1? 12 2021 15:54:45
//
//      Input file      : 
//      Component name  : half_adder
//      Author          : 
//      Company         : 
//
//      Description     : 
//
//
//--------------------------------------------------------------------------------------------


module half_adder(A, B, SUM, CYO);
	input   A;
	input   B;
	output  SUM;
	output  CYO;

	assign SUM = A ^ B;
	assign CYO = A & B;
   
endmodule