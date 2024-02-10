all: result.vcd

result.vcd:counter0-9.vhdl counter0-9_tb.vhdl
    ghdl -a counter0-9.vhdl
    ghdl -a counter0-9_tb.vhdl
    ghdl -e counter0-9_tb
    ghdl -r counter0-9_tb --vcd=result.vcd --stop-time=10us
clean:
    rm -rf result.vcd