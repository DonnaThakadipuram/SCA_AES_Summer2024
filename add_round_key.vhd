library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity add_round_key is
  port(
  clock, reset, start: in std_logic;
  data_in, key: in std_logic_vector(127 downto 0);
  data_out: out std_logic_vector(127 downto 0);
  done: out std_logic
  );
end add_round_key;

architecture behavior of add_round_key is
begin
  exclusive_or: process(start)
  begin
    if(rising_edge(start) and clock = '1') then
      data_out <= data_in xor key;
      done <= '1';
    end if;
  end process;
end behavior;
