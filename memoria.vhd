library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

entity memoria is
    port(
        endereco : in std_logic_vector(3 downto 0);
        data : out std_logic_vector(7 downto 0);
    );
end memoria;

architecture behavior of memoria is
    type mem is array (0 to 31) of std_logic_vector(3 downto 0);
    constant mem : mem_t := (
    "0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111",
    "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111",
    "0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111",
    "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111");
begin
  data <= mem(to_integer(unsigned(addr)));
end behavior;