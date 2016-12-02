onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Magenta /regstim/RegWrite
add wave -noupdate -color Magenta /regstim/clk
add wave -noupdate -expand -group Write -color Yellow /regstim/WriteRegister
add wave -noupdate -expand -group Write -color Yellow -radix hexadecimal -childformat {{{/regstim/WriteData[63]} -radix hexadecimal} {{/regstim/WriteData[62]} -radix hexadecimal} {{/regstim/WriteData[61]} -radix hexadecimal} {{/regstim/WriteData[60]} -radix hexadecimal} {{/regstim/WriteData[59]} -radix hexadecimal} {{/regstim/WriteData[58]} -radix hexadecimal} {{/regstim/WriteData[57]} -radix hexadecimal} {{/regstim/WriteData[56]} -radix hexadecimal} {{/regstim/WriteData[55]} -radix hexadecimal} {{/regstim/WriteData[54]} -radix hexadecimal} {{/regstim/WriteData[53]} -radix hexadecimal} {{/regstim/WriteData[52]} -radix hexadecimal} {{/regstim/WriteData[51]} -radix hexadecimal} {{/regstim/WriteData[50]} -radix hexadecimal} {{/regstim/WriteData[49]} -radix hexadecimal} {{/regstim/WriteData[48]} -radix hexadecimal} {{/regstim/WriteData[47]} -radix hexadecimal} {{/regstim/WriteData[46]} -radix hexadecimal} {{/regstim/WriteData[45]} -radix hexadecimal} {{/regstim/WriteData[44]} -radix hexadecimal} {{/regstim/WriteData[43]} -radix hexadecimal} {{/regstim/WriteData[42]} -radix hexadecimal} {{/regstim/WriteData[41]} -radix hexadecimal} {{/regstim/WriteData[40]} -radix hexadecimal} {{/regstim/WriteData[39]} -radix hexadecimal} {{/regstim/WriteData[38]} -radix hexadecimal} {{/regstim/WriteData[37]} -radix hexadecimal} {{/regstim/WriteData[36]} -radix hexadecimal} {{/regstim/WriteData[35]} -radix hexadecimal} {{/regstim/WriteData[34]} -radix hexadecimal} {{/regstim/WriteData[33]} -radix hexadecimal} {{/regstim/WriteData[32]} -radix hexadecimal} {{/regstim/WriteData[31]} -radix hexadecimal} {{/regstim/WriteData[30]} -radix hexadecimal} {{/regstim/WriteData[29]} -radix hexadecimal} {{/regstim/WriteData[28]} -radix hexadecimal} {{/regstim/WriteData[27]} -radix hexadecimal} {{/regstim/WriteData[26]} -radix hexadecimal} {{/regstim/WriteData[25]} -radix hexadecimal} {{/regstim/WriteData[24]} -radix hexadecimal} {{/regstim/WriteData[23]} -radix hexadecimal} {{/regstim/WriteData[22]} -radix hexadecimal} {{/regstim/WriteData[21]} -radix hexadecimal} {{/regstim/WriteData[20]} -radix hexadecimal} {{/regstim/WriteData[19]} -radix hexadecimal} {{/regstim/WriteData[18]} -radix hexadecimal} {{/regstim/WriteData[17]} -radix hexadecimal} {{/regstim/WriteData[16]} -radix hexadecimal} {{/regstim/WriteData[15]} -radix hexadecimal} {{/regstim/WriteData[14]} -radix hexadecimal} {{/regstim/WriteData[13]} -radix hexadecimal} {{/regstim/WriteData[12]} -radix hexadecimal} {{/regstim/WriteData[11]} -radix hexadecimal} {{/regstim/WriteData[10]} -radix hexadecimal} {{/regstim/WriteData[9]} -radix hexadecimal} {{/regstim/WriteData[8]} -radix hexadecimal} {{/regstim/WriteData[7]} -radix hexadecimal} {{/regstim/WriteData[6]} -radix hexadecimal} {{/regstim/WriteData[5]} -radix hexadecimal} {{/regstim/WriteData[4]} -radix hexadecimal} {{/regstim/WriteData[3]} -radix hexadecimal} {{/regstim/WriteData[2]} -radix hexadecimal} {{/regstim/WriteData[1]} -radix hexadecimal} {{/regstim/WriteData[0]} -radix hexadecimal}} -subitemconfig {{/regstim/WriteData[63]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[62]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[61]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[60]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[59]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[58]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[57]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[56]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[55]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[54]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[53]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[52]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[51]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[50]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[49]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[48]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[47]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[46]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[45]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[44]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[43]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[42]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[41]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[40]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[39]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[38]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[37]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[36]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[35]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[34]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[33]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[32]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[31]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[30]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[29]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[28]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[27]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[26]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[25]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[24]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[23]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[22]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[21]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[20]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[19]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[18]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[17]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[16]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[15]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[14]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[13]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[12]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[11]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[10]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[9]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[8]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[7]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[6]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[5]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[4]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[3]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[2]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[1]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0} {/regstim/WriteData[0]} {-color Yellow -height 15 -radix hexadecimal -radixshowbase 0}} /regstim/WriteData
add wave -noupdate -expand -group Read1 /regstim/ReadRegister1
add wave -noupdate -expand -group Read1 -radix hexadecimal -radixshowbase 0 /regstim/ReadData1
add wave -noupdate -expand -group Read2 -color Cyan /regstim/ReadRegister2
add wave -noupdate -expand -group Read2 -color Cyan -radix hexadecimal /regstim/ReadData2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 159
configure wave -valuecolwidth 122
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
WaveRestoreZoom {0 ps} {332631976 ps}
