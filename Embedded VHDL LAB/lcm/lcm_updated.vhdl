library ieee;
use ieee.std_logic_1164.all;

entity fsm_lcm is
    port(
        clk, reset: in std_logic;
        A, B: in integer;
        LCM: out integer
    );
end fsm_lcm;

architecture behavior of fsm_lcm is
    type state is (start, input, output, check, update);
    signal current_state, next_state: state;
begin
    state_register: process (clk, reset)
    begin
        if reset = '1' then
            current_state <= start;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    compute: process(A, B, current_state)
        variable x, y: integer;
        variable temp_a, temp_b: integer;
    begin
        case current_state is
            when start =>
                next_state <= input;
            when input =>
                x := A;
                y := B;
                temp_a := A;
                temp_b := B;
                next_state <= check;
            when check =>
                if x = y then
                    next_state <= output;
                else
                    next_state <= update;
                end if;
            when update =>
                if x < y then
                    x := x + temp_a;
                else
                    y := y + temp_b;
                end if;
                next_state <= check;
            when output =>
                LCM <= x;
                next_state <= start;
            when others =>
                next_state <= start;
        end case;
    end process compute;
end behavior;
