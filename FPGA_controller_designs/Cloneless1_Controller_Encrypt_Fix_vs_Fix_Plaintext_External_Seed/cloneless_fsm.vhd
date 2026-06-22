library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Cloneless_fsm is
    port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           conf : in STD_LOGIC_VECTOR(3 downto 0);
           plaintext : in STD_LOGIC_VECTOR(123 downto 0);
           seed : in STD_LOGIC_VECTOR(159 downto 0);
           ciphertext : out STD_LOGIC_VECTOR(123 downto 0);
           done : out STD_LOGIC;
           trigger : out STD_LOGIC;
           chip_clk : out STD_LOGIC;
           chip_rst : out STD_LOGIC;
           chip_read : out STD_LOGIC;
           chip_write : out STD_LOGIC;
           chip_address : out STD_LOGIC_VECTOR (2 downto 0);
           chip_data_in : out STD_LOGIC_VECTOR (3 downto 0);
           chip_data_out : in STD_LOGIC_VECTOR (3 downto 0));
end Cloneless_fsm;

architecture Behavioral of Cloneless_fsm is
    
    type states is (S_CONFIG0, S_CONFIG1, S_PLAINTEXT, S_SEED, S_STARTCORE, S_READSTATUS, S_ADDRCHANGE, S_READRESULT, S_FINAL);
    signal state : states;
    
    signal core_select, mps_ipm_trng_puf_active : STD_LOGIC_VECTOR (1 downto 0);

begin
    
    chip_clk                <= clk;
    core_select             <= conf(3 downto 2);
    mps_ipm_trng_puf_active <= conf(1 downto 0);
    
    stim_proc: process(clk)
        variable counter : integer range 0 to 40;
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                chip_rst                                                                <= '1';
                chip_read                                                               <= '0';
                chip_write                                                              <= '0';
                chip_address                                                            <= "000";
                chip_data_in                                                            <= "0000";
                ciphertext                                                              <= (others => '0');
                done                                                                    <= '0';
                trigger                                                                 <= '0';
                counter                                                                 := 0;
                state                                                                   <= S_CONFIG0;
            else
                if (en = '1') then
                    case state is
                    
                        when S_CONFIG0 =>       chip_rst                                <= '0';
                                                chip_write                              <= '1';
                                                chip_data_in                            <= "10" & core_select;
                                                state                                   <= S_CONFIG1;
                    
                        when S_CONFIG1 =>       chip_address                            <= "001";
                                                chip_data_in                            <= mps_ipm_trng_puf_active & "00";
                                                state                                   <= S_PLAINTEXT;
        
                        when S_PLAINTEXT =>     chip_address                            <= "010";
                                                chip_data_in                            <= plaintext(123-counter*4 downto 120-counter*4);
                                                counter                                 := counter + 1;
                                                if (counter = 31) then
                                                    counter                             := 0;
                                                    state                               <= S_SEED;
                                                end if;
        
                        when S_SEED =>          chip_address                            <= "011";
                                                chip_data_in                            <= seed(159-counter*4 downto 156-counter*4);
                                                counter                                 := counter + 1;
                                                if (counter = 40) then
                                                    counter                             := 0;
                                                    state                               <= S_STARTCORE;
                                                end if;
        
                        when S_STARTCORE =>     trigger                                 <= '1';
                                                chip_address                            <= "000";
                                                chip_data_in                            <= "01" & core_select;
                                                state                                   <= S_READSTATUS;
        
                        when S_READSTATUS =>    chip_read                               <= '1';
                                                chip_write                              <= '0';
                                                chip_address                            <= "100";
                                                if (chip_data_out(3) = '1') then
                                                    state                               <= S_ADDRCHANGE;
                                                end if;
        
                        when S_ADDRCHANGE =>    trigger                                 <= '0';
                                                chip_address                            <= "101";
                                                state                                   <= S_READRESULT;
        
                        when S_READRESULT =>    ciphertext(123-counter*4 downto 120-counter*4) <= chip_data_out;
                                                counter                                 := counter + 1;
                                                if (counter = 31) then
                                                    counter                             := 0;
                                                    state                               <= S_FINAL;
                                                end if;
                                                
                        when S_FINAL =>         chip_rst                                <= '1';
                                                chip_read                               <= '0';
                                                chip_write                              <= '0';
                                                chip_address                            <= "000";
                                                chip_data_in                            <= "0000";
                                                done                                    <= '1';
        
                    end case;
                end if;
            end if;
        end if;
    end process;

end Behavioral;
