library IEEE;

use IEEE.STD_LOGIC_1164.ALL;


entity full_adder_tb is

end full_adder_tb;


architecture test of full_adder_tb is

    signal a, b, cin, sum, cout: std_logic;



    component full_adder

        port (

            a, b, cin : in std_logic;

            sum, cout : out std_logic

        );

    end component;



begin

    UUT: full_adder port map (a => a, b => b, cin => cin, sum => sum, cout => cout);



    stimulus: process

    begin


        a <= '0'; b <= '0'; cin <= '0'; wait for  10 ns;

        a <= '0'; b <= '0'; cin <= '1'; wait for  10 ns;

        a <= '0'; b <= '1'; cin <= '0'; wait for  10 ns;

        a <= '0'; b <= '1'; cin <= '1'; wait for  10 ns;

        a <= '1'; b <= '0'; cin <= '0'; wait for  10 ns;

        a <= '1'; b <= '0'; cin <= '1'; wait for  10 ns;

        a <= '1'; b <= '1'; cin <= '0'; wait for  10 ns;

        a <= '1'; b <= '1'; cin <= '1'; wait for  10 ns;

        

        wait; -- Wait indefinitely

    end process stimulus;

end test;