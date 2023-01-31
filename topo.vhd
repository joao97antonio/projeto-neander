library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

entity topo is
    port(
        clk: in std_logic;
        rst: in std_logic
    );
end topo;

architecture behavior of topo is
    component memoria is
        port(
            endereco : std_logic_vector(3 downto 0);
            data : std_logic_vector(7 downto 0)
        );
    end component;
    component neander is
          port(
                ula_sel :  std_logic_vector(1 downto 0);
                clk :  std_logic;
                rst :  std_logic;
                count_load :  std_logic;
                dec :  std_logic_vector(3 downto 0);
                en_ula :  std_logic;
                endereco :  std_logic_vector(3 downto 0);
                data_from_mem :  std_logic_vector(7 downto 0)
            );
    end component;
    
    begin
        memoria_inst: memoria
        
        port map(
                endereco => pc,
                data => data_from_mem
            );

        