# Clock signal
#Bank = 34, Pin name = ,					Sch name = CLK100MHZ
set_property PACKAGE_PIN L17 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
#create_clock -period 83.333 -name sys_clk_pin -waveform {0.000 41.667} -add [get_ports clk]

# Chip signals
set_property PACKAGE_PIN U8 [get_ports {chip_address[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {chip_address[0]}]
set_property PACKAGE_PIN V8 [get_ports {chip_address[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {chip_address[1]}]
set_property PACKAGE_PIN L3 [get_ports {chip_address[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {chip_address[2]}]

set_property PACKAGE_PIN W6 [get_ports {chip_data_in[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {chip_data_in[0]}]
set_property PACKAGE_PIN U3 [get_ports {chip_data_in[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {chip_data_in[1]}]
set_property PACKAGE_PIN U7 [get_ports {chip_data_in[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {chip_data_in[2]}]
set_property PACKAGE_PIN W7 [get_ports {chip_data_in[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {chip_data_in[3]}]

set_property PACKAGE_PIN A15 [get_ports {chip_clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {chip_clk}]
set_property PACKAGE_PIN B15 [get_ports {chip_rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {chip_rst}]
set_property PACKAGE_PIN U5 [get_ports {chip_read}]
set_property IOSTANDARD LVCMOS33 [get_ports {chip_read}]
set_property PACKAGE_PIN U2 [get_ports {chip_write}]
set_property IOSTANDARD LVCMOS33 [get_ports {chip_write}]

set_property PACKAGE_PIN A16 [get_ports {chip_data_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {chip_data_out[0]}]
set_property PACKAGE_PIN K3 [get_ports {chip_data_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {chip_data_out[1]}]
set_property PACKAGE_PIN C15 [get_ports {chip_data_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {chip_data_out[2]}]
set_property PACKAGE_PIN H1 [get_ports {chip_data_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {chip_data_out[3]}]

##USB-RS232 Interface
##Bank = 16, Pin name = ,					Sch name = UART_TXD_IN
set_property PACKAGE_PIN J17 [get_ports uart_rx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rx]
#Bank = 16, Pin name = ,					Sch name = UART_RXD_OUT
set_property PACKAGE_PIN J18 [get_ports uart_tx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_tx]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]