# VHDL files
SRC_FILES := bcd_counter.vhdl bcd_counter_tb.vhdl

# Main target
all: compile simulate

# Compile VHDL files
compile:
	ghdl -a  $(SRC_FILES)

# Simulate the design and generate VCD file
simulate:
	ghdl -e  tb_bcd_counter
	ghdl -r  tb_bcd_counter --vcd=result.vcd --stop-time=50us

# Clean up temporary files
clean:
	rm -f *.o *.cf result.vcd work-obj93.cf

# Remove all generated files
distclean: clean
	rm -f tb_bcd_counter
