onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /bird_testbench/clk
add wave -noupdate /bird_testbench/reset
add wave -noupdate /bird_testbench/KEY0
add wave -noupdate /bird_testbench/redAbove
add wave -noupdate /bird_testbench/redBelow
add wave -noupdate /bird_testbench/lightOn
add wave -noupdate /bird_testbench/lossDetect
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1425 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {1250 ps} {2250 ps}
