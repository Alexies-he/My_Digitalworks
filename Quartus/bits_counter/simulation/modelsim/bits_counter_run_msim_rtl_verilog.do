transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/EDA/DigitalCircuit/My_Digitalworks/My_Digitalworks/Sequential_circuits/Counter/src {D:/EDA/DigitalCircuit/My_Digitalworks/My_Digitalworks/Sequential_circuits/Counter/src/bits_counter.v}

vlog -vlog01compat -work work +incdir+D:/EDA/DigitalCircuit/My_Digitalworks/My_Digitalworks/Quartus/bits_counter/../../Sequential_circuits/Counter/src {D:/EDA/DigitalCircuit/My_Digitalworks/My_Digitalworks/Quartus/bits_counter/../../Sequential_circuits/Counter/src/tb_bits_counter.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxv_ver -L rtl_work -L work -voptargs="+acc"  tb_bits_counter

add wave *
view structure
view signals
run -all
