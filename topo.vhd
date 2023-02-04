library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

entity topo is
    port(
        clock: in std_logic;
        reset: in std_logic
    );
end topo;

architecture behavior of topo is
    
    signal negative :  std_logic;
    signal zero:  std_logic;
    signal enable_ula : std_logic;
    signal ula_sel: std_logic_vector(1 downto 0);
    signal decoder: std_logic_vector(3 downto 0);
    signal count_load: std_logic;

    component ndr is
        port(
            clock: in std_logic;
            reset: in std_logic;
            decoder: out std_logic_vector(3 downto 0);
            enable_ula: in std_logic;
            ula_sel : in std_logic_vector(1 downto 0);
            count_load : in std_logic;
            negative : out  std_logic;
            zero : out std_logic
        );
    end component;
    component fsm is
          port(
            decoder : in  std_logic_vector(3 downto 0);
            clock : in std_logic;
            reset : in std_logic;
            count_load : out std_logic;
            ula_sel : out std_logic_vector(1 downto 0);
            enable_ula : out std_logic;
            zero : in std_logic;
            negative : in std_logic
            );
    end component;
    
    begin
        fsm_inst: fsm
        port map(
                decoder => decoder,
                clock => clock,
                reset => reset,
                negative => negative,
                enable_ula => enable_ula,
                zero => zero,
                count_load => count_load,
                ula_sel => ula_sel
            );
        ndr_inst: ndr
        port map(
                decoder => decoder,
                clock => clock,
                reset => reset,
                negative => negative,
                enable_ula => enable_ula,
                zero => zero,
                count_load => count_load,
                ula_sel => ula_sel
        );
end behavior;
        