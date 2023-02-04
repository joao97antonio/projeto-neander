library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;
 
entity ndr is
    port(
        clock: in std_logic;
        reset: in std_logic;
        decoder: out std_logic_vector(3 downto 0);
        enable_ula: in std_logic;
        ula_sel : in std_logic_vector(1 downto 0);
        count_load :in std_logic;
        negative : out std_logic;
        zero : out std_logic
    );
end ndr;

architecture behavior of ndr is

    type memoria is array (integer range 0 to 15) of std_logic_vector(7 downto 0);
    signal mem : memoria;
    signal endereco : std_logic_vector(3 downto 0);
    signal rdm : std_logic_vector(7 downto 0);
    signal acc: std_logic_vector(3 downto 0);
    signal mult : std_logic_vector(7 downto 0);
    signal add : std_logic_vector(3 downto 0);
    signal sub : std_logic_vector(3 downto 0);

    begin
        
        mult <= acc * (rdm(7 downto 4));
        add  <= acc + (rdm(7 downto 4));
        sub  <= acc - (rdm(7 downto 4));
        decoder  <= rdm (7 downto 4);
    

        mem (0) <= "00000001";
        mem (1) <= "00010100";
        mem (2) <= "00100010";
        mem (3) <= "00000000";
        mem (4) <= "00000000";
        mem (5) <= "00000000";
        mem (6) <= "00000000";
        mem (7) <= "00000000";
        mem (8) <= "00000000";
        mem (9) <= "00000000";
        mem (10) <= "00000000";
        mem (11) <= "00000000";
        mem (12) <= "00000000";
        mem (13) <= "00000000";
        mem (14) <= "00000000";
        mem (15) <= "00000000";
        
        rdm <= mem(conv_integer(endereco));

        process(clock, reset)
            begin
                if (reset = '1') then
                    endereco <= (others => '0');
                    rdm <= (others => '0');
                    acc <= (others => '0');
                    negative <= '0';
                elsif rising_edge(clock) then
                    if(enable_ula = '1') then
                        if (count_load = '1') then
                        endereco <= endereco + '1';
                        else
                            endereco <= rdm(3 downto 0);
                        end if;
                        case ula_sel is
                            when "01" => acc <= add;
                            when "10" => acc <= sub;
                            when "11" => acc <= mult(3 downto 0);
                            when others => acc <= rdm(3 downto 0); 
                        end case;
                        if (nor(sub)) then 
                            zero <= '1';
                        end if;
                        negative <= sub(3);
                    end if;
                end if;
            end process;
end behavior;
    
        
            
