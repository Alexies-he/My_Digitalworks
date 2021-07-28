// Template for Top Module. 
// Declare module name. Import UVM packages here to use UVM in-built features and
// include uvm_macros.svh to use UVM Macro fields such as `UVM_LOW, `UVM_HIGH, etc. 
// We will create fifo_sequence_item class's object and randomize it multiple times

module fifo_top ();

  //Import UVM Packages and include UVM Macros. 

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import fifo_pkg::*;

  fifo_sequence_item seq_h;
  //Usage:  fifo_sequence_item fifo_sequence_item_h;

  // Inside Initial block, create an instance of the class. Meaning create a class 
  // object by using 'new' method. Also, randomize this object 30 times using 'for' loop. 

  // For instance, fifo_sequence_item_h = new();

  // Inside For loop randomize this object 30 times.

  // Usage: 'object'.randomize();
  initial begin
    seq_h = new();
    repeat(30) begin
      assert(seq_h.randomize());
      seq_h.print;
    end
  end 

endmodule: fifo_top
