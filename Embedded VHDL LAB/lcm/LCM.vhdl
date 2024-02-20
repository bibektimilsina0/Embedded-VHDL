library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Use this library for integer arithmetic

entity LCM is
    Port (
        RESET : in  STD_LOGIC;
        CLK : in  STD_LOGIC;
        NUM1 : in  INTEGER;
        NUM2 : in  INTEGER;
        LCM_OUT : out  INTEGER
    );
end LCM;

architecture Behavioral of LCM is

    type state is (START, INPUT, CHECK, UPDATE_X, UPDATE_Y, OUTPUT);
    signal PS, NS: state;
    signal X, Y, GCD: INTEGER := 0; -- Initialize signals

begin

    seq_proc: process(CLK, RESET)
    begin
        if (RESET = '1') then 
            PS <= START;
        elsif (rising_edge(CLK)) then 
            PS <= NS;
        end if;
    end process seq_proc;

    comb_proc: process(CLK, NUM1, NUM2, PS) -- Add CLK to sensitivity list
    begin
        case PS is

            when START =>
                LCM_OUT <= 0;
                NS <= INPUT;

            when INPUT =>
                X <= NUM1;
                Y <= NUM2;
                NS <= CHECK;

            when CHECK =>
                if (X > Y) then
                    NS <= UPDATE_X;
                elsif (X < Y) then
                    NS <= UPDATE_Y;
                else
                    NS <= OUTPUT;
                end if;

            when UPDATE_X =>
                X <= X - Y;
                NS <= CHECK;

            when UPDATE_Y =>
                Y <= Y - X;
                NS <= CHECK;

            when OUTPUT =>
                GCD <= X;
                if GCD /= 0 then  -- Check if GCD is not zero to avoid division by zero error
                    LCM_OUT <= X * Y / GCD; -- Calculate LCM using GCD
                else
                    LCM_OUT <= 0; -- Default value if GCD is zero
                end if;
                NS <= INPUT;

            when OTHERS =>
                LCM_OUT <= 0;
                NS <= INPUT;

        end case;
    end process comb_proc;
end Behavioral;
