transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Projects/UART_Tx {C:/intelFPGA_lite/18.1/Projects/UART_Tx/UART_Tx.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Projects/UART_Tx/simulation/modelsim {C:/intelFPGA_lite/18.1/Projects/UART_Tx/simulation/modelsim/UART_Tx.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  UART_Tx_vlg_tst

add wave *
view structure
view signals
run -all
