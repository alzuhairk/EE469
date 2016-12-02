onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fastAdderTestbench/clk
add wave -noupdate /fastAdderTestbench/cntrl
add wave -noupdate -radix decimal -radixshowbase 0 /fastAdderTestbench/A
add wave -noupdate -radix decimal -radixshowbase 0 /fastAdderTestbench/B
add wave -noupdate -radix decimal -radixshowbase 0 /fastAdderTestbench/result
add wave -noupdate /fastAdderTestbench/cOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 128
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
WaveRestoreZoom {0 ps} {33727 ps}
