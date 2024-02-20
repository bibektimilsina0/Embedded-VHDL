# VHDL files
SRC_FILES := lcm_updated.vhdl lcm_tb_updated.vhdl

# Main target
all: compile simulate

# Compile VHDL files
compile:
	ghdl -a  $(SRC_FILES)

# Simulate the design and generate VCD file
simulate:
	ghdl -e  fsm_lcm_tb
	ghdl -r  fsm_lcm_tb --vcd=result.vcd --stop-time=50us 

# Clean up temporary files
clean:
	rm -f *.o *.cf result.vcd work-obj93.cf

# Remove all generated files
distclean: clean
	rm -f fsm_lcm_tb
