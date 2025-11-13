transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/8-bit\ ALU-Project {C:/intelFPGA_lite/18.1/8-bit ALU-Project/bit_8_alu.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/8-bit\ ALU-Project {C:/intelFPGA_lite/18.1/8-bit ALU-Project/bit_1_alu.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/8-bit\ ALU-Project {C:/intelFPGA_lite/18.1/8-bit ALU-Project/bit_8_alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  bit_8_alu_tb

add wave *
view structure
view signals
run -all
