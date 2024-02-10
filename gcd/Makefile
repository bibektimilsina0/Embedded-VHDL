all: result.vcd

result.vcd: gcd.vhd gcd_tb.vhd
    ghdl -a gcd.vhd
    ghdl -a gcd_tb.vhdl
    ghdl -e gcd
    ghdl -r gcd_tb --vcd=result.vcd --stop-time=10us

clean:
    rm -rf result.vcd