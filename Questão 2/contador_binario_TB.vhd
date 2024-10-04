--Trabalho final de Circuitos Lógicos 

--Professor Gabriel P. Silva

--Questão 2 Parte 2: O TestBench

--Contador binário 4 bits UP/DOWN, com Reset assíncrono,
--função Hold e indicador de overflow/underflow.

--Grupo: Igor Antunes, João David e Guilherme Roupe.

--Data 16/07/2022


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity contador_binario_TB is
end entity contador_binario_TB;

architecture TB of contador_binario_TB is

    signal CLK, CLR, UP_DN, HOLD, RCO : std_logic :='0';
    signal Q : std_logic_vector(3 downto 0) :="0000";

    component contador_binario
        port (CLK, CLR, UP_DN, HOLD : in std_logic;
        Q : out std_logic_vector(3 downto 0);
        RCO : out std_logic);
    end component;

    begin

    DUT : contador_binario port map (CLK => CLK,
        CLR => CLR, UP_DN => UP_DN, HOLD => HOLD,
        Q => Q, RCO => RCO);

    clock : process
    begin
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
    end process;

    inputCLR : process
    begin
        wait for 500 ns;
        CLR <= '1';
        wait for 20 ns;
        CLR <= '0';
    end process;

    inputHOLD : process
    begin
        wait for 1000 ns;
        HOLD <= '1';
        wait for 200 ns;
        HOLD <= '0';
    end process;

    inputUP_DN : process
    begin
        UP_DN <= '0';
        wait for 1500 ns;
        UP_DN <= '1';
        wait for 1500 ns;
    end process;

end architecture TB;