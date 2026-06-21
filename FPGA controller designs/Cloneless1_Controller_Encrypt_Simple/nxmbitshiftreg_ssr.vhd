library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nxmBitShiftReg is
	generic (  n : integer range 2 to 256 := 4;
		       m : integer range 1 to 256 := 2);
	port (  clk : in STD_LOGIC;
            sr : in STD_LOGIC;
            srinit : in STD_LOGIC_VECTOR(n*m-1 downto 0);
            ce : in STD_LOGIC;
            opmode : in STD_LOGIC_VECTOR(1 downto 0);
            din : in STD_LOGIC_VECTOR(m-1 downto 0);
            dout : out STD_LOGIC_VECTOR(m-1 downto 0);
            dout_f : out STD_LOGIC_VECTOR(n*m-1 downto 0));
end nxmBitShiftReg;

architecture Behavioral of nxmBitShiftReg is

	component nBitReg_SSR is
		generic (bit_width : integer range 1 to 256 := 16);
		port (  clk : in STD_LOGIC;
                sr : in STD_LOGIC;
                srinit : in STD_LOGIC_VECTOR(bit_width-1 downto 0);
                ce : in STD_LOGIC;
                din : in STD_LOGIC_VECTOR(bit_width-1 downto 0);
                dout : out STD_LOGIC_VECTOR(bit_width-1 downto 0));
	end component nBitReg_SSR;
	
	signal opmode_intern : STD_LOGIC_VECTOR(1 downto 0);
    alias rotate : STD_LOGIC is opmode_intern(1);
    alias toleft : STD_LOGIC is opmode_intern(0);
	signal din_intern : STD_LOGIC_VECTOR(n*m-1 downto 0);
	signal dout_intern : STD_LOGIC_VECTOR(n*m-1 downto 0);
	
begin

	opmode_intern <= opmode;

	shiftReg : for i in 1 to n generate
	
		reg : nBitReg_SSR generic map (BIT_WIDTH => M) 
				port map ( 
				    clk => clk,
                    sr => sr,
                    srinit => srinit(i*m-1 downto (i-1)*m),
                    ce => ce,
                    din => din_intern(i*m-1 downto (i-1)*m),
                    dout => dout_intern(i*m-1 downto (i-1)*m)
                );
				
		in_lmr: if i = n generate
			din_intern(i*m-1 downto (i-1)*m) <= din when toleft = '0' and rotate = '0' else
												dout_intern(m-1 downto 0) when toleft = '0' and rotate = '1' else
												dout_intern((i-1)*m-1 downto (i-2)*m);
		end generate;
		
		in_mr: if i > 1 and i < n generate
			din_intern(i*m-1 downto (i-1)*m) <= dout_intern((i+1)*m-1 downto i*m) when toleft = '0' else
												dout_intern((i-1)*m-1 downto (i-2)*m);
		end generate;
		
		in_rmr: if i = 1 generate
			din_intern(i*m-1 downto (i-1)*m) <= din when toleft = '1' and rotate = '0' else
												dout_intern(n*m-1 downto (n-1)*m) when toleft = '1' and rotate = '1' else
												dout_intern((i+1)*m-1 downto i*m);
		end generate;
		
	end generate;
	
	dout_f <= dout_intern;
	dout <= dout_intern(m-1 downto 0) when toleft = '0' else dout_intern(n*m-1 downto (n-1)*m);

end Behavioral;
