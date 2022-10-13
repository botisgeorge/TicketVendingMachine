library ieee;
use ieee.std_logic_1164.all;

entity comparator is 
	port(termen1: in std_logic_vector(7 downto 0);
	termen2: in std_logic_vector(7 downto 0);
	primul: out std_logic;
	egalitate: out std_logic;
	aldoilea: out std_logic);
end entity;	 

architecture logica_comparator of comparator is
begin 	  
	process(termen1,termen2) 
	begin 
		if termen1>termen2 then
			primul<='1'; egalitate<='0'; aldoilea<='0';
			end if;
		if termen1<termen2 then
			aldoilea<='1'; egalitate<='0'; primul<='0';
			end if;
		if termen1=termen2 then
			egalitate<='1'; primul<='0'; aldoilea<='0';	   
			end if;
	end process;
end architecture;		 

