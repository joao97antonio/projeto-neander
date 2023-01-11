library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

entity pc is
    port(
        entrada : in std_logic_vector(7 downto 0);
        saida : out std_logic_vector(7 downto 0);
        count_load in std_logic;
        clk : in std_logic;
        rst : in std_logic;
    );
end pc;

architecture behavior of pc is

    signal PC_FF : std_logic_vector(7 downto 0);

    begin
        if(rst = '1') then
            PC_FF <= (others => '0')
        
        elsif(rising_edge(clk)) then
        
