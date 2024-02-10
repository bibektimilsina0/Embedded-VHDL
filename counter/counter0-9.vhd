
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Counter is
    Port ( CLR : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end Counter;

architecture Behavioral of Counter is

signal tmp: std_logic_vector (3 downto 0);

begin

process(CLK,CLR)
begin

   if (CLK'event and CLK='0') then
	   if (CLR='1') then
		    tmp<="0000";
	   else
		  	 tmp<=tmp+1;
	
      end if;
	end if;
end process;	
Q<=tmp;
end Behavioral;


