onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpuTestbench/reset
add wave -noupdate /cpuTestbench/clk
add wave -noupdate /cpuTestbench/dut/arithmeticLogic/result
add wave -noupdate -expand -group regFile /cpuTestbench/dut/registerFile/ReadRegister1
add wave -noupdate -expand -group regFile /cpuTestbench/dut/registerFile/ReadRegister2
add wave -noupdate -expand -group regFile /cpuTestbench/dut/registerFile/WriteRegister
add wave -noupdate -expand -group regFile /cpuTestbench/dut/registerFile/registerOutputs
add wave -noupdate -expand -group PC /cpuTestbench/dut/programCounter/dataOut
add wave -noupdate /cpuTestbench/dut/instruction
add wave -noupdate /cpuTestbench/dut/flags
add wave -noupdate /cpuTestbench/dut/ALUOp
add wave -noupdate -expand -group AddersInPC /cpuTestbench/dut/FA0/result
add wave -noupdate -expand -group AddersInPC /cpuTestbench/dut/FA1/result
add wave -noupdate -expand -group dataMem /cpuTestbench/dut/dataMemory/address
add wave -noupdate -expand -group dataMem /cpuTestbench/dut/dataMemory/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 393
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
WaveRestoreZoom {0 ps} {212320 ps}
