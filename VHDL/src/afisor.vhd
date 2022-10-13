library ieee;
 use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;
 use ieee.std_logic_arith.all;
 
entity afisor is
	port(vector: in std_logic_vector(3 downto 0);
	a: out std_logic;
	b: out std_logic;
	c: out std_logic;
	d: out std_logic;
	e: out std_logic;
	f: out std_logic;
	g: out std_logic);
end entity;

architecture afisare of afisor is
begin
	process(vector)
	begin
	--0
	if vector="0000" then
		a<='1';
		b<='1';
		c<='1';
		d<='1';
		e<='1';
		f<='1';
		g<='0';
	end if;
	
	--1
	if vector="0001" then
		a<='0';
		b<='1';
		c<='1';
		d<='0';
		e<='0';
		f<='0';
		g<='0';
	end if;
	
	--2
	if vector="0010" then
		a<='1';
		b<='1';
		c<='0';
		d<='1';
		e<='1';
		f<='0';
		g<='1';
	end if;
	
	--3
	if vector="0011" then
		a<='1';
		b<='1';
		c<='1';
		d<='1';
		e<='0';
		f<='0';
		g<='1';
	end if;
	
	--4
	if vector="0100" then
		a<='0';
		b<='1';
		c<='1';
		d<='0';
		e<='0';
		f<='1';
		g<='1';
	end if;
	
	--5
	if vector="0101" then
		a<='1';
		b<='1';
		c<='1';
		d<='1';
		e<='1';
		f<='1';
		g<='0';
	end if;
	
	--6
	if vector="0110" then
		a<='1';
		b<='0';
		c<='1';
		d<='1';
		e<='1';
		f<='1';
		g<='1';
	end if;
	
	--7
	if vector="0111" then
		a<='1';
		b<='1';
		c<='1';
		d<='0';
		e<='0';
		f<='0';
		g<='0';
	end if;
	
	--8
	if vector="1000" then
		a<='1';
		b<='1';
		c<='1';
		d<='1';
		e<='1';
		f<='1';
		g<='1';
	end if;
	
	--9
	if vector="1001" then
		a<='1';
		b<='1';
		c<='1';
		d<='1';
		e<='0';
		f<='1';
		g<='1';	

	end if;
end process;
end architecture;