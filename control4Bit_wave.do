onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /control4BitTestbench/clk
add wave -noupdate /control4BitTestbench/cIn
add wave -noupdate /control4BitTestbench/cOut
add wave -noupdate /control4BitTestbench/ctrl
add wave -noupdate -expand -group Binary -radix binary -radixshowbase 0 /control4BitTestbench/a
add wave -noupdate -expand -group Binary -radix binary -radixshowbase 0 /control4BitTestbench/b
add wave -noupdate -expand -group Binary -radix binary -radixshowbase 0 /control4BitTestbench/result
add wave -noupdate -expand -group Decimal -radix decimal -radixshowbase 0 /control4BitTestbench/a
add wave -noupdate -expand -group Decimal -radix decimal -radixshowbase 0 /control4BitTestbench/b
add wave -noupdate -expand -group Decimal -radix decimal -radixshowbase 0 /control4BitTestbench/result
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 84
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {73642 ps}
