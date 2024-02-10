all: result.vcd

result.vcd: Full_Adder.vhd FA_tb.vhd
    ghdl -a Full_Adder.vhd
    ghdl -a FA_tb.vhd
    ghdl -e FA_tb
    ghdl -r FA_tb --vcd=result.vcd --stop-time=10us

clean:
    rm -rf result.vcd