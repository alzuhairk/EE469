# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./register64Bit.sv"
vlog "./register32_64Bit.sv"
vlog "./D_FF.sv"
vlog "./Mux2_1.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work register32_64BitTestbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do register32_64Bit_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
