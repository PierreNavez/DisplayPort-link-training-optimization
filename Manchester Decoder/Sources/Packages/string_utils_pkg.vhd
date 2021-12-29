-----------------------------------------------------------------------------------------
-- Filename:    string_utils_pkg.vhd
-- Project:     658-CHIEM
--
-- Copyright (c) 2014 Deltatec (www.deltatec.be)
--
-- This file is provided without any express or implied warranties, including,
-- but not limited to, the implied warranties of merchantability and fitness
-- for a particular purpose. It is not intended for use in life support
-- appliances, devices, or systems. Use in such applications is expressly
-- prohibited.--
--
-- Engineers:   Koen Vanhoof    (KV)
--
-- History:     01/07/2016      (KV)  : Creation of this file
--
-- Description:
--    This package contains a bunch of functions which makes it easier to work with
--    strings
--
-- Notes:
--
--
------------------------------------------------------------------------------------------------------
-- LIBRARY --
-------------
library IEEE;
   use IEEE.std_logic_1164.all;
   use IEEE.numeric_std.all;


------------
-- ENTITY --
------------
package string_utils_pkg is
   function "&"(left : integer;right : string) return string;
   function "&"(left : string;right : integer) return string;
   function "&"(left : real;right : string) return string;
   function "&"(left : string;right : real) return string;
   function ToString(vec: std_logic_vector) return string ;
   function ToString(vec: signed) return string ;
   function ToString(vec: unsigned) return string ;
   function ToString(vec: integer) return string ;
   function ToString(vec: boolean) return string ;

   function hex(slv:unsigned) return string ;
   function hex(slv: signed) return string ;
   function hex(slv: std_logic_vector) return string ;
   function hex(inp:integer) return string ;

   function ToString(int: integer; base: integer) return string ;
   
   procedure InfoMessage(msg : string)  ;
   procedure HeaderMessage(Msg : string)  ;



end package;

