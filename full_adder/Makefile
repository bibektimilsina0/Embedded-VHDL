all: result.vcd

result.vcd: Full_Adder.vhd FA_tb.vhd
    ghdl -a full_adder.vhdl
    ghdl -a or_gate.vhdl
    ghdl -a full_adder_tb.vhdl
    ghdl -a half_adder.vhdl
    ghdl -e full_adder_tb
    ghdl -r full_adder_tb --vcd=result.vcd

clean:
    rm -rf result.vcd