all: clean compile simulate gtkwave

compile:
	iverilog -o ./build/simv \
	./pc.v \
	./mux16_4to1.v \
	./add_16.v \
	./full_adder.v \
	./pc_reg.v \
	./pc_tb.v \
	
	
simulate:
	vvp -n ./build/simv #vvp为仿真语句，会生成测试激励中所规定的vcd文件
	
gtkwave:
	gtkwave tb_****.vcd


clean:
	@rm -rf wave
	@rm -rf tb_****.vcd
	@rm -rf ./build/simv
	@rm -rf ./src/D_latch.v.out #可以不写省略这一行，因为已经把v.out文件命名为simv文件了，故不会生成v.out文件