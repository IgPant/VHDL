--Trabalho final de Circuitos Lógicos 

--Professor Gabriel P. Silva

--Questão 1 Parte 2: O TestBench

--Máquina de estado com arquitetura de Mooore capaz
--de detectar sequencias "1011" sobrepostas ou não, 
--com funçao RST assíncrono.

--Grupo: Igor Antunes, João David e Guilherme Roupe.

--Data 16/07/2022


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity detector_tb is
end entity detector_tb;

architecture TB of detector_tb is
    
    component detector
        port (X : in std_logic;
        CLK : in std_logic;
        RST : in std_logic;
        Z : out std_logic;
        STATE : out integer   --Adicionado para observaçao
        );
    end component;

    signal X, CLK, RST, Z: std_logic :='0';
    signal STATE : integer := 1;

    begin
    
    DUT : detector port map (X => X, CLK => CLK,
        RST => RST, Z => Z, STATE => STATE);
    
    clock : process
    begin
        CLK <= '1';
        wait for 10 ns;
        CLK <= '0';
        wait for 10 ns;
    end process;

    inputRST : process
    begin
        RST <= '0';
        wait for 280 ns;
        RST <= '1';
        wait for 20 ns;
    end process;

    input_X : process
    begin
        wait for 100 ns;    
        X <= '1';
        wait for 20 ns;
        X <= '1';
        wait for 20 ns;
        X <= '1';
        wait for 20 ns;
        X <= '0';
        wait for 20 ns;
        X <= '0';
        wait for 20 ns;
        X <= '0';
        wait for 20 ns;
        X <= '1';
        wait for 20 ns;
        X <= '0';
        wait for 20 ns;
        X <= '1';
        wait for 20 ns;
        X <= '1';
        wait for 20 ns;
        X <= '1';
        wait for 20 ns;
        X <= '0';
        wait for 20 ns;
        X <= '1';
        wait for 20 ns;
        X <= '1';
        wait for 20 ns;
        X <= '0';
        wait for 20 ns;
        X <= '1';
        wait for 20 ns;
        X <= '1';
        wait for 20 ns;
        X <= '0';
        wait for 20 ns;
        X <= '1';
        wait for 20 ns;
        X <= '0';
        wait for 20 ns;
        X <= '1';
        wait for 20 ns;
        X <= '1';
        wait for 20 ns;
    end process;
    
end architecture TB;