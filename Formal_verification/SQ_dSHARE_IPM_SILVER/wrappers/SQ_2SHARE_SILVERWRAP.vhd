library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SQ_2SHARE_SILVERWRAP is
    Generic (bits : INTEGER := 5);
    Port ( clk : in STD_LOGIC;
           a0 : in UNSIGNED (bits-1 downto 0);
           a1 : in UNSIGNED (bits-1 downto 0);
           r0 : in UNSIGNED (bits-1 downto 0);
           r1 : in UNSIGNED (bits-1 downto 0);
           b0 : out UNSIGNED (bits-1 downto 0);
           b1 : out UNSIGNED (bits-1 downto 0));
end SQ_2SHARE_SILVERWRAP;

architecture Behavioral of SQ_2SHARE_SILVERWRAP is

    component RedModMersenne is
        Generic ( bits : INTEGER := 7);
        Port ( a : in UNSIGNED (bits-1 downto 0);
               b : out UNSIGNED (bits-1 downto 0));
    end component;
    
    component SQ_dSHARE_IPM is
        Generic (bits : INTEGER := 31;
                 d : INTEGER := 2);
        Port ( clk : in STD_LOGIC;
               en : in STD_LOGIC;
               a : in UNSIGNED (d*bits-1 downto 0);
               c : in UNSIGNED (d*bits-1 downto 0);
               r : in UNSIGNED (d*(d-1)*bits-1 downto 0);
               b : out UNSIGNED (d*bits-1 downto 0));
    end component;
    
    signal a_mod, a_mod_r, a_sel_r, a_sel_rr, r_r, r_rr, b : UNSIGNED (2*bits-1 downto 0);
    signal r0_p, r1_p, r0_p_r, r1_p_r : STD_LOGIC;
    constant zero : UNSIGNED(bits-1 downto 0) := (OTHERS => '0');
    constant coeff : UNSIGNED(63 downto 0) := x"47386b8eed68b734";
    
begin

    RED1: RedModMersenne Generic Map (bits) Port Map (a0, a_mod(bits-1 downto 0));
    RED2: RedModMersenne Generic Map (bits) Port Map (a1, a_mod(2*bits-1 downto bits));
    
    r0_p <= '1' when (r0 = zero) else '0';
    r1_p <= '1' when (r1 = zero) else '0';
    a_sel_r <= (OTHERS => '0') when ((r0_p_r OR r1_p_r) = '1') else a_mod_r;
    
    SQ_instance: SQ_dSHARE_IPM Generic Map (bits, 2) Port Map (clk, '1', a_sel_rr, coeff(2*bits-1 downto 0), r_rr, b);
    b0 <= b(bits-1 downto 0);
    b1 <= b(2*bits-1 downto bits);
    
    REG : process(clk)
    begin
        if (rising_edge(clk)) then
            a_mod_r <= a_mod;
            r0_p_r <= r0_p;
            r1_p_r <= r1_p;
            r_r <= r0 & r1;
            r_rr <= r_r;
            a_sel_rr <= a_sel_r;
        end if;
    end process;
    
end Behavioral;