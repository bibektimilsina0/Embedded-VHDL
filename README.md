# Embedded System VHDL LAB Assignment

This repository contains the VHDL code and their testbench. The testbench can be visualized by the gtkwave tool.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Cloning the Repository](#cloning-the-repository)
  - [Installing GHDL](#installing-ghdl)
  - [Installing GTKWave](#installing-gtkwave)

## Prerequisites

Ensure you have the following software installed on your system and choose any text-editor as you prefer.

- ghdl
- gtkwave

## Getting Started

### Cloning the Repository

```bash
git clone https://github.com/mishraprayash/EmbeddedVHDL.git
cd Embedded\ VHDL\ LAB/
```

### Installing GHDL

Follow the instructions on the [GHDL GitHub repository](https://github.com/ghdl/ghdl) to install GHDL on your system.

### Linux

```bash
    sudo apt install ghdl
```

### Installing GTKWave

Follow the instructions on the [GTKWave website](http://gtkwave.sourceforge.net/) to install GTKWave on your system.

```bash
    sudo apt install gtkwave
```
This will install the required GTKWave GUI which can be opened directly from the terminal.

## Analyzing, Elaborating and Running 

Here we have the write the different test bench code so that we can produce the result.vcd file from these test benches which can be visualized using gtkwave tool.

For this I have created a makefile.

### makefile


```bash
# VHDL files
SRC_FILES := [main_code].vhdl [testbench_code].vhdl

# Main target
all: compile simulate

# Compile VHDL files
compile:
	ghdl -a  $(SRC_FILES)

# Simulate the design and generate VCD file
simulate:
	ghdl -e  testbench_code
	ghdl -r  testbench_code --vcd=result.vcd --stop-time=50us

# Clean up temporary files
clean:
	rm -f *.o *.cf result.vcd work-obj93.cf

# Remove all generated files
distclean: clean
	rm -f testbench_code

```

## Running makefile

- To compile and simulate seperately we can use the command 
```bash
    make compile
    make simulate
```
- To compile and simulate together
```bash
    make all
```
- To cleanup all the initially generated files
```bash
    make distclean
```


After runnig ` make all ` we can see the `result.vcd` file generated in our directory. Now we can open this file using `gtktool`.

```bash
    gtkwave result.vcd
```

Now we can playaround the `gtkwave` tool 
```bash
    gtkwave result.vcd
```
## Conclusion

By following above instructions we can configure our machine for the VHDL and GTKWave tool. Different testcases can be added and tested as needed from the testbench. Also the time constraint can be changed accordingly. Inside the makefile during the runnning of the testbench the ```--stop-time``` should be configured depending upon the program execution time to see the proper result. 