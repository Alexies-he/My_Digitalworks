transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/EDA/DigitalCircuit/My_Digitalworks/My_Digitalworks/System_design/Wallace/src {D:/EDA/DigitalCircuit/My_Digitalworks/My_Digitalworks/System_design/Wallace/src/wallace_top.v}
vlog -vlog01compat -work work +incdir+D:/EDA/DigitalCircuit/My_Digitalworks/My_Digitalworks/System_design/Wallace/src {D:/EDA/DigitalCircuit/My_Digitalworks/My_Digitalworks/System_design/Wallace/src/half_adder_down.v}
vlog -vlog01compat -work work +incdir+D:/EDA/DigitalCircuit/My_Digitalworks/My_Digitalworks/System_design/Wallace/src {D:/EDA/DigitalCircuit/My_Digitalworks/My_Digitalworks/System_design/Wallace/src/fall_adder_down.v}
vlog -vlog01compat -work work +incdir+D:/EDA/DigitalCircuit/My_Digitalworks/My_Digitalworks/System_design/Wallace/src {D:/EDA/DigitalCircuit/My_Digitalworks/My_Digitalworks/System_design/Wallace/src/add_down.v}

vlog -vlog01compat -work work +incdir+D:/EDA/DigitalCircuit/My_Digitalworks/My_Digitalworks/Quartus/wallace/../../System_design/Wallace/src {D:/EDA/DigitalCircuit/My_Digitalworks/My_Digitalworks/Quartus/wallace/../../System_design/Wallace/src/tb_wallace.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L maxv_ver -L rtl_work -L work -voptargs="+acc"  tb_wallace

add wave *
view structure
view signals
run -all
