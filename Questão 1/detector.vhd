--Trabalho final de circuitos Lógicos 

--Professor Gabriel P. Silva

--Questão 1 Parte 1: O dispositivo

--Máquina de estado com arquitetura de Mooore capaz
--de detectar sequencias "1011" sobrepostas ou não, 
--com funçao Reset assíncrono.

--Grupo: Igor Antunes, João David e Guilherme Roupe.

--Data 16/07/2022


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity detector is
    port (X : in std_logic;
    CLK : in std_logic;
    RST : in std_logic;
    Z : out std_logic;
    STATE : out integer   --Adicionado para observaçao
    );
end detector;

architecture Behavior of detector is

    signal STATE_TEMP : integer:=1;

    begin
        
    process(CLK, RST)
    begin

    if(RST = '1') then
        STATE_TEMP <= 1;
    else
        if(rising_edge(CLK)) then
            case STATE_TEMP is
            
                when 1 =>
                    if(X = '1') then
                        STATE_TEMP <= 2;
                    else
                        STATE_TEMP <= 1;
                    end if;

                when 2 =>
                    if(X = '1') then
                        STATE_TEMP <= 2;
                    else
                        STATE_TEMP <= 3;
                    end if;

                when 3 =>
                    if(X = '1') then
                        STATE_TEMP <= 4;
                    else
                        STATE_TEMP <= 1;
                    end if;

                when 4 =>
                    if(X = '1') then
                        STATE_TEMP <= 5;
                    else
                        STATE_TEMP <= 3;
                    end if;                

                when 5 =>
                    if(X = '1') then
                        STATE_TEMP <= 2;
                    elsE
                        STATE_TEMP <= 3;
                    end if;
                
                when others =>
                    STATE_TEMP <= 1;
            end case;
        end if;
    end if;       
    end process;

    process(STATE_TEMP)
    begin
        case STATE_TEMP is
            when 5 =>
            z <= '1';
            when others =>
            z <= '0';
        end case;
    end process;

    STATE <= STATE_TEMP;  -- novamente, para observação

end architecture Behavior;