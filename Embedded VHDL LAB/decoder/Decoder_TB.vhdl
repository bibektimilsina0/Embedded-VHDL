library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_TB is
end Decoder_TB;

architecture Behavioral of Decoder_TB is
    -- Import the Decoder entity
    COMPONENT Decoder
        Port (
            A : in STD_LOGIC_VECTOR (1 downto 0);
            Y : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Signals
    signal A : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
    signal Y : STD_LOGIC_VECTOR (3 downto 0);

begin
    -- Instantiate the Decoder
    uut: Decoder port map (
          A => A,
          Y => Y
    );

    -- Stimulus process
    stim_proc: process
    begin		
        -- Hold reset state for 100 ns.
        wait for 100 ns;

        -- Insert stimulus here 
        A <= "00";
        wait for 100 ns;
        A <= "01";
        wait for 100 ns;
        A <= "10";
        wait for 100 ns;
        A <= "11";

        wait;
    end process;

end Behavioral;
