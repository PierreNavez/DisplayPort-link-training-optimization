onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /data_handler_tb/DUT/reset
add wave -noupdate /data_handler_tb/DUT/clk_100
add wave -noupdate /data_handler_tb/DUT/decod_comm
add wave -noupdate /data_handler_tb/DUT/decod_address
add wave -noupdate /data_handler_tb/DUT/decod_length
add wave -noupdate /data_handler_tb/DUT/decod_data0
add wave -noupdate /data_handler_tb/DUT/decod_data1
add wave -noupdate /data_handler_tb/DUT/decod_data2
add wave -noupdate /data_handler_tb/DUT/decod_data3
add wave -noupdate /data_handler_tb/DUT/decod_data4
add wave -noupdate /data_handler_tb/DUT/decod_data5
add wave -noupdate /data_handler_tb/DUT/decod_data6
add wave -noupdate /data_handler_tb/DUT/decod_comm_ready
add wave -noupdate /data_handler_tb/DUT/decod_address_ready
add wave -noupdate /data_handler_tb/DUT/decod_length_ready
add wave -noupdate /data_handler_tb/DUT/decod_data0_ready
add wave -noupdate /data_handler_tb/DUT/decod_data1_ready
add wave -noupdate /data_handler_tb/DUT/decod_data2_ready
add wave -noupdate /data_handler_tb/DUT/decod_data3_ready
add wave -noupdate /data_handler_tb/DUT/decod_data4_ready
add wave -noupdate /data_handler_tb/DUT/decod_data5_ready
add wave -noupdate /data_handler_tb/DUT/decod_data6_ready
add wave -noupdate /data_handler_tb/DUT/link_training_active
add wave -noupdate /data_handler_tb/DUT/avm_readdata
add wave -noupdate /data_handler_tb/DUT/avm_read
add wave -noupdate /data_handler_tb/DUT/avm_address
add wave -noupdate /data_handler_tb/DUT/current_state
add wave -noupdate /data_handler_tb/DUT/fsm_continue
add wave -noupdate /data_handler_tb/DUT/last_val
add wave -noupdate /data_handler_tb/DUT/edge_detected
add wave -noupdate /data_handler_tb/DUT/reg_32_0
add wave -noupdate /data_handler_tb/DUT/reg_32_1
add wave -noupdate /data_handler_tb/DUT/local_address
add wave -noupdate /data_handler_tb/DUT/local_length
add wave -noupdate /data_handler_tb/DUT/local_data
add wave -noupdate /data_handler_tb/DUT/useful_bytes
add wave -noupdate /data_handler_tb/DUT/write_reg
add wave -noupdate /data_handler_tb/DUT/useful_bytes_set
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 335
configure wave -valuecolwidth 149
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
WaveRestoreZoom {0 ps} {425189945 ps}
