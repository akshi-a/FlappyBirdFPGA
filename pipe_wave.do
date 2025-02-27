onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pipe_testbench/clk
add wave -noupdate /pipe_testbench/reset
add wave -noupdate /pipe_testbench/right
add wave -noupdate /pipe_testbench/lossDetect
add wave -noupdate /pipe_testbench/lightOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 10
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {950 ps} {1950 ps}
