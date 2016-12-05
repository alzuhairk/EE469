onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpuTestbench/dut/controlLogic/BrTaken
add wave -noupdate /cpuTestbench/dut/controlLogic/flags
add wave -noupdate /cpuTestbench/dut/pcCycleLateMux/zero
add wave -noupdate /cpuTestbench/dut/pcCycleLateMux/one
add wave -noupdate /cpuTestbench/dut/pcCycleLateMux/control
add wave -noupdate /cpuTestbench/reset
add wave -noupdate /cpuTestbench/clk
add wave -noupdate -expand -group regFile -color Gold /cpuTestbench/dut/registerFile/ReadRegister1
add wave -noupdate -expand -group regFile -color Gold /cpuTestbench/dut/registerFile/ReadRegister2
add wave -noupdate -expand -group regFile -color Gold /cpuTestbench/dut/registerFile/WriteRegister
add wave -noupdate -expand -group regFile -color Gold -radix decimal -childformat {{{/cpuTestbench/dut/registerFile/registerOutputs[31]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[30]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[29]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[28]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[27]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[26]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[25]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[24]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[23]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[22]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[21]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[20]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[19]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[18]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[17]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[16]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[15]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[14]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[13]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[12]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[11]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[10]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[9]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[8]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[7]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[6]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[5]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[4]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[3]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[2]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[1]} -radix decimal} {{/cpuTestbench/dut/registerFile/registerOutputs[0]} -radix decimal}} -subitemconfig {{/cpuTestbench/dut/registerFile/registerOutputs[31]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[30]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[29]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[28]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[27]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[26]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[25]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[24]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[23]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[22]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[21]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[20]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[19]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[18]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[17]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[16]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[15]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[14]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[13]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[12]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[11]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[10]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[9]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[8]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[7]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[6]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[5]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[4]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[3]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[2]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[1]} {-color Gold -height 15 -radix decimal} {/cpuTestbench/dut/registerFile/registerOutputs[0]} {-color Gold -height 15 -radix decimal}} /cpuTestbench/dut/registerFile/registerOutputs
add wave -noupdate -expand -group PC -color Cyan -radix decimal /cpuTestbench/dut/programCounter/dataOut
add wave -noupdate /cpuTestbench/dut/arithmeticLogic/result
add wave -noupdate -expand -group AddersInPC -color Cyan -radix decimal /cpuTestbench/dut/FA0/result
add wave -noupdate -expand -group AddersInPC -color Cyan -radix decimal /cpuTestbench/dut/FA1/result
add wave -noupdate -expand -group AddersInPC -radix decimal /cpuTestbench/dut/FA1/A
add wave -noupdate -expand -group AddersInPC -radix decimal /cpuTestbench/dut/FA1/B
add wave -noupdate -radix decimal /cpuTestbench/dut/pcFlipFlop/dataOut
add wave -noupdate -expand -group dataMem -color Gray60 /cpuTestbench/dut/dataMemory/address
add wave -noupdate -expand -group dataMem -color Gray60 /cpuTestbench/dut/dataMemory/mem
add wave -noupdate -color Cyan /cpuTestbench/dut/instruction
add wave -noupdate -expand -group {Register Fetch Stage} /cpuTestbench/dut/rfFlagsRegister/dataOut
add wave -noupdate -expand -group {Register Fetch Stage} /cpuTestbench/dut/cmp/isZero
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
add wave -noupdate -expand -group {B.LT Info} /cpuTestbench/dut/doBr
add wave -noupdate -expand -group {B.LT Info} /cpuTestbench/dut/BLTTaken
add wave -noupdate -expand -group {B.LT Info} /cpuTestbench/dut/aluNegativeFlag
add wave -noupdate -expand -group {B.LT Info} /cpuTestbench/dut/aluOverflowFlag
add wave -noupdate -expand -group {B.LT Info} /cpuTestbench/dut/aluNegativePrev
add wave -noupdate -expand -group {B.LT Info} /cpuTestbench/dut/aluOverflowPrev
add wave -noupdate -expand -group {Forwarding RfRd} -color Khaki /cpuTestbench/dut/useForwardedDataRfRd
add wave -noupdate -expand -group {Forwarding RfRd} -color Khaki /cpuTestbench/dut/exRfRdExRdMatch
add wave -noupdate -expand -group {Forwarding RfRd} -color Khaki /cpuTestbench/dut/exReadData2Out
add wave -noupdate -expand -group {Forwarding RfRd} -color Khaki /cpuTestbench/dut/dmReadData2Out
add wave -noupdate -expand -group {Forwarding RfRd} -color Khaki /cpuTestbench/dut/forwardingDataRfDb
add wave -noupdate -expand -group {Forwarding RfRd} -color Khaki /cpuTestbench/dut/forwardedDataRfRd
add wave -noupdate -expand -group {Forwarding RfRd} -color Khaki /cpuTestbench/dut/isSTURorCBZ
add wave -noupdate -expand -group {Forwarding RfRd} -color Khaki /cpuTestbench/dut/rfIsSTURorCBZ
add wave -noupdate -expand -group {Forwarding RfRd} -color Khaki /cpuTestbench/dut/isSTURorCBZforIForRF
add wave -noupdate -expand -group {Forwarding RfRd} -color Khaki /cpuTestbench/dut/regDataDb
add wave -noupdate -expand -group {Forwarding Other} /cpuTestbench/dut/useForwardedDataDb
add wave -noupdate -expand -group {Forwarding Other} /cpuTestbench/dut/readData2
add wave -noupdate -expand -group {Forwarding Other} /cpuTestbench/dut/forwardingDataDb
add wave -noupdate -expand -group {Forwarding Other} /cpuTestbench/dut/forwardedDataRfRm
add wave -noupdate -expand -group {Forwarding Other} -expand -group DA /cpuTestbench/dut/useForwardedDataDa
add wave -noupdate -expand -group {Forwarding Other} -expand -group DA /cpuTestbench/dut/dmRdRfRnMatch
add wave -noupdate -expand -group {Forwarding Other} -expand -group DA /cpuTestbench/dut/exRdRfRnMatch
add wave -noupdate -expand -group {Forwarding Other} -expand -group DA /cpuTestbench/dut/aluOutput
add wave -noupdate -expand -group {Forwarding Other} -expand -group DA /cpuTestbench/dut/exAluOutput
add wave -noupdate -expand -group {Forwarding Other} -expand -group DA /cpuTestbench/dut/forwardingDataDa
add wave -noupdate -expand -group {Forwarding Other} -expand -group DA /cpuTestbench/dut/regDataDa
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {223339 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 180
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
WaveRestoreZoom {152702 ps} {313441 ps}
