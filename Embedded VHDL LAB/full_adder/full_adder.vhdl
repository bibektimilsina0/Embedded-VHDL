library IEEE;

use IEEE.STD_LOGIC_1164.ALL;


entity full_adder is

    port (

        a, b, cin : in std_logic;

        sum, cout : out std_logic

    );

end full_adder;


architecture behavior of full_adder is

    component half_adder is

        port (

            a, b : in std_logic;

            sum, carry : out std_logic

        );

    end component;


    component or_gate is

        port (

            a, b : in std_logic;

            y : out std_logic

        );

    end component;



    signal s1, c1, c2 : std_logic; -- internal signals for intermediate results

begin

    w1: half_adder port map (a, b, s1, c1);

    w2: half_adder port map (s1, cin, sum, c2);

    w3: or_gate port map (c1, c2, cout);

end behavior;