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
        endereco: out std_logic_vector(3 downto 0);
        data_from_mem : in std_logic_vector(7 downto 0)
    );
end neander;

architecture behavior of neander is
    
    component memoria is
        port(
            endereco : std_logic_vector(3 downto 0);
            data : std_logic_vector(7 downto 0)
        );
    end component;
    
    signal pc : std_logic_vector(3 downto 0);
    signal acc : std_logic_vector (3 downto 0);
    signal zero : std_logic;
    signal neg : std_logic;
    signal data_dec : std_logic_vector(3 downto 0);
    signal mult : std_logic_vector(7 downto 0);
    
    begin
        data_dec <= data_from_mem(3 downto 0);
        memoria_inst: memoria
        
        port map(
                endereco => pc,
                data => data_from_mem
            );

        mult <= acc * data_dec;
        process(clk, rst,count_load,en_ula)
        begin
            if(rst = '1') then
            
                pc <= (others => '0');
                acc <= (others => '0');
                zero <= '0';
                neg <= '0';
            elsif(rising_edge(clk)) then
                dec <= data_from_mem(7 downto 4);

                if (en_ula = '1') then
                    case ula_sel is
                        when "01" => acc <= acc + data_dec;
                        when "10" => acc <= acc - data_dec;
                        when "11" => acc <= mult(3 downto 0);
                        when others => acc <= data_dec;  
                    end case;
                end if;
            
                if(count_load = '1') then
                    pc <= pc + 1;
                else
                    pc <= data_dec;
                end if;
            end if;
        end process;
end behavior;
    
                
