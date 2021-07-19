all: clean compile simulate gtkwave

compile:
	iverilog -o ./build/simv \
	./LC-3-master-verilog/mux16_2to1.v \
	./LC-3-master-verilog/mux16_4to1.v \
	./LC-3-master-verilog/mux16_8to1.v \
	./LC-3-master-verilog/tristate_b.v \
	./LC-3-master-verilog/tristate_b16.v \
	./LC-3-master-verilog/decode38.v \
	./LC-3-master-verilog/half_adder.v \
	./LC-3-master-verilog/inc1.v \
	./LC-3-master-verilog/full_adder.v \
	./LC-3-master-verilog/add16.v \
	./LC-3-master-verilog/alu.v \
	./LC-3-master-verilog/register_16.v \
	./LC-3-master-verilog/register_file.v \
	./LC-3-master-verilog/ram.v \
	./LC-3-master-verilog/nzp.v \
	./LC-3-master-verilog/pc.v \
	./LC-3-master-verilog/fsm_control.v \
	./LC-3-master-verilog/lc_3.v \
	
	
simulate:
	vvp -n ./build/simv #vvp为仿真语句，会生成测试激励中所规定的vcd文件
	
gtkwave:
	gtkwave tb_****.vcd


clean:
	@rm -rf wave
	@rm -rf tb_****.vcd
	@rm -rf ./build/simv
	@rm -rf ./src/D_latch.v.out #可以不写省略这一行，因为已经把v.out文件命名为simv文件了，故不会生成v.out文件