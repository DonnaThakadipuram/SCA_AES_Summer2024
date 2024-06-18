Library IEEE;
use IEEE.std_logic_1164.all;

entity reg is
  generic(n: INTEGER := 8);
  port(
  D: in std_logic_vector(n-1 downto 0);
  Resetn, Clock, enable: in std_logic;
  Q: out std_logic_vector(n-1  downto 0));
end reg;

architecture behavior of reg is
  begin
    register_behavior: process(Resetn, Clock)
    begin
      if Resetn = '0' then
        Q <= (others => '0');
      elsif Clock'EVENT AND Clock = '1' AND enable = '1' then
        Q <= D;
      end if;
    end process;
end behavior;
