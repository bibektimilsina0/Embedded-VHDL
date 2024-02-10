
library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity half_adder is
  port (A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        S    : out STD_LOGIC;
        COUT : out STD_LOGIC);
end entity;

architecture Behavioral of half_adder is
  component xor_gate
        port (
        X1: in  STD_LOGIC;
        X2: in  STD_LOGIC;
        result: out STD_LOGIC
        );
  end component;

  component and_gate
        port (
        X1: in  STD_LOGIC;
        X2: in  STD_LOGIC;
        result: out STD_LOGIC
        );
  end component;
begin
     c1:and_gate PORT MAP (X1=>A, X2=>B,result=>COUT);
     c2:xor_gate PORT MAP (X1=>A, X2=>B,result=>S);
end Behavioral;