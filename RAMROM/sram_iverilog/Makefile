all: clean compile simulate

compile:
	iverilog -o simv \
	./sram.v \
	./sram_tb.v 
	
	
simulate:
	vvp -n simv
	
gtkwave:
	gtkwave sram.vcd


clean:
	@rm -rf wave
	@rm -rf *.vcd
	




