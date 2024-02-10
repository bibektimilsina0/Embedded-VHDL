library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Counter_TB is
end Counter_TB;

architecture Behavioral of Counter_TB is

    constant CLK_PERIOD : time := 10 ns; -- Define clock period
    signal CLK, CLR : std_logic := '0'; -- Define signals for clock and clear
    signal Q : std_logic_vector(3 downto 0); -- Define signal for output Q

begin

    -- Instantiate the Counter entity
    DUT: entity work.Counter
        port map (
            CLR => CLR,
            CLK => CLK,
            Q => Q
        );

    -- Clock process
    CLK_process: process
    begin
        while now < 1000 ns loop -- Run for 1000 ns
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait; -- Wait indefinitely after the simulation is done
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        -- Apply reset
        CLR <= '1';
        wait for 20 ns;
        CLR <= '0';
        wait for 10 ns;

        -- Insert any additional stimulus here if needed

        wait; -- Wait indefinitely after the simulation is done
    end process;

end Behavioral;
