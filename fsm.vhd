library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm is
    port(
    decoder : in std_logic_vector(3 downto 0);
    clock : in std_logic;
    reset : in std_logic;
    count_load : out std_logic;
    ula_sel : out std_logic_vector(1 downto 0);
    enable_ula : out std_logic;
    zero : in std_logic;
    negative : in std_logic
);
end fsm;

architecture behavior of fsm is
    type state_name is (init, lda, add, sub, rst, mult,jump);
    signal state, next_state : state_name;

    begin
        process(reset, clock)
            begin
                if(reset = '1') then
                    state <= rst;
                elsif (rising_edge(clock)) then
                    state <= next_state;
                end if;
        end process;
        process(ula_sel, count_load, enable_ula)
        begin
            case state is
                when rst  =>
                    enable_ula <= '1';
                    count_load <= '0';
                    ula_sel <= "00";
                    next_state <= init;
                when init  => 
                    enable_ula <= '1';
                    count_load <= '0';
                    ula_sel <= "00";
                    case decoder is
                        when "0000" => next_state <= lda;
                        when "0001" => next_state <= add;
                        when "0010" => next_state <= sub;
                        when "0011" => next_state <= mult;
                        when others => next_state <= jump;
                    end case;
                when add =>
                    enable_ula <= '1';
                    count_load <= '1';
                    ula_sel <= "01";
                    case decoder is
                        when "0000" => next_state <= lda;
                        when "0001" => next_state <= add;
                        when "0010" => next_state <= sub;
                        when "0011" => next_state <= mult;
                        when others => next_state <= jump;
                    end case;
                when sub =>
                    enable_ula <= '1';
                    count_load <= '1';
                    ula_sel <= "10";
                    case decoder is
                        when "0000" => next_state <= lda;
                        when "0001" => next_state <= add;
                        when "0010" => next_state <= sub;
                        when "0011" => next_state <= mult;
                        when others => next_state <= jump;
                    end case;
                when mult =>
                    enable_ula <= '1';
                    count_load <= '1';
                    ula_sel <= "11";
                    case decoder is
                        when "0000" => next_state <= lda;
                        when "0001" => next_state <= add;
                        when "0010" => next_state <= sub;
                        when "0011" => next_state <= mult;
                        when others => next_state <= jump;
                    end case;
                when lda =>
                    enable_ula <= '1';
                    count_load <= '1';
                    ula_sel <= "00";
                    case decoder is
                        when "0000" => next_state <= lda;
                        when "0001" => next_state <= add;
                        when "0010" => next_state <= sub;
                        when "0011" => next_state <= mult;
                        when others => next_state <= jump;
                    end case;
                when jump =>
                    enable_ula <= '0';
                    count_load <= '0';
                    ula_sel <= "01";
                    case decoder is
                        when "0000" => next_state <= lda;
                        when "0001" => next_state <= add;
                        when "0010" => next_state <= sub;
                        when "0011" => next_state <= mult;
                        when others => next_state <= jump;
                    end case;
            end case;
        end process;
end behavior;