library ieee;
use ieee.std_logic_1164.all;

entity eroare is
	port(cancel: in std_logic;
	nr_bilete: in std_logic_vector(3 downto 0);
	rest_neplatit: in std_logic_vector (7 downto 0);
	suma_platita: in std_logic_vector (7 downto 0);
	distanta: in std_logic_vector(7 downto 0);
	eroare: out std_logic);
end entity;	

architecture logica_eroare of eroare is
begin
	process(cancel,nr_bilete,rest_neplatit)
	begin
		if(cancel ='1') then
			eroare<='1';	 
			end if;
		if(nr_bilete="0000") then
			eroare<='1';
			end if;
		if(rest_neplatit /= "00000000") then
			eroare<='1';
			end if;
		
		if(cancel ='0' and nr_bilete /= "0000" and rest_neplatit = "00000000" and suma_platita>=distanta) then
			eroare<='0'; 
		else
			eroare<='1';
			end if;
		end process;
end architecture;