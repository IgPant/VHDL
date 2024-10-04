--Trabalho final de Circuitos Lógicos 

--Professor Gabriel P. Silva

--Questão 2 Parte 1: O dispositivo

--Contador binário 4 bits UP/DOWN, com Reset assíncrono,
--função Hold e indicador de overflow/underflow.

--Grupo: Igor Antunes, João David e Guilherme Roupe.

--Data 16/07/2022


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity contador_binario IS
    port (CLK, CLR, UP_DN, HOLD : in std_logic;
    Q : out std_logic_vector(3 downto 0);
    RCO : out std_logic);
end contador_binario;

architecture Behavior of contador_binario is

    signal COUNTER : unsigned(3 downto 0) :="0000";

    begin
    
    process(CLK, CLR)
    begin
        if (CLR = '1') then
            COUNTER <= "0000";
        else
            if(rising_edge(CLK)) then
                if (HOLD = '0')  then
                    if (UP_DN = '0') then
                        COUNTER <= COUNTER +1;
                        if (COUNTER = "1111") then
                            RCO <= '1';
                        end if;
                    else
                        COUNTER <= COUNTER -1;
                        if (COUNTER = "0000") then
                            RCO <= '1';
                        end if;
                    end if;
                end if;
            else
                if (CLK = '0') then
                    RCO <= '0';
                end if;
            end if;
        end if;
    end process;
    Q <= std_logic_vector(COUNTER);

end architecture Behavior;
