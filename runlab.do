# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./registerFile.sv"
vlog "./mux64_32_1.sv"
vlog "./decoder5_32.sv"
vlog "./register32_64Bit.sv"
vlog "./register64Bit.sv"
vlog "./Mux32_1.sv"
vlog "./Mux2_1.sv"
vlog "./decoder3_8.sv"
vlog "./decoder2_4.sv"
vlog "./D_FF.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work regstim

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do registerFile_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
