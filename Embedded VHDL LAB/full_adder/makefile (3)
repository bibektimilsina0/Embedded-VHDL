# VHDL files
SRC_FILES := full_adder.vhdl full_adder_tb.vhdl or_gate.vhdl half_adder.vhdl

# Main target
all: compile simulate

# Compile VHDL files
compile:
	ghdl -a  $(SRC_FILES)

# Simulate the design and generate VCD file
simulate:
	ghdl -e  full_adder_tb
	ghdl -r  full_adder_tb --vcd=result.vcd 

# Clean up temporary files
clean:
	rm -f *.o *.cf result.vcd work-obj93.cf

# Remove all generated files
distclean: clean
	rm -f full_adder_tb
