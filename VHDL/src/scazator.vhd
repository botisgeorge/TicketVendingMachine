library ieee;
 use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;
 use ieee.std_logic_arith.all;

entity scazator is 
	port(termen1: in std_logic_vector(7 downto 0);
	termen2: in std_logic_vector(7 downto 0);
	diferenta: out std_logic_vector(7 downto 0));
end entity;	

architecture scadere of scazator is	
component complement is
	port(intrare: in std_logic_vector(7 downto 0);
	iesire: out std_logic_vector(7 downto 0));
end component; 

component comparator is
	port(termen1: in std_logic_vector(7 downto 0);
	termen2: in std_logic_vector(7 downto 0);
	primul: out std_logic;
	egalitate: out std_logic;
	aldoilea: out std_logic);
end component;

component sumator is
	port(termen1: in std_logic_vector(7 downto 0);
	termen2: in std_logic_vector(7 downto 0);
	suma: out std_logic_vector(7 downto 0));
end component;

signal primul: std_logic;
signal egalitate: std_logic;
signal aldoilea: std_logic;
signal t2C: std_logic_vector(7 downto 0);
signal t2C2: std_logic_vector(7 downto 0);
signal rez: std_logic_vector(7 downto 0);
signal unu: std_logic_vector(7 downto 0);
begin
	unu<="00000001";
	p0: comparator port map(termen1,termen2,primul,egalitate,aldoilea);
	p1: complement port map(termen2,t2C);
	p2: sumator port map(t2C,unu,t2C2);
	p3: sumator port map(t2C2,termen1,rez);
	process(aldoilea,rez)
	begin
		if(aldoilea='0') then
	diferenta<=rez;
		else
	diferenta<=termen1;
	end if;
	end process;
end architecture;	


