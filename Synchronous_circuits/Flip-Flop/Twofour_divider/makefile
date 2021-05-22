all: clean compile simulate gtkwave

compile:
	iverilog -o ./build/simv \
	./src/2_4divider.v \
	./src/tb_two_divide.v #注意“./*** ”为文件所在的文件夹名；iverilog -o 为让编译器编译语句;simv为编译生成的文件，也就是v.out文件
	
	
simulate:
	vvp -n ./build/simv #vvp为仿真语句，会生成测试激励中所规定的vcd文件
	
gtkwave:
	gtkwave tb_two_divide.vcd


clean:
	@rm -rf wave
	@rm -rf tb_two_divide.vcd
	@rm -rf ./build/simv
	@rm -rf ./src/D_latch.v.out #可以不写省略这一行，因为已经把v.out文件命名为simv文件了，故不会生成v.out文件