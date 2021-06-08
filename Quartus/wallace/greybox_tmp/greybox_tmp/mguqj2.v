//altmult_add ADDNSUB_MULTIPLIER_PIPELINE_REGISTER1="CLOCK0" ADDNSUB_MULTIPLIER_REGISTER1="CLOCK0" CBX_SINGLE_OUTPUT_FILE="ON" DEDICATED_MULTIPLIER_CIRCUITRY="AUTO" INPUT_REGISTER_A0="CLOCK0" INPUT_REGISTER_A1="CLOCK0" INPUT_REGISTER_B0="CLOCK0" INPUT_REGISTER_B1="CLOCK0" INPUT_SOURCE_A0="DATAA" INPUT_SOURCE_A1="DATAA" INPUT_SOURCE_B0="DATAB" INPUT_SOURCE_B1="DATAB" INTENDED_DEVICE_FAMILY=""MAX V"" LPM_TYPE="altmult_add" MULTIPLIER1_DIRECTION="ADD" MULTIPLIER_REGISTER0="CLOCK0" MULTIPLIER_REGISTER1="CLOCK0" NUMBER_OF_MULTIPLIERS=2 OUTPUT_REGISTER="CLOCK0" PORT_ADDNSUB1="PORT_UNUSED" PORT_SIGNA="PORT_UNUSED" PORT_SIGNB="PORT_UNUSED" REPRESENTATION_A="UNSIGNED" REPRESENTATION_B="UNSIGNED" SIGNED_PIPELINE_REGISTER_A="CLOCK0" SIGNED_PIPELINE_REGISTER_B="CLOCK0" SIGNED_REGISTER_A="CLOCK0" SIGNED_REGISTER_B="CLOCK0" WIDTH_A=16 WIDTH_B=16 WIDTH_C=22 WIDTH_CHAININ=1 WIDTH_RESULT=33 dataa datab result
//VERSION_BEGIN 19.1 cbx_mgl 2019:09:22:11:02:15:SJ cbx_stratixii 2019:09:22:11:00:28:SJ cbx_util_mgl 2019:09:22:11:00:28:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2019  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and any partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel FPGA IP License Agreement, or other applicable license
//  agreement, including, without limitation, that your use is for
//  the sole purpose of programming logic devices manufactured by
//  Intel and sold by Intel or its authorized distributors.  Please
//  refer to the applicable agreement for further details, at
//  https://fpgasoftware.intel.com/eula.



//synthesis_resources = altmult_add 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mguqj2
	( 
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   [31:0]  dataa;
	input   [31:0]  datab;
	output   [32:0]  result;

	wire  [32:0]   wire_mgl_prim1_result;

	altmult_add   mgl_prim1
	( 
	.dataa(dataa),
	.datab(datab),
	.result(wire_mgl_prim1_result));
	defparam
		mgl_prim1.addnsub_multiplier_pipeline_register1 = "CLOCK0",
		mgl_prim1.addnsub_multiplier_register1 = "CLOCK0",
		mgl_prim1.dedicated_multiplier_circuitry = "AUTO",
		mgl_prim1.input_register_a0 = "CLOCK0",
		mgl_prim1.input_register_a1 = "CLOCK0",
		mgl_prim1.input_register_b0 = "CLOCK0",
		mgl_prim1.input_register_b1 = "CLOCK0",
		mgl_prim1.input_source_a0 = "DATAA",
		mgl_prim1.input_source_a1 = "DATAA",
		mgl_prim1.input_source_b0 = "DATAB",
		mgl_prim1.input_source_b1 = "DATAB",
		mgl_prim1.intended_device_family = ""MAX V"",
		mgl_prim1.lpm_type = "altmult_add",
		mgl_prim1.multiplier1_direction = "ADD",
		mgl_prim1.multiplier_register0 = "CLOCK0",
		mgl_prim1.multiplier_register1 = "CLOCK0",
		mgl_prim1.number_of_multipliers = 2,
		mgl_prim1.output_register = "CLOCK0",
		mgl_prim1.port_addnsub1 = "PORT_UNUSED",
		mgl_prim1.port_signa = "PORT_UNUSED",
		mgl_prim1.port_signb = "PORT_UNUSED",
		mgl_prim1.representation_a = "UNSIGNED",
		mgl_prim1.representation_b = "UNSIGNED",
		mgl_prim1.signed_pipeline_register_a = "CLOCK0",
		mgl_prim1.signed_pipeline_register_b = "CLOCK0",
		mgl_prim1.signed_register_a = "CLOCK0",
		mgl_prim1.signed_register_b = "CLOCK0",
		mgl_prim1.width_a = 16,
		mgl_prim1.width_b = 16,
		mgl_prim1.width_c = 22,
		mgl_prim1.width_chainin = 1,
		mgl_prim1.width_result = 33;
	assign
		result = wire_mgl_prim1_result;
endmodule //mguqj2
//VALID FILE
