library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_bit.ALL;


entity memoria is
    port(
        endereco : in std_logic_vector(3 downto 0);
        data : out std_logic_vector(7 downto 0)
    );
end memoria;

architecture behavior of memoria is
    type mem_t is array (0 to 15) of std_logic_vector(7 downto 0);
    constant mem : mem_t := (
    "00000000", "00000001", "00000010", "00000011", "00000100", "00000101", "00000110", "00000111",
    "00001000", "00001001", "00001010", "00001011", "00001100", "00001101", "00001110", "00001111"
    );
begin
  data <= mem(to_integer(unsigned(endereco)));
end behavior;