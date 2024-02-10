all: result.vcd

result.vcd: OR_Gate.vhdl OR_tb.vhdl
    ghdl -a OR_Gate.vhdl
    ghdl -a OR_tb.vhdl
    ghdl -e OR_tb
    ghdl -r OR_tb --vcd=result.vcd --stop-time=10us

clean:
    rm -rf result.vcd