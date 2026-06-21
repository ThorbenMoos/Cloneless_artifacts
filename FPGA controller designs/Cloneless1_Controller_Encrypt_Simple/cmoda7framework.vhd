library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CmodA7framework is
    port ( clk : in STD_LOGIC;
           uart_rx : in STD_LOGIC;
           uart_tx : out STD_LOGIC;
           chip_clk : out STD_LOGIC;
           chip_rst : out STD_LOGIC;
           chip_read : out STD_LOGIC;
           chip_write : out STD_LOGIC;
           chip_address : out STD_LOGIC_VECTOR (2 downto 0);
           chip_data_in : out STD_LOGIC_VECTOR (3 downto 0);
           chip_data_out : in STD_LOGIC_VECTOR (3 downto 0));
end CmodA7framework;

architecture Structural of CmodA7framework is

    component clk_divider is
        port ( clk_in1 : in STD_LOGIC;
               clk_out1 : out STD_LOGIC);
    end component;
    
    component Cloneless_fsm is
        port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               en : in STD_LOGIC;
               conf : in STD_LOGIC_VECTOR(3 downto 0);
               plaintext : in STD_LOGIC_VECTOR(123 downto 0);
               seed : in STD_LOGIC_VECTOR(159 downto 0);
               ciphertext : out STD_LOGIC_VECTOR(123 downto 0);
               done : out STD_LOGIC;
               chip_clk : out STD_LOGIC;
               chip_rst : out STD_LOGIC;
               chip_read : out STD_LOGIC;
               chip_write : out STD_LOGIC;
               chip_address : out STD_LOGIC_VECTOR (2 downto 0);
               chip_data_in : out STD_LOGIC_VECTOR (3 downto 0);
               chip_data_out : in STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component registerserpar is
        generic ( size_ser : positive := 8; size_par : positive := 32);
        port ( clk : in  STD_LOGIC;
               rst : in  STD_LOGIC;
               en : in  STD_LOGIC;
               sel : in  STD_LOGIC;
               ds : in  STD_LOGIC_VECTOR((size_ser - 1) downto 0);
               dp : in  STD_LOGIC_VECTOR((size_par - 1) downto 0);
               qs : out STD_LOGIC_VECTOR((size_ser - 1) downto 0);
               qp : out STD_LOGIC_VECTOR((size_par - 1) downto 0));
    end component;
    
    component uart is
        port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               data_in : in STD_LOGIC_VECTOR(7 downto 0);
               tx_enable : in STD_LOGIC;
               tx_idle : out STD_LOGIC;
               tx_out : out STD_LOGIC;
               data_out : out STD_LOGIC_VECTOR(7 downto 0);
               data_valid : out STD_LOGIC;
               rx_in : in STD_LOGIC);
    end component;
    
    component maincontroller is
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
    end component;
    
   signal in_control : STD_LOGIC_VECTOR(1 downto 0);
   signal out_control : STD_LOGIC_VECTOR(2 downto 0);

   signal input : STD_LOGIC_VECTOR(287 downto 0);
   signal output : STD_LOGIC_VECTOR(127 downto 0);

   signal data_in, data_out : STD_LOGIC_VECTOR(7 downto 0);
   signal tx_enable, tx_idle : STD_LOGIC;
   signal data_valid : STD_LOGIC;
   signal uart_reset : STD_LOGIC;

   signal div_clk, target_reset, target_enable, target_done : STD_LOGIC;

begin

    clk_div : clk_divider port map (clk, div_clk);
    
    uartinstance : uart
    port map (
        clk => div_clk,
        reset => uart_reset,
        data_in => data_in,
        tx_enable => tx_enable,
        tx_idle => tx_idle,
        tx_out => uart_tx,
        data_out => data_out,
        data_valid => data_valid,
        rx_in => uart_rx
    );
    
    register_input : registerserpar
    generic map (size_ser => 8, size_par => 288)
    port map (
        clk => div_clk,
        rst => in_control(0),
        en => in_control(1),
        sel => '0',
        ds => data_out,
        dp => (others => '0'),
        qs => open,
        qp => input
    );
    
    register_ciphertext : registerserpar
    generic map (size_ser => 8, size_par => 128)
    port map (
        clk => div_clk,
        rst => out_control(0),
        en => out_control(1),
        sel => out_control(2),
        ds => (others => '0'),
        dp => output,
        qs => data_in,
        qp => open
    );

    fsm : maincontroller
    port map (
        clk => div_clk,
        uart_reset => uart_reset,
        tx_enable => tx_enable,
        tx_idle => tx_idle,
        data_valid => data_valid,
        target_reset => target_reset,
        target_enable => target_enable,
        target_done => target_done,
        in_control => in_control,
        out_control => out_control
    );

    uut : Cloneless_fsm
    port map (
        clk => div_clk,
        rst => target_reset,
        en => target_enable,
        conf => input(287 downto 284),
        plaintext => input(283 downto 160), 
        seed => input(159 downto 0),
        ciphertext => output(123 downto 0),
        done => target_done,
        chip_clk => chip_clk,
        chip_rst => chip_rst,
        chip_read => chip_read,
        chip_write => chip_write,
        chip_address => chip_address,
        chip_data_in => chip_data_in,
        chip_data_out => chip_data_out
    );

    output(127 downto 124) <= x"0";
    
end Structural;
