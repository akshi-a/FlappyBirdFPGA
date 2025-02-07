onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /detect_collision_testbench/g7
add wave -noupdate /detect_collision_testbench/g6
add wave -noupdate /detect_collision_testbench/g5
add wave -noupdate /detect_collision_testbench/g4
add wave -noupdate /detect_collision_testbench/g3
add wave -noupdate /detect_collision_testbench/g2
add wave -noupdate /detect_collision_testbench/g1
add wave -noupdate /detect_collision_testbench/g0
add wave -noupdate /detect_collision_testbench/r7
add wave -noupdate /detect_collision_testbench/r6
add wave -noupdate /detect_collision_testbench/r5
add wave -noupdate /detect_collision_testbench/r4
add wave -noupdate /detect_collision_testbench/r3
add wave -noupdate /detect_collision_testbench/r2
add wave -noupdate /detect_collision_testbench/r1
add wave -noupdate /detect_collision_testbench/r0
add wave -noupdate /detect_collision_testbench/reset
add wave -noupdate /detect_collision_testbench/lossDetect
add wave -noupdate /detect_collision_testbench/groundOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7060 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {7050 ps} {8050 ps}
