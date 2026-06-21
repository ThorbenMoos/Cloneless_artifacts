library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pc_uart_receive is
    Port ( 	clk : in  STD_LOGIC;
            reset: in STD_LOGIC;
            rs232_bit : in STD_LOGIC;
            data_out : out STD_LOGIC_VECTOR(7 downto 0);
            data_valid : out STD_LOGIC
			);
end pc_uart_receive;

architecture Behavioral of pc_uart_receive is

	constant fpga_frequency : integer := 4687500;
	constant bit_rate : integer := 9600;
	
	component nxmBitShiftReg is
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
	end component nxmBitShiftReg;

    signal bit_cnt : unsigned(3 downto 0);
    signal bit_sampled : STD_LOGIC;
    signal bit_sampled_enable : STD_LOGIC;
    signal clk_cnt : integer range 0 to 1048575;
    signal data_out_sr : STD_LOGIC_VECTOR(8 downto 0);
    signal rs232_bit_syn, rs232_bit_last : STD_LOGIC;
    signal bit_receiving_time : unsigned(19 downto 0);
    
	type state_type is (WAIT_DATA, SAMPLING, READY);
	signal state : state_type;

begin

	Inst_shiftregister: nxmBitShiftReg 
		generic map (
			n => 9,
			m => 1
		)
		port map (
			clk => clk,
			sr => reset,
			srinit => (others => '0'),
			ce => bit_sampled_enable,
			opmode => "00",
			din(0) => bit_sampled,
			dout => open,
			dout_f => data_out_sr
		);

    bit_receiving_time <= (to_unsigned(fpga_frequency/bit_rate,bit_receiving_time'length));
    data_out <= data_out_sr(8 downto 1);
    
    RECEIVE : process(clk)
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				state <= WAIT_DATA;
				clk_cnt <= 0;
				bit_cnt <= (others => '0');
				data_valid <= '0';
				bit_sampled <= '0';
				bit_sampled_enable <= '0';
			else
				case state is

					when WAIT_DATA =>   data_valid <= '0';
										if ((rs232_bit_syn = '0') and (rs232_bit_last = '1')) then
											state <= SAMPLING;
										end if;

					when SAMPLING =>    if ((clk_cnt = to_integer(unsigned(bit_receiving_time))/2)) then
											bit_sampled <= rs232_bit;
											bit_sampled_enable <= '1';
										else
											bit_sampled_enable <= '0';
										end if;

										if (clk_cnt < to_integer(bit_receiving_time)) then 
											clk_cnt <= clk_cnt + 1;
										else
											clk_cnt <= 0;
											bit_cnt <= bit_cnt + 1;
										end if;
									
										if (bit_cnt > 8) then
											state <= READY;
										end if;
					
					when READY =>       data_valid <= '1';
										bit_cnt <= (others => '0');
										clk_cnt <= 0;
										state <= WAIT_DATA;
				end case;
			end if;
		end if;
	end process;

    buffering : process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				rs232_bit_syn <= '0';
				rs232_bit_last <= '0';
			else
				rs232_bit_syn <= rs232_bit;
				rs232_bit_last <= rs232_bit_syn;
			end if;
		end if;
    end process;
 
end Behavioral;
