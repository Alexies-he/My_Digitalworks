all: clean compile simulate 

compile:
	iverilog -o ./build/simv \
	./src/D_latch_tb.v \
	./src/D_latchbhv.v #注意“./*** ”为文件所在的文件夹名；iverilog -o 为让编译器编译语句;simv为编译生成的文件，也就是v.out文件
	
	
simulate:
	vvp -n ./build/simv #vvp为仿真语句，会生成测试激励中所规定的vcd文件
	
gtkwave:
	gtkwave D_latch_tb.vcd


clean:
	@rm -rf wave
	@rm -rf D_latch_tb.vcd
	@rm -rf ./build/simv
	@rm -rf ./src/D_latch.v.out
	




