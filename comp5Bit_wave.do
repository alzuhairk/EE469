onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /comp5BitTestbench/clk
add wave -noupdate /comp5BitTestbench/a
add wave -noupdate /comp5BitTestbench/b
add wave -noupdate /comp5BitTestbench/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 135
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {44591 ps}
