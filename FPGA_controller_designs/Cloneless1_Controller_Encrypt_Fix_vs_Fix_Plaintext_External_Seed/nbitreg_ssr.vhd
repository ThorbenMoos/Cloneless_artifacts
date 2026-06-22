library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nbitreg_ssr is
    generic (bit_width : integer range 1 to 256 := 16);
    port (  clk : in STD_LOGIC;
            sr : in STD_LOGIC;
            srinit : in STD_LOGIC_VECTOR(bit_width-1 downto 0);
            ce : in STD_LOGIC;
            din : in STD_LOGIC_VECTOR(bit_width-1 downto 0);
            dout : out STD_LOGIC_VECTOR(bit_width-1 downto 0));
end nbitreg_ssr;

architecture Behavioral of nbitreg_ssr is
	
	component dff_ssr is
		port (  clk : in STD_LOGIC;
                sr : in STD_LOGIC;
                srinit : in STD_LOGIC;
                ce : in STD_LOGIC;
                d : in STD_LOGIC;
                q : out STD_LOGIC);
	end component;

begin

	reg : for i in 1 to bit_width generate
		ff : dff_ssr
			port map (
				clk => clk,
				sr => sr,
				srinit => srinit(i-1),
				ce => ce,
				d => din(i-1),
				q => dout(i-1)
			);
	end generate;

end Behavioral;
