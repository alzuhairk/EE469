onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpuTestbench/reset
add wave -noupdate /cpuTestbench/clk
add wave -noupdate -expand -group regFile -color Gold /cpuTestbench/dut/registerFile/ReadRegister1
add wave -noupdate -expand -group regFile -color Gold /cpuTestbench/dut/registerFile/ReadRegister2
add wave -noupdate -expand -group regFile -color Gold /cpuTestbench/dut/registerFile/WriteRegister
add wave -noupdate -expand -group regFile -color Gold -radix decimal /cpuTestbench/dut/registerFile/registerOutputs
add wave -noupdate -expand -group PC -color Cyan /cpuTestbench/dut/programCounter/dataOut
add wave -noupdate /cpuTestbench/dut/arithmeticLogic/result
add wave -noupdate -expand -group AddersInPC -color Cyan /cpuTestbench/dut/FA0/result
add wave -noupdate -expand -group AddersInPC -color Cyan /cpuTestbench/dut/FA1/result
add wave -noupdate -expand -group dataMem -color Gray60 /cpuTestbench/dut/dataMemory/address
add wave -noupdate -expand -group dataMem -color Gray60 /cpuTestbench/dut/dataMemory/mem
add wave -noupdate -color Cyan /cpuTestbench/dut/instruction
add wave -noupdate -expand -group {Register Fetch Stage} -color {Dark Orchid} /cpuTestbench/dut/rfInstruction
add wave -noupdate -expand -group {Register Fetch Stage} -color {Dark Orchid} /cpuTestbench/dut/rfRn
add wave -noupdate -expand -group {Register Fetch Stage} -color {Dark Orchid} /cpuTestbench/dut/rfRm
add wave -noupdate -expand -group {Register Fetch Stage} -color {Dark Orchid} /cpuTestbench/dut/regDataDa
add wave -noupdate -expand -group {Register Fetch Stage} -color {Dark Orchid} /cpuTestbench/dut/regDataDb
add wave -noupdate -expand -group {Execute Stage} -color Red /cpuTestbench/dut/exInstruction
add wave -noupdate -expand -group {Execute Stage} -color Red /cpuTestbench/dut/exFlags
add wave -noupdate -expand -group {Execute Stage} -color Red /cpuTestbench/dut/rfDa
add wave -noupdate -expand -group {Execute Stage} -color Red /cpuTestbench/dut/rfDb
add wave -noupdate -expand -group {Execute Stage} -color Red /cpuTestbench/dut/aluOutput
add wave -noupdate -expand -group {Execute Stage} -color Red /cpuTestbench/dut/exRdRfRnMatch
add wave -noupdate -expand -group {Execute Stage} -color Red /cpuTestbench/dut/exRdRfRmMatch
add wave -noupdate -expand -group {Execute Stage} -color Red /cpuTestbench/dut/exRd
add wave -noupdate -expand -group {Data Memory Stage} -color Orange /cpuTestbench/dut/dmInstruction
add wave -noupdate -expand -group {Data Memory Stage} -color Orange /cpuTestbench/dut/dmFlags
add wave -noupdate -expand -group {Data Memory Stage} -color Orange /cpuTestbench/dut/dmRdRfRnMatch
add wave -noupdate -expand -group {Data Memory Stage} -color Orange /cpuTestbench/dut/dmRdRfRmMatch
add wave -noupdate -expand -group {Data Memory Stage} -color Orange /cpuTestbench/dut/dmRd
add wave -noupdate -expand -group {Data Memory Stage} -color Orange /cpuTestbench/dut/MemToRegMuxOut
add wave -noupdate -expand -group {Write Back Stage} -color Yellow /cpuTestbench/dut/wbInstruction
add wave -noupdate -expand -group {Write Back Stage} -color Yellow /cpuTestbench/dut/wbFlags
add wave -noupdate -expand -group {Write Back Stage} -color Yellow /cpuTestbench/dut/wbRd
add wave -noupdate -expand -group {Write Back Stage} -color Yellow /cpuTestbench/dut/dmMemToRegToL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {32447 ps} 0}
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
WaveRestoreZoom {0 ps} {159138 ps}
