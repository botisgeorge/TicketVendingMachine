library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity convertor_binar_bcd is
	port(
	b: in std_logic_vector(7 downto 0);
	led1: out std_logic_vector(1 downto 0);
	led2: out std_logic_vector(3 downto 0);
	led3: out std_logic_vector(3 downto 0)
	);
end entity;	

architecture convertor of convertor_binar_bcd is
begin
	process(B)
	variable z: std_logic_vector (17 downto 0);
	begin
		z:="000000000000000000";
		
		z(10 downto 3):=B;
		for i in 0 to 4 loop
			if z(11 downto 8)>4 then
				z(11 downto 8):=z(11 downto 8)+3;
			end if;
			if z(15 downto 12)>4 then
				z(15 downto 12):=z(15 downto 12)+3;
			end if;
			z(17 downto 1):=z(16 downto 0);
		end loop;
		led1<=z(17 downto 16);
		led2<=z(15 downto 12);
		led3<=z(11 downto 8);
	end process;
end architecture;
	