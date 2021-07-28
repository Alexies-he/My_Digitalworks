
// This is the top most module that instantiates DUT and Testbench.
//Instantiate the interface file
`include "top_if.sv"
module fifo_top(); 
  import uvm_pkg::*;
  `include "uvm_macros.svh";
// Import UVM Packages
// Include uvm_macros.svh

  logic clk, rst; 
  fifo_if  fifo_intf();
// Declare clock and reset signals
// Instantiate interface file in the top
// In the initial block, 
//	Initialize clk and rst to 1 bit
//	Drive rst logic high in the initial block for 30 ns and then de-assert.
// Generate clk.
// Define a task drive which drives output pins of the interface such as d_in, rd_en, wr_en.
  initial begin
    clk = 1;
    rst = 1;
    #30 rst = 0;
  end 

  always 
    #2 clk = !clk;

  assign fifo_intf.clk = clk;
  assign fifo_intf.rst = rst;

  task drive;
    begin
      @(posedge clk);
      fifo_intf.d_in <= fifo_intf.d_in*2;
      fifo_intf.push <= !fifo_intf.push;
      fifo_intf.pull <= !fifo_intf.pull;
      $display(" d_in  %b,  push  %b, pull  %b", fifo_intf.d_in, fifo_intf.push, fifo_intf.pull);
    end 
  endtask
  
//Drive at least 10 times. 
 
  initial begin
    $dumpfile("top.vcd");
    $dumpvars(0,fifo_top);
  end

  initial begin
    fifo_intf.push <= 1;
    fifo_intf.pull <= 0;
    fifo_intf.d_in <= 1;
    repeat(10)
    drive;
    #200 $finish; 
  end 
endmodule : fifo_top
