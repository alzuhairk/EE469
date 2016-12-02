onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /register32_64BitTestbench/clk
add wave -noupdate /register32_64BitTestbench/reset
add wave -noupdate /register32_64BitTestbench/writeEnable
add wave -noupdate -radix hexadecimal -radixshowbase 0 /register32_64BitTestbench/writeData
add wave -noupdate -radix hexadecimal -childformat {{{/register32_64BitTestbench/dataOut[31]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[30]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[29]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[28]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[27]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[26]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[25]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[24]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[23]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[22]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[21]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[20]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[19]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[18]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[17]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[16]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[15]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[14]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[13]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[12]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[11]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[10]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[9]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[8]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[7]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[6]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[5]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[4]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[3]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[2]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[1]} -radix hexadecimal} {{/register32_64BitTestbench/dataOut[0]} -radix hexadecimal}} -radixshowbase 0 -expand -subitemconfig {{/register32_64BitTestbench/dataOut[31]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[30]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[29]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[28]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[27]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[26]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[25]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[24]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[23]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[22]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[21]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[20]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[19]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[18]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[17]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[16]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[15]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[14]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[13]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[12]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[11]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[10]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[9]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[8]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[7]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[6]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[5]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[4]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[3]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[2]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[1]} {-radix hexadecimal -radixshowbase 0} {/register32_64BitTestbench/dataOut[0]} {-radix hexadecimal -radixshowbase 0}} /register32_64BitTestbench/dataOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 207
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {1042 ps}
