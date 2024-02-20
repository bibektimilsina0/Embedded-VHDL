
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : out  STD_LOGIC;
           C : out  STD_LOGIC);
end Half_Adder;

architecture DataFlow of Half_Adder is
begin
    -- Data flow implementation of AND and XOR
    S <= A xor B;
    C <= A and B;
end architecture DataFlow;
