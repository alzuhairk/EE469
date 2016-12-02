# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./cpu.sv"
vlog "./alu.sv"
vlog "./fastAdder.sv"
vlog "./mux8_1.sv"
vlog "./regfile.sv"
vlog "./mux64_32_1.sv"
vlog "./decoder5_32.sv"
vlog "./register32_64Bit.sv"
vlog "./register64Bit.sv"
vlog "./Mux32_1.sv"
vlog "./Mux2_1.sv"
vlog "./decoder3_8.sv"
vlog "./decoder2_4.sv"
vlog "./D_FF.sv"
vlog "./shiftLeft.sv"
vlog "./pc.sv"
vlog "./instructmem.sv"
vlog "./datamem.sv"
vlog "./mux64x2_1.sv"
vlog "./signExtend.sv"
vlog "./zeroExtend.sv"
vlog "./register14Bit.sv"
vlog "./register32Bit.sv"
vlog "./comp5Bit.sv"
vlog "./compareZero.sv"
vlog "./controlFlagLogic.sv"


# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work cpuTestbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do cpu_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End