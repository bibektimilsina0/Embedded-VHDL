library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm_lcm_tb is
end fsm_lcm_tb;

architecture sim of fsm_lcm_tb is
    constant CLK_PERIOD : time := 10 ns;
    
    signal clk, reset : std_logic := '0';
    signal A, B : integer := 12;
    signal LCM_out : integer;

    component fsm_lcm is
        port(
            clk, reset: in std_logic;
            A, B: in integer;
            LCM: out integer
        );
    end component;

begin

    DUT : fsm_lcm
    port map (
        clk => clk,
        reset => reset,
        A => A,
        B => B,
        LCM => LCM_out
    );

    -- Clock process
    clk_process : process
    begin
        while now < 1000 ns loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process clk_process;

    -- Stimulus process
    stimulus : process
    begin
        reset <= '1';
        wait for CLK_PERIOD * 2;
        reset <= '0';

        -- Test Case 1: A = 12, B = 8
        A <= 12;
        B <= 8;
        wait for CLK_PERIOD * 10;
        
        -- Test Case 2: A = 15, B = 20
        A <= 15;
        B <= 20;
        wait for CLK_PERIOD * 10;
        
        -- Test Case 3: A = 30, B = 40
        A <= 30;
        B <= 40;
        wait for CLK_PERIOD * 10;
        
        wait;
    end process stimulus;

end sim;
