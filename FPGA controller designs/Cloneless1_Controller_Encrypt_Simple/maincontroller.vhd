library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity maincontroller is
    port ( clk : in STD_LOGIC;
           uart_reset : out STD_LOGIC;
           tx_enable : out STD_LOGIC;
           tx_idle : in STD_LOGIC;
           data_valid : in STD_LOGIC;
           target_reset : out STD_LOGIC;
           target_enable : out STD_LOGIC;
           target_done : in STD_LOGIC;
           in_control : out STD_LOGIC_VECTOR(1 downto 0);
           out_control : out STD_LOGIC_VECTOR(2 downto 0));
end maincontroller;

architecture Behavioral of maincontroller is

    type states is (S_RESET, S_IDLE, S_RECEIVE_INPUT, S_TARGET_INIT, S_TARGET, S_RECEIVE_ZERO, S_SEND_OUTPUT);
    signal current_state, next_state : states := s_reset;
 
    signal cnt_rst, cnt_en : STD_LOGIC;
    signal count : unsigned(7 downto 0);

begin

    counter : process(clk)
    begin
        if rising_edge(clk) then
            if (cnt_rst = '1') then
                count <= (others => '0');
            elsif (cnt_en = '1') then
                count <= count + 1;
            end if;
        end if;
    end process;

	stateregister : process(clk)
	begin
		if rising_edge(clk) then
			current_state <= next_state;
		end if;
	end process;

    stim_proc : process(current_state, data_valid, count, target_done, tx_idle)
    begin
    
        in_control      <= "00";
        out_control     <= "000";
        
        uart_reset      <= '0';
        tx_enable       <= '0';     
        
        target_reset    <= '0';
        target_enable   <= '0';
        
        cnt_rst         <= '0';
        cnt_en          <= '0';

        next_state      <= current_state;
        
        case current_state is
        
            when S_RESET                =>  uart_reset          <= '1';
                                            next_state          <= S_IDLE;
                                            
            when S_IDLE                 =>  cnt_rst             <= '1';
                                            next_state          <= S_RECEIVE_INPUT;
                                            
            when S_RECEIVE_INPUT        =>  if (data_valid = '1') then
                                                cnt_en          <= '1'; 
                                                in_control(1)   <= '1';
                                            end if;
                                            
                                            if (count = x"24") then
                                                cnt_rst         <= '1';
                                                next_state      <= S_TARGET_INIT;
                                            end if;
                                            
            when S_TARGET_INIT          =>  target_reset        <= '1';
                                            cnt_en              <= '1';
                                            if (count = x"3F") then
                                                cnt_rst         <= '1';
                                                next_state      <= S_TARGET;
                                            end if;
                                            
            when S_TARGET               =>  target_enable       <= '1';
                                            if (target_done = '1') then
                                                out_control(1)  <= '1';
                                                out_control(2)  <= '1';
                                                next_state      <= S_RECEIVE_ZERO;
                                            end if;
                                            
            when S_RECEIVE_ZERO         =>  if (data_valid = '1') then
                                                next_state      <= S_SEND_OUTPUT;
                                            end if;
                                            
            when S_SEND_OUTPUT          =>  tx_enable           <= '1';
            
                                            if (tx_idle = '1') then
                                                cnt_en          <= '1'; 
                                                out_control(1)  <= '1';
                                            end if;

                                            if (count = x"10") then
                                                cnt_rst         <= '1';
                                                next_state      <= S_IDLE;
                                            end if;
        end case;
    end process;
    
end Behavioral;
