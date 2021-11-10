onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /UART_Tx_vlg_tst/eachvec
add wave -noupdate /UART_Tx_vlg_tst/TX_LAUNCH
add wave -noupdate /UART_Tx_vlg_tst/clk_Tx
add wave -noupdate /UART_Tx_vlg_tst/Tx_out
add wave -noupdate /UART_Tx_vlg_tst/UART_clk
add wave -noupdate /UART_Tx_vlg_tst/data
add wave -noupdate /UART_Tx_vlg_tst/start_tx_flag
add wave -noupdate /UART_Tx_vlg_tst/tx_launch
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {379 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 230
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {225280 ps}
