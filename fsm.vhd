library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm is
    port(
    decoder : in std_logic_vector(3 downto 0);
    clk : in std_logic;
    rst : in std_logic;
    count_load : out std_logic;
    ula_sel : out std_logic_vector(1 downto 0);
    en_ula : out std_logic
);
end fsm;

architecture behavior of fsm is

    begin
end behavior;