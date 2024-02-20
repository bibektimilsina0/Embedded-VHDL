# VHDL files
SRC_FILES := JK_Flipflop.vhdl JK_TB.vhdl

# Main target
all: compile simulate

# Compile VHDL files
compile:
	ghdl -a  $(SRC_FILES)

# Simulate the design and generate VCD file
simulate:
	ghdl -e  JK_TB
	ghdl -r  JK_TB --vcd=result.vcd --stop-time=50us 

# Clean up temporary files
clean:
	rm -f *.o *.cf result.vcd work-obj93.cf

# Remove all generated files
distclean: clean
	rm -f jk_tb
