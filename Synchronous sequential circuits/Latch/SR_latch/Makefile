all: clean compile simulate

compile:
	iverilog -o ./build/simv \
	./src/tb_SR_latch.v \
	./src/SR_latchnew.v
	
	
simulate:
	vvp -n ./build/simv
	
gtkwave:
	gtkwave tb_SR_latch.vcd


clean:
	@rm -rf wave
	@rm -rf tb_SR_latch.vcd
	@rm -rf ./build/simv
	




