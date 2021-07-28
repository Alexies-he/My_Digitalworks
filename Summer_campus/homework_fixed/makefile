all: clean compile simulate

compile:
	iverilog -o ./build/simv \
	./src/tb_Flow_Control_Flow_top.v \
	./src/Flow_Control_Flow_top.v \
	./src/control.v \
	./src/counter.v \
	./src/DFF.v \
	./src/mux8_4to1.v \
	./src/ram.v \

	
	
	
simulate:
	vvp -n ./build/simv #vvp为仿真语句，会生成测试激励中所规定的vcd文件
	
gtkwave:
	gtkwave tb_Control_Flow_top.vcd


clean:
	@rm -rf wave
	@rm -rf tb_****.vcd
	@rm -rf ./build/simv
	@rm -rf ./src/D_latch.v.out #可以不写省略这一行，因为已经把v.out文件命名为simv文件了，故不会生成v.out文件