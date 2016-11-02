onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /register64BitTestbench/writeEnable
add wave -noupdate /register64BitTestbench/clk
add wave -noupdate /register64BitTestbench/reset
add wave -noupdate -radix hexadecimal -radixshowbase 0 /register64BitTestbench/writeData
add wave -noupdate -radix hexadecimal -radixshowbase 0 /register64BitTestbench/dataOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 109
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
WaveRestoreZoom {0 ps} {63616 ps}
