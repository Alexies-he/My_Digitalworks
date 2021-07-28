 //Connecting the Testbench and Design!
	
 //There are several steps to verify a design: generate stimulus or transactions, capture responses, determine correctness and measure the progress. 
// The first step is to connect the testbench and design.
// The interface construct in SystemVerilog was specifically created to encapsulate the communication between the blocks. It could be between design blocks or between testbench and the design. 
// By encapsulating the communication between the blocks, interface construct facilitates design reusability.  
	
 // This exercise is to create interfaces for the FIFO design
// 1. Creating an interface file and declare all the signals
//	 In this exercise we will use the following signals: sclk,rst, push,pull,d_in,d_out,full,empty.
//       Push corresponds to write_en/write and pull corresponds to read_en/read. 
// 2. Write a clocking block.   
//	A. For the Master (Driver). Signals output from the TB will be used in a master clocking block. For eg. d_in, rd_en, wr_en. 
//	B. For the Slave (Monitor). Signals input from the design to the TB will be used in a slave clocking block. For eg. d_out, full, empty will be used in a slave clocking block. 
// 3. Write modports for both master and the slave. 
	
interface fifo_if();
// Add fifo_signals. We typically use logic data type. And it is highly recommended.
// Follow instructions mentioned above. 
endinterface : fifo_if