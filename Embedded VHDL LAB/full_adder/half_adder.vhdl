library IEEE;

use IEEE.STD_LOGIC_1164.ALL;


entity half_adder is

    port (

        a, b : in std_logic;

        sum, carry : out std_logic

    );

end half_adder;


architecture behavior of half_adder is

begin

    process(a, b)

    begin

        sum <= a xor b;

        carry <= a and b;

    end process;

end behavior;