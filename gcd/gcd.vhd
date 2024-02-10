
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;



ENTITY GCD IS
    PORT (
        RESET : IN STD_LOGIC;
        CLK : IN STD_LOGIC;
        GO : IN STD_LOGIC;
        NUM1 : IN INTEGER;
        NUM2 : IN INTEGER;
        GCD : OUT INTEGER);
END GCD;

ARCHITECTURE Behavioral OF GCD IS

    TYPE state IS (START, INPUT, CHECK, UPDATE_X, UPDATE_Y, OUTPUT);

    SIGNAL PS, NS : state;

BEGIN

    seq_proc : PROCESS (CLK, GO, RESET)
    BEGIN
        IF (GO = '1') THEN
            IF (RESET = '1') THEN
                PS <= START;
            ELSIF (rising_edge(CLK)) THEN
                PS <= NS;
            END IF;
        END IF;
    END PROCESS seq_proc;

    comb_proc : PROCESS (NUM1, NUM2, PS) VARIABLE X, Y : INTEGER;

    BEGIN

        CASE PS IS

            WHEN START =>
                GCD <= 0;
                NS <= INPUT;

            WHEN INPUT =>
                X := NUM1;
                Y := NUM2;
                NS <= CHECK;

            WHEN CHECK =>
                IF (X > Y) THEN
                    NS <= UPDATE_X;
                ELSIF (X < Y) THEN
                    NS <= UPDATE_Y;
                ELSE
                    NS <= OUTPUT;
                END IF;

            WHEN UPDATE_X =>
                X := X - Y;
                NS <= CHECK;

            WHEN UPDATE_Y =>
                Y := Y - X;
                NS <= CHECK;

            WHEN OUTPUT =>
                GCD <= X;
                NS <= INPUT;

            WHEN OTHERS =>
                GCD <= 0;
                NS <= INPUT;

        END CASE;
    END PROCESS comb_proc;
END Behavioral;