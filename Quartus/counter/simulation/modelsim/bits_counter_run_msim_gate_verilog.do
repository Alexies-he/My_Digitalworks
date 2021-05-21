transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {bits_counter.vo}

vlog -vlog01compat -work work +incdir+D:/EDA/DigitalCircuit/MyDigitalWorks/Quartus/counter/../../Synchronous\ sequential\ circuits/Counter/src {D:/EDA/DigitalCircuit/MyDigitalWorks/Quartus/counter/../../Synchronous sequential circuits/Counter/src/tb_3bits_counter.v}

vsim -t 1ps -L maxv_ver -L gate_work -L work -voptargs="+acc"  tb_bits_counter

add wave *
view structure
view signals
run -all
