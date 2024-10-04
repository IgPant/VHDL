--Trabalho final de Circuitos Lógicos 

--Professor Gabriel P. Silva

--Questão 2 Parte 3: O contador de 8 bits 

--Contador binário 8 bits UP/DOWN, com Reset assíncrono,
--função Hold e indicador de overflow/underflow, construído 
--a partir de 2 contadores 4 bit.

--Grupo: Igor Antunes, João David e Guilherme Roupe.

--Data 16/07/2022


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity contador_binarioV2 is
    port (CLK, CLR, UP_DN, HOLD : in std_logic;
    Q : out std_logic_vector(7 downto 0);
    RCO : out std_logic);
end entity contador_binarioV2;

architecture Behavior of contador_binarioV2 is

    component contador_binario 
        port (CLK, CLR, UP_DN, HOLD : in std_logic;
        Q : out std_logic_vector(3 downto 0);
        RCO : out std_logic);
    end component;

    signal RCO1, RCO2, CONNECT : std_logic :='0';
    signal QTEMP : std_logic_vector(7 downto 0) :="00000000"; 

    begin

    DUT1 : contador_binario port map (CLK => CLK,
    CLR => CLR, UP_DN => UP_DN, HOLD => HOLD,
    Q => QTEMP(3 downto 0), RCO => RCO1);
    
    DUT2 : contador_binario port map (CLK => RCO1,
    CLR => CLR, UP_DN => UP_DN, HOLD => HOLD,
    Q => QTEMP(7 downto 4), RCO => RCO2);  
    
        


    Q <= QTEMP;
    RCO <= RCO1 and RCO2;

end architecture Behavior ;