library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity calculator_rest is
	port(pret: in std_logic_vector (7 downto 0);
	suma_platita: in std_logic_vector (7 downto 0);
	euro1: in std_logic_vector (7 downto 0);
	euro2: in std_logic_vector (7 downto 0);
	euro5: in std_logic_vector (7 downto 0);
	euro10: in std_logic_vector (7 downto 0);
	euro20: in std_logic_vector (7 downto 0);
	euro50: in std_logic_vector (7 downto 0);
	clk: in bit;
	ld: in std_logic;
	rest: out std_logic_vector (7 downto 0);
	ok: out std_logic);
end entity;

architecture rest of calculator_rest is 
component scazator is
	port(termen1: in std_logic_vector(7 downto 0);
	termen2: in std_logic_vector(7 downto 0);
	diferenta: out std_logic_vector(7 downto 0));
end component;
signal descazut: std_logic_vector(7 downto 0);
begin 
	p1: scazator port map(suma_platita,pret,descazut);
	process(clk,descazut,ld,euro1,euro2,euro5,euro10,euro20,euro50)
	variable z: std_logic_vector (7 downto 0);
	variable euro1c: std_logic_vector (7 downto 0);
	variable euro2c: std_logic_vector (7 downto 0); 
	variable euro5c: std_logic_vector (7 downto 0); 
	variable euro10c: std_logic_vector (7 downto 0); 
	variable euro20c: std_logic_vector (7 downto 0); 
	variable euro50c: std_logic_vector (7 downto 0);
	variable ordine: integer;
	begin
		if(ld='1') then	
			z:=descazut;
			euro1c:=euro1;
			euro2c:=euro2;
			euro5c:=euro5;
			euro10c:=euro10;
			euro20c:=euro20;
			euro50c:=euro50;
			ordine:=0;
			rest<=z;   
		else
			if(clk'event and clk='1') then
				if(z>=1 and euro1c>0) then
					ordine:=1;
				end if;
				if(z>=2 and euro2c>0) then
					ordine:=2;
				end if;
				if(z>=5 and euro5c>0) then
					ordine:=3;
				end if;
				if(z>=10 and euro10c>0) then
					ordine:=4;
				end if;
				if(z>=20 and euro20c>0) then
					ordine:=5;
				end if;
				if(z>=50 and euro50c>0) then
					ordine:=6;
				end if;
				
				if(z>=50 and euro50c>0 and ordine=6) then
					z:=z-50;
					euro50c:=euro50c-1;
					rest<=z;

				end if;
				if(z>=20 and euro20c>0 and ordine=5) then
					z:=z-20;
					euro20c:=euro20c-1;
					rest<=z;
				
				end if;
				if(z>=10 and euro10c>0 and ordine=4) then
					z:=z-10;
					euro10c:=euro10c-1;
					rest<=z;
				
				end if;
				if(z>=5 and euro5c>0 and ordine=3) then
					z:=z-5;
					euro5c:=euro5c-1;
					rest<=z;
				
				end if;
				if(z>=2 and euro2c>0 and ordine=2) then
					z:=z-2;
					euro2c:=euro2c-1;
					rest<=z;
				
				end if;
				if(z>=1 and euro1c>0 and ordine=1) then
					z:=z-1;
					euro1c:=euro1c-1;
					rest<=z;
				
				end if;
			end if;
		end if;
		if(z=0) then
			ok<='1';
		else
			ok<='0';
		end if;
	end process;
end architecture;