package body string_utils_pkg is
   function "&"(left : string;right : integer) return string is
   begin
      return left & integer'image(right);
   end function;

   function "&"(left : integer;right : string) return string is
   begin
      return integer'image(left) & right;
   end function;

   function "&"(left : string;right : real) return string is
   begin
      return left & real'image(right);
   end function;

   function "&"(left : real;right : string) return string is
   begin
      return real'image(left) & right;
   end function;

   function ToString(vec: std_logic_vector) return string is
   variable result: string(vec'left + 1 downto 1);
   begin
     for i in vec'reverse_range loop
       if (vec(i) = '1') then
         result(i + 1) := '1';
       elsif (vec(i) = '0') then
         result(i + 1) := '0';
       elsif (vec(i) = 'Z') then
         result(i + 1) := 'Z';
       elsif (vec(i) = 'H') then
         result(i + 1) := 'H';
       elsif (vec(i) = 'L') then
         result(i + 1) := 'L';
       elsif (vec(i) = 'U') then
         result(i + 1) := 'U';
       else
         result(i + 1) := 'X';
       end if;
     end loop;
   return result;

   end function;

   function ToString(vec: signed) return string is
   begin
     return ToString(std_logic_vector(vec));
   end function;

   function ToString(vec: unsigned) return string is
   begin
     return ToString(std_logic_vector(vec));
   end function;

   function ToString(vec: integer) return string is
   begin
     return integer'image(vec);
   end function;

   function ToString(vec: boolean) return string is
   begin
     return boolean'image(vec);
   end function;

   -- converts an integer into a character
   -- for 0 to 9 the obvious mapping is used, higher
   -- values are mapped to the characters A-Z
   -- (this is usefull for systems with base > 10)
   -- (adapted from Steve Vogwell's posting in comp.lang.vhdl)
   function chr(int: integer) return character is
      variable c: character;
   begin
      case int is
         when  0 => c := '0';
         when  1 => c := '1';
         when  2 => c := '2';
         when  3 => c := '3';
         when  4 => c := '4';
         when  5 => c := '5';
         when  6 => c := '6';
         when  7 => c := '7';
         when  8 => c := '8';
         when  9 => c := '9';
         when 10 => c := 'A';
         when 11 => c := 'B';
         when 12 => c := 'C';
         when 13 => c := 'D';
         when 14 => c := 'E';
         when 15 => c := 'F';
         when 16 => c := 'G';
         when 17 => c := 'H';
         when 18 => c := 'I';
         when 19 => c := 'J';
         when 20 => c := 'K';
         when 21 => c := 'L';
         when 22 => c := 'M';
         when 23 => c := 'N';
         when 24 => c := 'O';
         when 25 => c := 'P';
         when 26 => c := 'Q';
         when 27 => c := 'R';
         when 28 => c := 'S';
         when 29 => c := 'T';
         when 30 => c := 'U';
         when 31 => c := 'V';
         when 32 => c := 'W';
         when 33 => c := 'X';
         when 34 => c := 'Y';
         when 35 => c := 'Z';
         when others => c := '?';
      end case;
      return c;
   end chr;



   function ToString(int: integer; base: integer) return string is
      variable temp:      string(1 to 10);
      variable num:       integer;
      variable abs_int:   integer;
      variable len:       integer := 1;
      variable power:     integer := 1;
   begin
      -- bug fix for negative numbers
      abs_int := abs(int);
      num     := abs_int;

      while num >= base loop                     -- Determine how many
         len := len + 1;                          -- characters required
         num := num / base;                       -- to represent the
      end loop ;                                 -- number.

      for i in len downto 1 loop                 -- Convert the number to
         temp(i) := chr(abs_int/power mod base);  -- a string starting
         power := power * base;                   -- with the right hand
      end loop ;                                 -- side.

      -- return result and add sign if required
      if int < 0 then
         return '-'& temp(1 to len);
      else
         return temp(1 to len);
      end if;
   end function;

   -- converts a std_logic_vector into a hex string.
   function hex(slv: std_logic_vector) return string is
      variable hexlen: integer;
      variable longslv : std_logic_vector(67 downto 0) := (others => '0');
      variable hexstring : string(1 to 16);
      variable fourbit : std_logic_vector(3 downto 0);
   begin
      assert slv'length <= 68 report "string_utils_pkg.vhd : hexstring : this function can only take vectors with a size up to 68. The size of the input vector is "& integer'image(slv'length) severity error;
      hexlen := (slv'length)/4;
      if (slv'length) mod 4 /= 0 then
        hexlen := hexlen + 1;
      end if;
      longslv(slv'length-1 downto 0) := slv;
      for i in (hexlen -1) downto 0 loop
         fourbit := longslv(((i*4)+3) downto (i*4));
         case fourbit is
            when "0000" => hexstring(hexlen -I) := '0';
            when "0001" => hexstring(hexlen -I) := '1';
            when "0010" => hexstring(hexlen -I) := '2';
            when "0011" => hexstring(hexlen -I) := '3';
            when "0100" => hexstring(hexlen -I) := '4';
            when "0101" => hexstring(hexlen -I) := '5';
            when "0110" => hexstring(hexlen -I) := '6';
            when "0111" => hexstring(hexlen -I) := '7';
            when "1000" => hexstring(hexlen -I) := '8';
            when "1001" => hexstring(hexlen -I) := '9';
            when "1010" => hexstring(hexlen -I) := 'A';
            when "1011" => hexstring(hexlen -I) := 'B';
            when "1100" => hexstring(hexlen -I) := 'C';
            when "1101" => hexstring(hexlen -I) := 'D';
            when "1110" => hexstring(hexlen -I) := 'E';
            when "1111" => hexstring(hexlen -I) := 'F';
            when "ZZZZ" => hexstring(hexlen -I) := 'z';
            when "UUUU" => hexstring(hexlen -I) := 'u';
            when "XXXX" => hexstring(hexlen -I) := 'x';
            when others => hexstring(hexlen -I) := '?';
         end case;
      end loop;
      return hexstring(1 to hexlen);
   end function;

   function hex(slv: signed) return string is
   begin
      return hex(std_logic_vector(slv));
   end function;

   function hex(slv:unsigned) return string is
   begin
      return hex(std_logic_vector(slv));
   end function;

   function hex(inp:integer) return string is
   begin
      return ToString(inp, 16) ;
   end function;

   procedure InfoMessage(Msg : string)  is
   variable Msg_v : string(1 to Msg'length+11) := "   INFO : "&Msg&CR;
   begin
       std.textio.write(std.textio.output,Msg_v);
   end procedure;
   
   procedure HeaderMessage(Msg : string)  is
   variable Msg_v : string(1 to Msg'length+8) :=  "*** "&Msg&" ***";
   variable Hdr_v : string(Msg_v'range) := (others => '*');
   variable Final_v : string(1 to 2*Hdr_v'length+Msg_v'length+3) := Hdr_v&CR&Msg_v&CR&Hdr_v&CR;
   begin
      std.textio.write(std.textio.output,Final_v);
   end procedure;
   
end package body;
