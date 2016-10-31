onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /checkLogicTestbench/clk
add wave -noupdate /checkLogicTestbench/opcode
add wave -noupdate /checkLogicTestbench/reg2Loc
add wave -noupdate /checkLogicTestbench/ALUSrc
add wave -noupdate /checkLogicTestbench/MemToReg
add wave -noupdate /checkLogicTestbench/RegWrite
add wave -noupdate /checkLogicTestbench/MemWrite
add wave -noupdate /checkLogicTestbench/BrTaken
add wave -noupdate /checkLogicTestbench/UncondBr
add wave -noupdate /checkLogicTestbench/ALUOp
add wave -noupdate /checkLogicTestbench/LBranch
add wave -noupdate /checkLogicTestbench/isBR
add wave -noupdate /checkLogicTestbench/addImm
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 70
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
WaveRestoreZoom {0 ps} {106368 ps}
