
// This is the top most module that instantiates DUT and Testbench.
// Include interface file before module. 
module fifo_top(); 
// Import UVM Packages
// Include uvm_macros.svh

// Declare clock and reset signals
// Instantiate interface 
// In the initial block, 
//	Initialize clk and rst to 1 bit
//	Drive rst logic high in the initial block for 30 ns and then de-assert. We may not rst logic for this exercise, we are following general practice. 
// Since this lab does not use rtl, we are just practising use of interface and driving interface pins in UVM. 
// In simple words, getting our hands dirty. :) 
// Generate clk.
// assign clk and rst pins to interface clk and rst pins. 
// Hint: assign interface_instance.clk = clk;

// Define a task drive which drives output pins of the interface such as d_in, pull , push.
// Remember, pins output from interface are input to the RTL and vice-versa. 
  task drive;
    //Drive testbench output pins at clock edge
    // In SV or UVM, we can use repeat(10)@(posedge clk); 
    // instead of for(int i=0; i<10; i++) begin
    //              @(posedge clk);
    //            end. 
    // Choose your constructs wisely :) 
 
  endtask
  
// Call 'drive' task 10 times. 
 
  initial begin
    $dumpfile("top.vcd");
    $dumpvars(0,fifo_top);
  end

  initial begin
    #200 $finish;  // Remember, it is not advised to use $finish in UVM. We will not use $finish from Lab2
  end 
endmodule : fifo_top