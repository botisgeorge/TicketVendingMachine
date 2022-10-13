library ieee;
 use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;
 use ieee.std_logic_arith.all;

entity complement is
	port(intrare: in std_logic_vector(7 downto 0);
	iesire: out std_logic_vector(7 downto 0));
end entity;

architecture logica_complement of complement is
begin
	process(intrare)
	variable test: std_logic_vector(7 downto 0);
	begin 
		test:=not intrare; 
		iesire<=test;
	end process;
end architecture;