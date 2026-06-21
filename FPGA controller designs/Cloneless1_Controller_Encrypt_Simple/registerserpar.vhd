library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library unisim;
use unisim.vcomponents.all;

entity registerserpar is
	generic (  size_ser : positive := 1;
                size_par : positive := 8);
	port ( clk : in  STD_LOGIC;
		   rst : in  STD_LOGIC;
           en : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           ds : in  STD_LOGIC_VECTOR((size_ser - 1) downto 0);
           dp : in  STD_LOGIC_VECTOR((size_par - 1) downto 0);
           qs : out STD_LOGIC_VECTOR((size_ser - 1) downto 0);
           qp : out STD_LOGIC_VECTOR((size_par - 1) downto 0));
end registerserpar;

architecture Behavioral of registerserpar is

    signal dp_intern, qp_intern : STD_LOGIC_VECTOR ((size_par - 1) downto 0);

begin

	dp_intern <= qp_intern ((size_par - size_ser - 1) downto 0) & ds when (sel = '0') else dp;

	gen :
	for i in 0 to (size_par - 1) generate
		ff : fdre
		port map (
			c => clk,
			r => rst,
			ce => en,
			d => dp_intern(i),
			q => qp_intern(i)
		);
	end generate;

	qs <= qp_intern((size_par - 1) downto (size_par - size_ser));
	qp <= qp_intern;
	
end Behavioral;
