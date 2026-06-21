library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart is
    port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR(7 downto 0);
           tx_enable : in STD_LOGIC;
           tx_idle : out STD_LOGIC;
           tx_out : out STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR(7 downto 0);
           data_valid : out STD_LOGIC;
           rx_in : in STD_LOGIC);
end uart;

architecture Structural of uart is

    component pc_uart_receive is
        port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               rs232_bit : in STD_LOGIC;
               data_out : out STD_LOGIC_VECTOR(7 downto 0);
               data_valid : out STD_LOGIC);
    end component;
    
    component pc_uart_send is
        port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               data_in : in STD_LOGIC_VECTOR(7 downto 0);
               rs232_bit : out STD_LOGIC;
               send_enable : in STD_LOGIC;
               ready_for_data : out STD_LOGIC);
    end component;

begin

    uart_receiver : pc_uart_receive
    port map (
        clk => clk,
        reset => reset,
        rs232_bit => rx_in,
        data_out => data_out,
        data_valid => data_valid
    );
     
    uart_sender : pc_uart_send
    port map (
        clk => clk,
        reset => reset,
        data_in => data_in,
        rs232_bit => tx_out,
        send_enable => tx_enable,
        ready_for_data => tx_idle
    );

end Structural;
