library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity casa_de_bilete is
	port(distanta: in std_logic_vector (7 downto 0);
	nr_bilete: in std_logic_vector (3 downto 0);
	suma_platita: in std_logic_vector (7 downto 0);
	cancel: in std_logic;
	euro1: in std_logic_vector (7 downto 0);
	euro2: in std_logic_vector (7 downto 0);
	euro5: in std_logic_vector (7 downto 0);
	euro10: in std_logic_vector (7 downto 0);
	euro20: in std_logic_vector (7 downto 0);
	euro50: in std_logic_vector (7 downto 0);
	rest_neplatit: inout std_logic_vector (7 downto 0);
	ledpret1bcd: out std_logic_vector(1 downto 0);	
	ledpret2bcd: out std_logic_vector(3 downto 0);
	ledpret3bcd: out std_logic_vector(3 downto 0);
	ledsuma1bcd: out std_logic_vector(1 downto 0);
	ledsuma2bcd: out std_logic_vector(3 downto 0);
	ledsuma3bcd: out std_logic_vector(3 downto 0);
	ledrest1bcd: out std_logic_vector(1 downto 0);
	ledrest2bcd: out std_logic_vector(3 downto 0);
	ledrest3bcd: out std_logic_vector(3 downto 0);
	bilet_eliberat: out std_logic);
end entity;

architecture tranzactie of casa_de_bilete is
component calculator_rest is
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
end component; 

component convertor_binar_bcd is
	port(
	b: in std_logic_vector(7 downto 0);
	led1: out std_logic_vector(1 downto 0);
	led2: out std_logic_vector(3 downto 0);
	led3: out std_logic_vector(3 downto 0)
	);
end component; 

component scazator is 
	port(termen1: in std_logic_vector(7 downto 0);
	termen2: in std_logic_vector(7 downto 0);
	diferenta: out std_logic_vector(7 downto 0));
end component;

component eroare is
	port(cancel: in std_logic;
	nr_bilete: in std_logic_vector(3 downto 0);
	rest_neplatit: in std_logic_vector (7 downto 0);
	suma_platita: in std_logic_vector (7 downto 0);
	distanta: in std_logic_vector(7 downto 0);
	eroare: out std_logic);
end component;

signal ld: std_logic; 
signal ok: std_logic;  
signal clock: bit;
signal restC: std_logic_vector (7 downto 0);
signal eroareC: std_logic;
begin
	--se asuma ca 10km = 1 euro
	p1: calculator_rest port map(distanta,suma_platita,euro1,euro2,euro5,euro10,euro20,euro50,clock,ld,rest_neplatit,ok);
	p2: scazator port map(suma_platita,distanta,restC);
	process
	begin
		ld<='1','0' after 10 ns;
		wait;
	end process;
	process
	begin
		clock<='1';
		wait for 5 ns;
		clock<='0';	
		wait for 5 ns;
	end process;
	--Pentru a simplifica numarul de output-uri, nu s-a mai facut si trecerea de la bcd la 7seg (fiecare led ar fi avut cate 7 output-uri)
	--Componenta care face translatia insa exista si se numeste afisor.vhd
	p3: convertor_binar_bcd port map(distanta,ledpret1bcd,ledpret2bcd,ledpret3bcd);
	p4: convertor_binar_bcd port map(suma_platita,ledsuma1bcd,ledsuma2bcd,ledsuma3bcd);
	p5: convertor_binar_bcd port map(restC,ledrest1bcd,ledrest2bcd,ledrest3bcd);
	p6: eroare port map(cancel,nr_bilete,rest_neplatit,suma_platita,distanta,eroareC);
	process(ok,eroareC)
	begin
	if(ok='1' and eroareC='0') then
		bilet_eliberat<='1';
	else
		bilet_eliberat<='0';
	end if;	
	end process;
end architecture;