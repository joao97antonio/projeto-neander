library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_neander is
end tb_neander;

architecture behavior of tb_neander is
    component topo is
        port(
            clock: in std_logic;
            reset: in std_logic

    );
    end component;
    signal clock_sg : std_logic := '0';
    signal reset_sg : std_logic := '0';

    begin
        
        inst_topo : topo
            port map(
                clock => clock_sg,
                reset => reset_sg
            );
        clock_sg <= not clock_sg after 5 ns;          

        process
            begin
                wait for 1 ns;
                    reset_sg <= '1';
                wait for 1 ns;
                    reset_sg <= '0';
                wait;
        end process;
end behavior;
