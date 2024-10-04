--Trabalho final de Circuitos Lógicos 

--Professor Gabriel P. Silva

--Questão 2 Parte 4: O TestBench do contador de 8 bits 

--Contador binário 8 bits UP/DOWN, com Reset assíncrono,
--função Hold e indicador de overflow/underflow, construído 
--a partir de 2 contadores 4 bit.

--Grupo: Igor Antunes, João David e Guilherme Roupe.

--Data 16/07/2022


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity contador_binarioV2_TB is
end entity contador_binarioV2_TB;

architecture TB of contador_binarioV2_TB is

    component contador_binarioV2 
        port (CLK, CLR, UP_DN, HOLD : in std_logic;
        Q : out std_logic_vector(7 downto 0);
        RCO : out std_logic);
    end component;

    signal CLK, CLR, UP_DN, HOLD, RCO : std_logic :='0';
    signal Q :  std_logic_vector(7 downto 0) := "00000000";

    begin

    DUT3 : contador_binarioV2 port map (CLK => CLK,
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
        wait for 20000 ns;
        CLR <= '1';
        wait for 20 ns;
        CLR <= '0';
    end process;

    inputHOLD : process
    begin
        wait for 35000 ns;
        HOLD <= '1';
        wait for 500 ns;
        HOLD <= '0';
    end process;

    inputUP_DN : process
    begin
        UP_DN <= '0';
        wait for 50000 ns;
        UP_DN <= '1';
        wait for 50000 ns;
    end process;

end architecture TB;