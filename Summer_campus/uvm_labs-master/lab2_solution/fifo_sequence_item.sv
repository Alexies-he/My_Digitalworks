// Tempate for classname fifo_sequence_item

// Declare all the fields/properties that will be used in this class. 
// For Eg. In this this project, datain, push, pull signals fields will be declared random. 
// Do the same for other random fields, such as push(1 bit), pull(1 bit). 
// Also declare non-random fields that will be used, for eg. full(1 bit), empty(1 bit), dataout(32 bits). 
// Note: Outputs/output signals are not randomized. And Input signals are usually randomized. It depends on your testplan.
	
// Registering to factory helps us in various ways.
// For eg. Factory Overriding by type and by instance are done using factory registration.
// We shall cover a lab on factory registration. But in the mean time, if you are very curious to know about it, 
// you may refer, http://www.learnuvmverification.com/index.php/2015/08/19/how-uvm-factory-works/   ;)  
	
// Now, if the property is int/logic/reg type, use uvm_int_field, 
// If the property is enum type, use uvm_field_enum and similarly for string, and many other data-types.
// You may register all the random fields. 
// Constraints block. 
// Write constraints for datain that varies between 'h0000:'hffff. Please note, this is some randomly decided value. 
// You may chose to write constraints on push and pull, but we very sure what you are trying to achieve. 
// In order to build more confidence on this exercise, you may take other Design and write constraints for it and see the magic yourself. :) 
// As the complexity of the code increases, user generates intelligent stimulus to catch design bugs.  

class fifo_sequence_item extends uvm_sequence_item; 

	// Properties Declaration
	// Declare all the random and non-random properties here. 
	// Usage : rand logic [31:0]  datain; 
	rand logic pull;

    `uvm_object_utils_begin(fifo_sequence_item) // This is Registering properties to factory.
 	`uvm_field_int(pull  ,  UVM_ALL_ON)
 	// Do the same for other random fields 
    `uvm_object_utils_end

 	// Constructor 
 	function new(string name="fifo_sequence_item");
	  super.new(name);
	endfunction: new 

 	// Constraints block.
	//Constraints expression can be used in different ways: 
	//1. Set membership: This operator searches for the existences of the value in the specified expression or range and returns 1 if it is existing.
	//	constraint range { datain inside {0,1,[50:60],[90:100]}; }
	//2. Weighted distribution :There are two types of distribution operators.
	//	The := operator assigns the specified weight to the item or, if the item is a range, to every value in the range.
	//	The :/ operator assigns the specified weight to the item or, if the item is a range, to the range as a whole. If there are n values in the range, the weight of each value is range_weight / n.
	//	constraint range { datain dist { [0:1] := 50 , [2:7] := 50 }; }
	//3. Implications : Implication operator can be used to declare conditional relation.
	//	constraint datain_c { (a == 0) -> (b == 1); }
	//In this exercise the constraint block can be used as follows:
 	// Usage: constraint datain_c { datain inside {[h0:'hffff]};} 
	constraint pull_c { pull inside {[0:1]}; }

endclass: fifo_sequence_item
