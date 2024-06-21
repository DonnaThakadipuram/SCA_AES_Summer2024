
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

entity mix_col is
  port(
    clock, reset, start: in std_logic;
    done: out std_logic;

    data_in: in std_logic_vector(127 downto 0);
    data_out: out std_logic_vector(127 downto 0)
    );
  end mix_col;

architecture behavior of mix_col is

    type matrixtype is
    array (15 downto 0) of std_logic_vector(7 downto 0);

    type shifttype is
    array (15 downto 0) of std_logic_vector(8 downto 0);

    signal imatrix, matrix2, matrix3, omatrix: matrixtype;
    signal shifty2, shifty3, xortemp: shifttype;

    begin

      rst: process(reset)
      begin
      end process;

      mx_setup: process(start)
      begin
        if((start = '1') and clock = '1') then
          imatrix(0) <= data_in(7 downto 0);
          imatrix(1) <= data_in(15 downto 8);
          imatrix(2) <= data_in(23 downto 16);
          imatrix(3) <= data_in(31 downto 24);
          imatrix(4) <= data_in(39 downto 32);
          imatrix(5) <= data_in(47 downto 40);
          imatrix(6) <= data_in(55 downto 48);
          imatrix(7) <= data_in(63 downto 56);
          imatrix(8) <= data_in(71 downto 64);
          imatrix(9) <= data_in(79 downto 72);
          imatrix(10) <= data_in(87 downto 80);
          imatrix(11) <= data_in(95 downto 88);
          imatrix(12) <= data_in(103 downto 96);
          imatrix(13) <= data_in(111 downto 104);
          imatrix(14) <= data_in(119 downto 112);
          imatrix(15) <= data_in(127 downto 120);
        end if;
      end process;

      mult: process(imatrix, shifty2, shifty3, xortemp)
      begin

        --multiply these guys by 2 and 3 and make new matrices i can pull from
        shifty2(0) <= imatrix(0) & '0';
        if(shifty2(0)(8) = '1') then
          matrix2(0) <= shifty2(0)(7 downto 0) XOR "00011011";
        else
          matrix2(0) <= shifty2(0)(7 downto 0);
        end if;

        shifty2(1) <= imatrix(1) & '0';
        if(shifty2(1)(8) = '1') then
          matrix2(1) <= shifty2(1)(7 downto 0) XOR "00011011";
        else
          matrix2(1) <= shifty2(1)(7 downto 0);
        end if;

        shifty2(2) <= imatrix(2) & '0';
        if(shifty2(2)(8) = '1') then
          matrix2(2) <= shifty2(2)(7 downto 0) XOR "00011011";
        else
          matrix2(2) <= shifty2(2)(7 downto 0);
        end if;

        shifty2(3) <= imatrix(3) & '0';
        if(shifty2(3)(8) = '1') then
          matrix2(3) <= shifty2(3)(7 downto 0) XOR "00011011";
        else
          matrix2(3) <= shifty2(3)(7 downto 0);
        end if;

        shifty2(4) <= imatrix(4) & '0';
        if(shifty2(4)(8) = '1') then
          matrix2(4) <= shifty2(4)(7 downto 0) XOR "00011011";
        else
          matrix2(4) <= shifty2(4)(7 downto 0);
        end if;

        shifty2(5) <= imatrix(5) & '0';
        if(shifty2(5)(8) = '1') then
          matrix2(5) <= shifty2(5)(7 downto 0) XOR "00011011";
        else
          matrix2(5) <= shifty2(5)(7 downto 0);
        end if;

        shifty2(6) <= imatrix(6) & '0';
        if(shifty2(6)(8) = '1') then
          matrix2(6) <= shifty2(6)(7 downto 0) XOR "00011011";
        else
          matrix2(6) <= shifty2(6)(7 downto 0);
        end if;

        shifty2(7) <= imatrix(7) & '0';
        if(shifty2(7)(8) = '1') then
          matrix2(7) <= shifty2(7)(7 downto 0) XOR "00011011";
        else
          matrix2(7) <= shifty2(7)(7 downto 0);
        end if;

        shifty2(8) <= imatrix(8) & '0';
        if(shifty2(8)(8) = '1') then
          matrix2(8) <= shifty2(8)(7 downto 0) XOR "00011011";
        else
          matrix2(8) <= shifty2(8)(7 downto 0);
        end if;

        shifty2(9) <= imatrix(9) & '0';
        if(shifty2(9)(8) = '1') then
          matrix2(9) <= shifty2(9)(7 downto 0) XOR "00011011";
        else
          matrix2(9) <= shifty2(9)(7 downto 0);
        end if;

        shifty2(10) <= imatrix(10) & '0';
        if(shifty2(10)(8) = '1') then
          matrix2(10) <= shifty2(10)(7 downto 0) XOR "00011011";
        else
          matrix2(10) <= shifty2(10)(7 downto 0);
        end if;

        shifty2(11) <= imatrix(11) & '0';
        if(shifty2(11)(8) = '1') then
          matrix2(11) <= shifty2(11)(7 downto 0) XOR "00011011";
        else
          matrix2(11) <= shifty2(11)(7 downto 0);
        end if;

        shifty2(12) <= imatrix(12) & '0';
        if(shifty2(12)(8) = '1') then
          matrix2(12) <= shifty2(12)(7 downto 0) XOR "00011011";
        else
          matrix2(12) <= shifty2(12)(7 downto 0);
        end if;

        shifty2(13) <= imatrix(13) & '0';
        if(shifty2(13)(8) = '1') then
          matrix2(13) <= shifty2(13)(7 downto 0) XOR "00011011";
        else
          matrix2(13) <= shifty2(13)(7 downto 0);
        end if;

        shifty2(14) <= imatrix(14) & '0';
        if(shifty2(14)(8) = '1') then
          matrix2(14) <= shifty2(14)(7 downto 0) XOR "00011011";
        else
          matrix2(14) <= shifty2(14)(7 downto 0);
        end if;

        shifty2(15) <= imatrix(15) & '0';
        if(shifty2(15)(8) = '1') then
          matrix2(15) <= shifty2(15)(7 downto 0) XOR "00011011";
        else
          matrix2(15) <= shifty2(15)(7 downto 0);
        end if;

        --multiply these guys by 3
        shifty3(0) <= imatrix(0) & '0';
        xortemp(0) <= shifty3(0) xor '0' & imatrix(0);
        if(xortemp(0)(8) = '1') then
          matrix3(0) <= xortemp(0)(7 downto 0) xor "00011011";
        else
          matrix3(0) <= xortemp(0)(7 downto 0);
        end if;

        shifty3(1) <= imatrix(1) & '0';
        xortemp(1) <= shifty3(1) xor '0' & imatrix(0);
        if(xortemp(1)(8) = '1') then
          matrix3(1) <= xortemp(1)(7 downto 0) xor "00011011";
        else
          matrix3(1) <= xortemp(1)(7 downto 0);
        end if;

        shifty3(2) <= imatrix(2) & '0';
        xortemp(2) <= shifty3(2) xor '0' & imatrix(0);
        if(xortemp(2)(8) = '1') then
          matrix3(2) <= xortemp(2)(7 downto 0) xor "00011011";
        else
          matrix3(2) <= xortemp(2)(7 downto 0);
        end if;

        shifty3(3) <= imatrix(3) & '0';
        xortemp(3) <= shifty3(3) xor '0' & imatrix(0);
        if(xortemp(3)(8) = '1') then
          matrix3(3) <= xortemp(3)(7 downto 0) xor "00011011";
        else
          matrix3(3) <= xortemp(3)(7 downto 0);
        end if;

        shifty3(4) <= imatrix(4) & '0';
        xortemp(4) <= shifty3(4) xor '0' & imatrix(0);
        if(xortemp(4)(8) = '1') then
          matrix3(4) <= xortemp(4)(7 downto 0) xor "00011011";
        else
          matrix3(4) <= xortemp(4)(7 downto 0);
        end if;

        shifty3(5) <= imatrix(5) & '0';
        xortemp(5) <= shifty3(5) xor '0' & imatrix(0);
        if(xortemp(5)(8) = '1') then
          matrix3(5) <= xortemp(5)(7 downto 0) xor "00011011";
        else
          matrix3(5) <= xortemp(5)(7 downto 0);
        end if;

        shifty3(6) <= imatrix(6) & '0';
        xortemp(6) <= shifty3(6) xor '0' & imatrix(0);
        if(xortemp(6)(8) = '1') then
          matrix3(6) <= xortemp(6)(7 downto 0) xor "00011011";
        else
          matrix3(6) <= xortemp(6)(7 downto 0);
        end if;
      --end process;

        shifty3(7) <= imatrix(7) & '0';
        xortemp(7) <= shifty3(7) xor '0' & imatrix(0);
        if(xortemp(7)(8) = '1') then
          matrix3(7) <= xortemp(7)(7 downto 0) xor "00011011";
        else
          matrix3(7) <= xortemp(7)(7 downto 0);
        end if;
      --end process;

        shifty3(8) <= imatrix(8) & '0';
        xortemp(8) <= shifty3(8) xor '0' & imatrix(0);
        if(xortemp(8)(8) = '1') then
          matrix3(8) <= xortemp(8)(7 downto 0) xor "00011011";
        else
          matrix3(8) <= xortemp(8)(7 downto 0);
        end if;

        shifty3(9) <= imatrix(9) & '0';
        xortemp(9) <= shifty3(9) xor '0' & imatrix(0);
        if(xortemp(9)(8) = '1') then
          matrix3(9) <= xortemp(9)(7 downto 0) xor "00011011";
        else
          matrix3(9) <= xortemp(9)(7 downto 0);
        end if;

        shifty3(10) <= imatrix(10) & '0';
        xortemp(10) <= shifty3(10) xor '0' & imatrix(0);
        if(xortemp(10)(8) = '1') then
          matrix3(10) <= xortemp(10)(7 downto 0) xor "00011011";
        else
          matrix3(10) <= xortemp(10)(7 downto 0);
        end if;

        shifty3(11) <= imatrix(11) & '0';
        xortemp(11) <= shifty3(11) xor '0' & imatrix(0);
        if(xortemp(11)(8) = '1') then
          matrix3(11) <= xortemp(11)(7 downto 0) xor "00011011";
        else
          matrix3(11) <= xortemp(11)(7 downto 0);
        end if;

        shifty3(12) <= imatrix(12) & '0';
        xortemp(12) <= shifty3(12) xor '0' & imatrix(0);
        if(xortemp(12)(8) = '1') then
          matrix3(12) <= xortemp(12)(7 downto 0) xor "00011011";
        else
          matrix3(12) <= xortemp(12)(7 downto 0);
        end if;

        shifty3(13) <= imatrix(13) & '0';
        xortemp(13) <= shifty3(13) xor '0' & imatrix(0);
        if(xortemp(13)(8) = '1') then
          matrix3(13) <= xortemp(13)(7 downto 0) xor "00011011";
        else
          matrix3(13) <= xortemp(13)(7 downto 0);
        end if;

        shifty3(14) <= imatrix(14) & '0';
        xortemp(14) <= shifty3(14) xor '0' & imatrix(0);
        if(xortemp(14)(8) = '1') then
          matrix3(14) <= xortemp(14)(7 downto 0) xor "00011011";
        else
          matrix3(14) <= xortemp(14)(7 downto 0);
        end if;

        shifty3(15) <= imatrix(15) & '0';
        xortemp(15) <= shifty3(15) xor '0' & imatrix(0);
        if(xortemp(15)(8) = '1') then
          matrix3(15) <= xortemp(15)(7 downto 0) xor "00011011";
        else
          matrix3(15) <= xortemp(15)(7 downto 0);
        end if;
      end process;




      --this is where the galois field matrix comes in !!!!
      --     --       --
      --     | 2 3 1 1 |
      --     | 1 2 3 1 |
      --     | 1 1 2 3 |
      --     | 3 1 1 2 |
      --     --       --

      -- 2 3 1 1
      omatrix(0) <= matrix2(0) xor matrix3(1) xor imatrix(2) xor imatrix(3);
      omatrix(4) <= matrix2(4) xor matrix3(5) xor imatrix(6) xor imatrix(7);
      omatrix(8) <= matrix2(8) xor matrix3(9) xor imatrix(10) xor imatrix(11);
      omatrix(12) <= matrix2(12) xor matrix3(13) xor imatrix(14) xor imatrix(15);

      -- 1 2 3 1
      omatrix(1) <= imatrix(0) xor matrix2(1) xor matrix3(2) xor imatrix(3);
      omatrix(5) <= imatrix(4) xor matrix2(5) xor matrix3(6) xor imatrix(7);
      omatrix(9) <= imatrix(8) xor matrix2(9) xor matrix3(10) xor imatrix(11);
      omatrix(13) <= imatrix(12) xor matrix2(13) xor matrix3(14) xor imatrix(15);

      -- 1 1 2 3
      omatrix(2) <= imatrix(0) xor imatrix(1) xor matrix2(2) xor matrix3(3);
      omatrix(6) <= imatrix(4) xor imatrix(5) xor matrix2(6) xor matrix3(7);
      omatrix(10) <= imatrix(8) xor imatrix(9) xor matrix2(10) xor matrix3(11);
      omatrix(14) <= imatrix(12) xor imatrix(13) xor matrix2(14) xor matrix3(15);

      -- 3 1 1 2
      omatrix(3) <= matrix3(0) xor imatrix(1) xor imatrix(2) xor matrix2(3);
      omatrix(7) <= matrix3(4) xor imatrix(5) xor imatrix(6) xor matrix2(7);
      omatrix(11) <= matrix3(8) xor imatrix(9) xor imatrix(10) xor matrix2(11);
      omatrix(15) <= matrix3(12) xor imatrix(13) xor imatrix(14) xor matrix2(15);

      --time to output 128 bits

      out_process: process(omatrix)
      begin
        if(clock = '1') then
          for i in 15 downto 0 loop
            data_out(8 * i + 7 downto 8 * i) <= omatrix(15 - i);
          end loop;
          done <= '1';
        end if;
      end process;

end behavior;
