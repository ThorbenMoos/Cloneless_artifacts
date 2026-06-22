library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SQ_3SHARE_SILVERWRAP is
    Generic (bits : INTEGER := 2);
    Port ( clk : in STD_LOGIC;
           a0 : in UNSIGNED (bits-1 downto 0);
           a1 : in UNSIGNED (bits-1 downto 0);
           a2 : in UNSIGNED (bits-1 downto 0);
           r0 : in UNSIGNED (bits-1 downto 0);
           r1 : in UNSIGNED (bits-1 downto 0);
           r2 : in UNSIGNED (bits-1 downto 0);
           r3 : in UNSIGNED (bits-1 downto 0);
           r4 : in UNSIGNED (bits-1 downto 0);
           r5 : in UNSIGNED (bits-1 downto 0);
           b0 : out UNSIGNED (bits-1 downto 0);
           b1 : out UNSIGNED (bits-1 downto 0);
           b2 : out UNSIGNED (bits-1 downto 0));
end SQ_3SHARE_SILVERWRAP;

architecture Behavioral of SQ_3SHARE_SILVERWRAP is

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
    
    signal a_mod, a_mod_r, a_sel_r, a_sel_rr, b : UNSIGNED (3*bits-1 downto 0);
    signal r_r, r_rr : UNSIGNED (6*bits-1 downto 0);
    signal r0_p, r1_p, r2_p, r3_p, r4_p, r5_p, r0_p_r, r1_p_r, r2_p_r, r3_p_r, r4_p_r, r5_p_r : STD_LOGIC;
    constant zero : UNSIGNED(bits-1 downto 0) := (OTHERS => '0');
    constant coeff : UNSIGNED(95 downto 0) := x"47386b8eed68b7342bbc17bd";
    
begin

    RED1: RedModMersenne Generic Map (bits) Port Map (a0, a_mod(bits-1 downto 0));
    RED2: RedModMersenne Generic Map (bits) Port Map (a1, a_mod(2*bits-1 downto bits));
    RED3: RedModMersenne Generic Map (bits) Port Map (a2, a_mod(3*bits-1 downto 2*bits));
    
    r0_p <= '1' when (r0 = zero) else '0';
    r1_p <= '1' when (r1 = zero) else '0';
    r2_p <= '1' when (r2 = zero) else '0';
    r3_p <= '1' when (r3 = zero) else '0';
    r4_p <= '1' when (r4 = zero) else '0';
    r5_p <= '1' when (r5 = zero) else '0';
    a_sel_r <= (OTHERS => '0') when ((r0_p_r OR r1_p_r OR r2_p_r OR r3_p_r OR r4_p_r OR r5_p_r) = '1') else a_mod_r;
    
    SQ_instance: SQ_dSHARE_IPM Generic Map (bits, 3) Port Map (clk, '1', a_sel_rr, coeff(3*bits-1 downto 0), r_rr, b);
    b0 <= b(bits-1 downto 0);
    b1 <= b(2*bits-1 downto bits);
    b2 <= b(3*bits-1 downto 2*bits);
    
    REG : process(clk)
    begin
        if (rising_edge(clk)) then
            a_mod_r <= a_mod;
            r0_p_r <= r0_p;
            r1_p_r <= r1_p;
            r2_p_r <= r2_p;
            r3_p_r <= r3_p;
            r4_p_r <= r4_p;
            r5_p_r <= r5_p;
            r_r <= r0 & r1 & r2 & r3 & r4 & r5;
            r_rr <= r_r;
            a_sel_rr <= a_sel_r;
        end if;
    end process;
    
end Behavioral;