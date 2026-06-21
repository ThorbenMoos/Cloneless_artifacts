library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff_ssr is
    port (  clk : in STD_LOGIC;
            sr : in STD_LOGIC;
            srinit : in STD_LOGIC;
            ce : in STD_LOGIC;
            d : in STD_LOGIC;
            q : out STD_LOGIC);
end dff_ssr;

architecture Behavioral of dff_ssr is
begin

	flipflop : process(clk)
	begin
		if rising_edge(clk) then
			if sr = '1' then
				q <= srinit;
			else
				if ce = '1' then
					q <= d;
				end if;
			end if;
		end if;
	end process;

end Behavioral;
