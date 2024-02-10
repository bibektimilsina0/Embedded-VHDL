library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity GCD_tb is
end GCD_tb;

architecture testbench of GCD_tb is

    constant CLK_PERIOD : time := 10 ns;  -- Clock period (10 ns)
    
    signal RESET, CLK, GO : std_logic;
    signal NUM1, NUM2, GCD_out : integer := 0;

begin

    -- Component instantiation
    DUT : entity work.GCD
        port map (
            RESET => RESET,
            CLK => CLK,
            GO => GO,
            NUM1 => NUM1,
            NUM2 => NUM2,
            GCD => GCD_out
        );

    -- Clock process
    CLK_process: process
    begin
        CLK <= '0';
        wait for CLK_PERIOD / 2;
        CLK <= '1';
        wait for CLK_PERIOD / 2;
    end process CLK_process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset sequence
        RESET <= '1';
        wait for CLK_PERIOD;
        RESET <= '0';
        
        -- Wait a few cycles
        wait for 10 * CLK_PERIOD;
        
        -- Test 1: Input 48, 18
        GO <= '1';
        NUM1 <= 48;
        NUM2 <= 18;
        wait for CLK_PERIOD * 10;  -- Wait for some cycles
        assert (GCD_out = 6) report "Test 1 failed" severity error;
        
        -- Test 2: Input 30, 75
        NUM1 <= 30;
        NUM2 <= 75;
        wait for CLK_PERIOD * 10;  -- Wait for some cycles
        assert (GCD_out = 15) report "Test 2 failed" severity error;
        
        -- Add more test cases here
        
        -- End of simulation
        GO <= '0';
        wait;
    end process stim_proc;

end testbench;
