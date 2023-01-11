library IEEE;
use ieee.numeric_bit.ALL;


entity memoria is
    port(
        endereco : in bit_vector(3 downto 0);
        data : out bit_vector(7 downto 0)
    );
end memoria;

architecture behavior of memoria is
    type mem_t is array (0 to 15) of bit_vector(7 downto 0);
    constant mem : mem_t := (
    "00000000", "00000001", "00000010", "00000011", "00000100", "00000101", "00000110", "00000111",
    "00001000", "00001001", "00001010", "00001011", "00001100", "00001101", "00001110", "00001111",
    "00000000", "00000001", "00000010", "00000011", "00000100", "00000101", "00000110", "00000111"
    );
begin
  data <= mem(to_integer(unsigned(endereco)));
end behavior;