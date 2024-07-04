library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sub_bytes is
  port(
    start, clock, reset: in std_logic;
    data_in: in std_logic_vector(127 downto 0);
    data_out: out std_logic_vector (127 downto 0)
    );
  end sub_bytes;

  architecture behavior of sub_bytes is

    signal holder: std_logic_vector(127 downto 0);

      component sbox is
      port(
        byte_input: in std_logic_vector(7 downto 0);
        output_byte: out std_logic_vector(7 downto 0)
      );
    end component;

    begin


      s0: sbox port map(byte_input => data_in(7 downto 0), output_byte => holder(7 downto 0));
      s1: sbox port map(byte_input => data_in(15 downto 8), output_byte => holder(15 downto 8));
      s2: sbox port map(byte_input => data_in(23 downto 16), output_byte => holder(23 downto 16));
      s3: sbox port map(byte_input => data_in(31 downto 24), output_byte => holder(31 downto 24));
      s4: sbox port map(byte_input => data_in(39 downto 32), output_byte => holder(39 downto 32));
      s5: sbox port map(byte_input => data_in(47 downto 40), output_byte => holder(47 downto 40));
      s6: sbox port map(byte_input => data_in(55 downto 48), output_byte => holder(55 downto 48));
      s7: sbox port map(byte_input => data_in(63 downto 56), output_byte => holder(63 downto 56));
      s8: sbox port map(byte_input => data_in(71 downto 64), output_byte => holder(71 downto 64));
      s9: sbox port map(byte_input => data_in(79 downto 72), output_byte => holder(79 downto 72));
      s10: sbox port map(byte_input => data_in(87 downto 80), output_byte => holder(87 downto 80));
      s11: sbox port map(byte_input => data_in(95 downto 88), output_byte => holder(95 downto 88));
      s12: sbox port map(byte_input => data_in(103 downto 96), output_byte => holder(103 downto 96));
      s13: sbox port map(byte_input => data_in(111 downto 104), output_byte => holder(111 downto 104));
      s14: sbox port map(byte_input => data_in(119 downto 112), output_byte => holder(119 downto 112));
      s15: sbox port map(byte_input => data_in(127 downto 120), output_byte => holder(127 downto 120));

      rst: process(reset)
      begin
        holder <= (others=>'0');
      end process;


      sbox_proc: process(start)
      begin
        data_out <= holder;

      end process;



    end behavior;
