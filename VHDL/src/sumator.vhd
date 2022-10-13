library ieee;
use ieee.std_logic_1164.all;

entity sumator is 
	port(termen1: in std_logic_vector(7 downto 0);
	termen2: in std_logic_vector(7 downto 0);
	suma: out std_logic_vector(7 downto 0));
end entity;

architecture logica_sumator of sumator is
begin
	process(termen1,termen2)
	variable c: std_logic;
	begin
		suma(0)<= termen1(0) xor termen2(0);
		c := termen1(0) and termen2(0);
		suma(1)<= termen1(1) xor termen2(1) xor c;
		c := (termen1(1) and termen2(1)) or (termen1(1) and c) or (termen2(1) and c);
		suma(2)<= termen1(2) xor termen2(2) xor c;
		c := (termen1(2) and termen2(2)) or (termen1(2) and c) or (termen2(2) and c);
		suma(3)<= termen1(3) xor termen2(3) xor c;
		c := (termen1(3) and termen2(3)) or (termen1(3) and c) or (termen2(3) and c);
		suma(4)<= termen1(4) xor termen2(4) xor c;
		c := (termen1(4) and termen2(4)) or (termen1(4) and c) or (termen2(4) and c);
		suma(5)<= termen1(5) xor termen2(5) xor c;
		c := (termen1(5) and termen2(5)) or (termen1(5) and c) or (termen2(5) and c);
		suma(6)<= termen1(6) xor termen2(6) xor c;
		c := (termen1(6) and termen2(6)) or (termen1(6) and c) or (termen2(6) and c);
		suma(7)<= termen1(7) xor termen2(7) xor c;
		c := (termen1(7) and termen2(7)) or (termen1(7) and c) or (termen2(7) and c);
	end process;
end architecture;