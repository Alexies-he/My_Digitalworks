 In this assignment, we will learn to instantiating interface in the top and driving interface pins.

  			

			   ____________________________________________________________
			  |                                                            |
			  |                                                            |
			  |                                                            |
			  |             TopModule.sv(clk,reset)                        |
			  |                 ||                                         |
			  |                 ||                                         |
			  |                 ||                                         |
			  |                 ||                                         |
			  |                 ||                                         |
              		  |                 \/                                         |
			  |	  _____________________       ____________________     |
			  |      |                     |     |                    |    |
			  |      |      Interface      |     |      Design        |    |
	 		  |      |                     |<===>|                    |    |
			  |      |                     |     |                    |    |
			  |      |                     |     |                    |    |
			  |      |                     |     |                    |    |
			  |      |_____________________|     |____________________|    |
			  |                                                            |
			  |____________________________________________________________|
			 
			   _______________________________________________________________________________
			  |                                                                               |
			  |                                                                               |
			  |                                Testbench                                      |
			  |            ________________________________________________________           |                                                        |
			  |           |                                                        |          |
			  |           |                                                        |          |
			  |           |                                                        |          |
			  |           |               ___________________________              |          |
			  |           |              |                           |             |          |
			  |           |              |  clk                      |             |          |
			  |           |   Master     |  reset          data_out  |    Slave    |          |
			  |           |<============>|  data_in        full      |<===========>|          |
			  |           |              |  read_enable    empty     |             |          |
			  |           |              |  write_enable             |             |          |
			  |___________|              |___________________________|             |__________|

Things that you are supposed to do in this lab. 
1. Inside the Interface module.
        a. Complete the top_if.sv file.
2. Inside top Directory 
        a. Complete the top.sv file. Follow templates/remarks in this file.  
			