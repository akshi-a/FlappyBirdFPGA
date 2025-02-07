# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./DE1_SoC.sv"
vlog "./LFSR6.sv"
vlog "./LFSR6_testbench.sv"
vlog "./detect_collision.sv"
#vlog "./detect_collision_testbench.sv"
vlog "./detect_score.sv"
vlog "./hex_counter.sv"
#vlog "./hex_counter_testbench.sv"
vlog "./led_matrix_driver.sv"
vlog "./bird.sv"
#vlog "./bird_testbench.sv"
vlog "./bird_bottom.sv"
#vlog "./bird_bottom_testbench.sv"
vlog "./bird_init.sv"
#vlog "./bird_init_testbech.sv"
vlog "./bird_top.sv"
#vlog "./bird_top_testbench.sv"
vlog "./pipe.sv"
#vlog "./pipe_testbench.sv"
vlog "./pipe_init.sv"
#vlog "./pipe_init_testbench.sv"
vlog "./clock_divider.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work DE1_SoC_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
#do pipe_init_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
