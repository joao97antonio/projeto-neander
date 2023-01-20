library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

entity neander is
    port(
        ula_sel : in std_logic_vector(1 downto 0);
        clk : in std_logic;
        rst : in std_logic;
        count_load : in std_logic;
        dec : out std_logic_vector(3 downto 0);
        en_ula: in std_logic;
    );
end neander;

architecture behavior of pc is
    
    component memoria is
        port(
            endereco : std_logic_vector(3 downto 0);
            data : std_logic_vector(7 downto 0);
        );
    end component;
    
    signal pc : std_logic_vector(3 downto 0);
    signal acc : std_logic_vector (3 downto 0);
    signal zero : std_logic;
    signal neg : std_logic;
    signal data_from_mem : std_logic_vector(7 downto 0);
    signal data : std_logic_vector(3 downto 0);

    begin

        memoria_inst: memoria
            port map(
                endereco => pc;
                data => data_from_mem;
            );
        
            if(rst = '1') then
            pc <= (others => '0');
            acc <= (others => '0');
            zero <= (others => '0');
            neg <= (others => '0');
        elsif(rising_edge(clk)) then
        
