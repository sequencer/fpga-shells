# ----------------------------------------------------------------------------
#     _____
#    /     \
#   /____   \____
#  / \===\   \==/
# /___\===\___\/  AVNET Design Resource Center
#      \======/         www.em.avnet.com/drc
#       \====/    
# ----------------------------------------------------------------------------
#  
#  Disclaimer:
#     Avnet, Inc. makes no warranty for the use of this code or design.
#     This code is provided  "As Is". Avnet, Inc assumes no responsibility for
#     any errors, which may appear in this code, nor does it make a commitment
#     to update the information contained herein. Avnet, Inc specifically
#     disclaims any implied warranties of fitness for a particular purpose.
#                      Copyright(c) 2009 Avnet, Inc.
#                              All rights reserved.
# 
# ----------------------------------------------------------------------------

## 250MHz System Clock 
set_property IOSTANDARD DIFF_SSTL12 [get_ports C0_SYS_CLK_clk_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports C0_SYS_CLK_clk_n]
set_property PACKAGE_PIN H22 [get_ports C0_SYS_CLK_clk_p]
set_property PACKAGE_PIN H23 [get_ports C0_SYS_CLK_clk_n]


## USB-UART Interface
set_property PACKAGE_PIN C19 [get_ports usb_uart_rxd]
set_property IOSTANDARD LVCMOS18 [get_ports usb_uart_rxd]
set_property PACKAGE_PIN D20 [get_ports usb_uart_txd]
set_property IOSTANDARD LVCMOS18 [get_ports usb_uart_txd]


## Ethernet #1 Interface (J1)
set_property PACKAGE_PIN C8 [get_ports mdio_mdio_io]
set_property IOSTANDARD LVCMOS18 [get_ports mdio_mdio_io]

set_property PACKAGE_PIN C9 [get_ports mdio_mdc]
set_property IOSTANDARD LVCMOS18 [get_ports mdio_mdc]

set_property PACKAGE_PIN D9 [get_ports phy_rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports phy_rst_n]

set_property PACKAGE_PIN A10 [get_ports {rgmii_rd[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rd[0]}]

set_property PACKAGE_PIN B10 [get_ports {rgmii_rd[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rd[1]}]

set_property PACKAGE_PIN B11 [get_ports {rgmii_rd[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rd[2]}]

set_property PACKAGE_PIN C11 [get_ports {rgmii_rd[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_rd[3]}]

set_property PACKAGE_PIN D11 [get_ports rgmii_rx_ctl]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_rx_ctl]

set_property PACKAGE_PIN E11 [get_ports rgmii_rxc]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_rxc]

set_property PACKAGE_PIN H8 [get_ports {rgmii_td[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_td[0]}]

set_property PACKAGE_PIN H9 [get_ports {rgmii_td[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_td[1]}]

set_property PACKAGE_PIN J9 [get_ports {rgmii_td[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_td[2]}]

set_property PACKAGE_PIN J10 [get_ports {rgmii_td[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_td[3]}]

set_property PACKAGE_PIN G9 [get_ports rgmii_tx_ctl]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_tx_ctl]

set_property PACKAGE_PIN G10 [get_ports rgmii_txc]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_txc]

 
## Ethernet #2 Interface (J2)
set_property PACKAGE_PIN C14 [get_ports mdio_1_mdio_io]
set_property IOSTANDARD LVCMOS18 [get_ports mdio_1_mdio_io]

set_property PACKAGE_PIN D14 [get_ports mdio_1_mdc]
set_property IOSTANDARD LVCMOS18 [get_ports mdio_1_mdc]

set_property PACKAGE_PIN E15 [get_ports phy_rst_n_1]
set_property IOSTANDARD LVCMOS18 [get_ports phy_rst_n_1]

set_property PACKAGE_PIN A14 [get_ports {rgmii_1_rd[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_1_rd[0]}]

set_property PACKAGE_PIN B14 [get_ports {rgmii_1_rd[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_1_rd[1]}]

set_property PACKAGE_PIN A15 [get_ports {rgmii_1_rd[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_1_rd[2]}]

set_property PACKAGE_PIN B15 [get_ports {rgmii_1_rd[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_1_rd[3]}]

set_property PACKAGE_PIN E12 [get_ports rgmii_1_rx_ctl]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_1_rx_ctl]

set_property PACKAGE_PIN E13 [get_ports rgmii_1_rxc]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_1_rxc]

set_property PACKAGE_PIN F13 [get_ports {rgmii_1_td[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_1_td[0]}]

set_property PACKAGE_PIN F14 [get_ports {rgmii_1_td[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_1_td[1]}]

set_property PACKAGE_PIN F15 [get_ports {rgmii_1_td[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_1_td[2]}]

set_property PACKAGE_PIN H14 [get_ports {rgmii_1_td[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {rgmii_1_td[3]}]

set_property PACKAGE_PIN G14 [get_ports rgmii_1_tx_ctl]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_1_tx_ctl]

set_property PACKAGE_PIN G15 [get_ports rgmii_1_txc]
set_property IOSTANDARD LVCMOS18 [get_ports rgmii_1_txc]


## User Code/Data QSPI Interface
set_property PACKAGE_PIN G11 [get_ports spi_2_io0_io]
set_property IOSTANDARD LVCMOS18 [get_ports spi_2_io0_io]

set_property PACKAGE_PIN H11 [get_ports spi_2_io1_io]
set_property IOSTANDARD LVCMOS18 [get_ports spi_2_io1_io]

set_property PACKAGE_PIN J11 [get_ports spi_2_io2_io]
set_property IOSTANDARD LVCMOS18 [get_ports spi_2_io2_io]

set_property PACKAGE_PIN H12 [get_ports spi_2_io3_io]
set_property IOSTANDARD LVCMOS18 [get_ports spi_2_io3_io]

set_property PACKAGE_PIN D19 [get_ports {spi_2_ss_io[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_2_ss_io[0]}]

set_property PACKAGE_PIN F10 [get_ports spi_2_sck_io]
set_property IOSTANDARD LVCMOS18 [get_ports spi_2_sck_io]


## User LEDs
set_property PACKAGE_PIN D16 [get_ports {gpio_leds_tri_o[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_leds_tri_o[0]}]

set_property PACKAGE_PIN G16 [get_ports {gpio_leds_tri_o[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_leds_tri_o[1]}]

set_property PACKAGE_PIN H16 [get_ports {gpio_leds_tri_o[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_leds_tri_o[2]}]

set_property PACKAGE_PIN E18 [get_ports {gpio_leds_tri_o[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_leds_tri_o[3]}]

set_property PACKAGE_PIN E17 [get_ports {gpio_leds_tri_o[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_leds_tri_o[4]}]

set_property PACKAGE_PIN E16 [get_ports {gpio_leds_tri_o[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_leds_tri_o[5]}]

set_property PACKAGE_PIN H18 [get_ports {gpio_leds_tri_o[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_leds_tri_o[6]}]

set_property PACKAGE_PIN H17 [get_ports {gpio_leds_tri_o[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_leds_tri_o[7]}]


## User DIP Switches
set_property PACKAGE_PIN G20 [get_ports {gpio_dip_sw_tri_i[0]}]
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_dip_sw_tri_i[0]}]

set_property PACKAGE_PIN H19 [get_ports {gpio_dip_sw_tri_i[1]}]
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_dip_sw_tri_i[1]}]

set_property PACKAGE_PIN K22 [get_ports {gpio_dip_sw_tri_i[2]}]
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_dip_sw_tri_i[2]}]

set_property PACKAGE_PIN L22 [get_ports {gpio_dip_sw_tri_i[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_dip_sw_tri_i[3]}]

set_property PACKAGE_PIN G22 [get_ports {gpio_dip_sw_tri_i[4]}]
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_dip_sw_tri_i[4]}]

set_property PACKAGE_PIN G21 [get_ports {gpio_dip_sw_tri_i[5]}]
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_dip_sw_tri_i[5]}]

set_property PACKAGE_PIN H21 [get_ports {gpio_dip_sw_tri_i[6]}]
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_dip_sw_tri_i[6]}]

set_property PACKAGE_PIN J21 [get_ports {gpio_dip_sw_tri_i[7]}]
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_dip_sw_tri_i[7]}]


## User PUSH Switches
set_property PACKAGE_PIN K18 [get_ports {gpio_push_sw_tri_i[0]}]
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_push_sw_tri_i[0]}]

set_property PACKAGE_PIN L18 [get_ports {gpio_push_sw_tri_i[1]}]
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_push_sw_tri_i[1]}]

set_property PACKAGE_PIN K21 [get_ports {gpio_push_sw_tri_i[2]}]
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_push_sw_tri_i[2]}]

set_property PACKAGE_PIN K20 [get_ports {gpio_push_sw_tri_i[3]}]
set_property IOSTANDARD LVCMOS12 [get_ports {gpio_push_sw_tri_i[3]}]


## DDR4 Interface
set_property PACKAGE_PIN N24 [get_ports sys_rst]
set_property IOSTANDARD LVCMOS12 [get_ports sys_rst]
set_property DRIVE 8 [get_ports sys_rst]

set_property PACKAGE_PIN AA25 [get_ports {c0_ddr4_ck_t[0]}]
set_property PACKAGE_PIN AB25 [get_ports {C0_DDR4_ck_c[0]}]
set_property IOSTANDARD DIFF_SSTL12_DCI [ get_ports "c0_ddr4_ck_t[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_ck_t[0]" ]
set_property IOSTANDARD DIFF_SSTL12_DCI [ get_ports "C0_DDR4_ck_c[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "C0_DDR4_ck_c[0]" ]

set_property PACKAGE_PIN AA24 [get_ports {C0_DDR4_adr[0]}]
set_property PACKAGE_PIN AB24 [get_ports {C0_DDR4_adr[1]}]
set_property PACKAGE_PIN AB26 [get_ports {C0_DDR4_adr[2]}]
set_property PACKAGE_PIN AC26 [get_ports {C0_DDR4_adr[3]}]
set_property PACKAGE_PIN AA22 [get_ports {C0_DDR4_adr[4]}]
set_property PACKAGE_PIN AB22 [get_ports {C0_DDR4_adr[5]}]
set_property PACKAGE_PIN Y23 [get_ports {C0_DDR4_adr[6]}]
set_property PACKAGE_PIN AA23 [get_ports {C0_DDR4_adr[7]}]
set_property PACKAGE_PIN AC23 [get_ports {C0_DDR4_adr[8]}]
set_property PACKAGE_PIN AC24 [get_ports {C0_DDR4_adr[9]}]
set_property PACKAGE_PIN W23 [get_ports {C0_DDR4_adr[10]}]
set_property PACKAGE_PIN W24 [get_ports {C0_DDR4_adr[11]}]
set_property PACKAGE_PIN W25 [get_ports {C0_DDR4_adr[12]}]
set_property PACKAGE_PIN W26 [get_ports {C0_DDR4_adr[13]}]

set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[0]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[1]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[2]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[3]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[4]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[5]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[6]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[7]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[8]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[9]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[10]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[11]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[12]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[13]}]

set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[0]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[1]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[2]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[3]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[4]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[5]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[6]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[7]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[8]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[9]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[10]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[11]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[12]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[13]}]

set_property PACKAGE_PIN F22 [get_ports {c0_ddr4_dqs_t[3]}]
set_property PACKAGE_PIN F23 [get_ports {C0_DDR4_dqs_c[3]}]
set_property PACKAGE_PIN K26 [get_ports {c0_ddr4_dqs_t[2]}]
set_property PACKAGE_PIN J26 [get_ports {C0_DDR4_dqs_c[2]}]
set_property PACKAGE_PIN T19 [get_ports {c0_ddr4_dqs_t[1]}]
set_property PACKAGE_PIN T20 [get_ports {C0_DDR4_dqs_c[1]}]
set_property PACKAGE_PIN R22 [get_ports {c0_ddr4_dqs_t[0]}]
set_property PACKAGE_PIN R23 [get_ports {C0_DDR4_dqs_c[0]}]

set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {c0_ddr4_dqs_t[3]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dqs_c[3]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {c0_ddr4_dqs_t[2]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dqs_c[2]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {c0_ddr4_dqs_t[1]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dqs_c[1]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {c0_ddr4_dqs_t[0]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dqs_c[0]}]

set_property IOSTANDARD DIFF_POD12_DCI [get_ports {c0_ddr4_dqs_t[3]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {C0_DDR4_dqs_c[3]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {c0_ddr4_dqs_t[2]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {C0_DDR4_dqs_c[2]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {c0_ddr4_dqs_t[1]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {C0_DDR4_dqs_c[1]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {c0_ddr4_dqs_t[0]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports {C0_DDR4_dqs_c[0]}]

set_property PACKAGE_PIN E25 [get_ports {C0_DDR4_dm_n[3]}]
set_property PACKAGE_PIN N23 [get_ports {C0_DDR4_dm_n[2]}]
set_property PACKAGE_PIN R18 [get_ports {C0_DDR4_dm_n[1]}]
set_property PACKAGE_PIN T23 [get_ports {C0_DDR4_dm_n[0]}]

set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dm_n[3]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dm_n[2]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dm_n[1]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dm_n[0]}]

set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dm_n[3]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dm_n[2]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dm_n[1]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dm_n[0]}]

set_property PACKAGE_PIN G24 [get_ports {C0_DDR4_dq[31]}]
set_property PACKAGE_PIN H24 [get_ports {C0_DDR4_dq[30]}]
set_property PACKAGE_PIN J25 [get_ports {C0_DDR4_dq[29]}]
set_property PACKAGE_PIN J24 [get_ports {C0_DDR4_dq[28]}]
set_property PACKAGE_PIN F25 [get_ports {C0_DDR4_dq[27]}]
set_property PACKAGE_PIN G25 [get_ports {C0_DDR4_dq[26]}]
set_property PACKAGE_PIN G26 [get_ports {C0_DDR4_dq[25]}]
set_property PACKAGE_PIN H26 [get_ports {C0_DDR4_dq[24]}]
set_property PACKAGE_PIN L25 [get_ports {C0_DDR4_dq[23]}]
set_property PACKAGE_PIN M25 [get_ports {C0_DDR4_dq[22]}]
set_property PACKAGE_PIN M22 [get_ports {C0_DDR4_dq[21]}]
set_property PACKAGE_PIN N22 [get_ports {C0_DDR4_dq[20]}]
set_property PACKAGE_PIN L24 [get_ports {C0_DDR4_dq[19]}]
set_property PACKAGE_PIN M24 [get_ports {C0_DDR4_dq[18]}]
set_property PACKAGE_PIN M26 [get_ports {C0_DDR4_dq[17]}]
set_property PACKAGE_PIN N26 [get_ports {C0_DDR4_dq[16]}]
set_property PACKAGE_PIN U21 [get_ports {C0_DDR4_dq[15]}]
set_property PACKAGE_PIN U20 [get_ports {C0_DDR4_dq[14]}]
set_property PACKAGE_PIN R20 [get_ports {C0_DDR4_dq[13]}]
set_property PACKAGE_PIN P20 [get_ports {C0_DDR4_dq[12]}]
set_property PACKAGE_PIN P19 [get_ports {C0_DDR4_dq[11]}]
set_property PACKAGE_PIN P18 [get_ports {C0_DDR4_dq[10]}]
set_property PACKAGE_PIN R21 [get_ports {C0_DDR4_dq[9]}]
set_property PACKAGE_PIN P21 [get_ports {C0_DDR4_dq[8]}]
set_property PACKAGE_PIN R25 [get_ports {C0_DDR4_dq[7]}]
set_property PACKAGE_PIN P25 [get_ports {C0_DDR4_dq[6]}]
set_property PACKAGE_PIN P24 [get_ports {C0_DDR4_dq[5]}]
set_property PACKAGE_PIN P23 [get_ports {C0_DDR4_dq[4]}]
set_property PACKAGE_PIN R26 [get_ports {C0_DDR4_dq[3]}]
set_property PACKAGE_PIN P26 [get_ports {C0_DDR4_dq[2]}]
set_property PACKAGE_PIN U22 [get_ports {C0_DDR4_dq[1]}]
set_property PACKAGE_PIN T22 [get_ports {C0_DDR4_dq[0]}]

set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[31]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[30]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[29]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[28]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[27]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[26]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[25]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[24]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[23]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[22]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[21]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[20]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[19]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[18]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[17]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[16]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[15]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[14]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[13]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[12]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[11]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[10]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[9]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[8]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[7]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[6]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[5]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[4]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[3]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[2]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[1]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_dq[0]}]

set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[31]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[30]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[29]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[28]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[27]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[26]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[25]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[24]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[23]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[22]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[21]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[20]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[19]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[18]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[17]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[16]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[15]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[14]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[13]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[12]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[11]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[10]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[9]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[8]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[7]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[6]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[5]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[4]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[3]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[2]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[1]}]
set_property IOSTANDARD POD12_DCI [get_ports {C0_DDR4_dq[0]}]

## WE_N Signal
set_property PACKAGE_PIN Y25 [get_ports {C0_DDR4_adr[14]}]
## CAS_N Signal
set_property PACKAGE_PIN Y26 [get_ports {C0_DDR4_adr[15]}]
## RAS_N Signal
set_property PACKAGE_PIN U26 [get_ports {C0_DDR4_adr[16]}]

set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[14]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[15]}]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [get_ports {C0_DDR4_adr[16]}]

set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[14]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[15]}]
set_property IOSTANDARD SSTL12_DCI [get_ports {C0_DDR4_adr[16]}]

set_property PACKAGE_PIN T24 [get_ports C0_DDR4_act_n]
set_property IOSTANDARD SSTL12_DCI [ get_ports "C0_DDR4_act_n" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "C0_DDR4_act_n" ]

set_property PACKAGE_PIN T25 [get_ports C0_DDR4_reset_n]
set_property IOSTANDARD LVCMOS12 [ get_ports "C0_DDR4_reset_n" ]
set_property DRIVE 8 [get_ports C0_DDR4_reset_n]

set_property PACKAGE_PIN U25 [get_ports {C0_DDR4_odt[0]}]
set_property IOSTANDARD SSTL12_DCI [ get_ports "C0_DDR4_odt[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "C0_DDR4_odt[0]" ]

set_property PACKAGE_PIN V22 [get_ports {C0_DDR4_cs_n[0]}]
set_property IOSTANDARD SSTL12_DCI [ get_ports "C0_DDR4_cs_n[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "C0_DDR4_cs_n[0]" ]

set_property PACKAGE_PIN V23 [get_ports {C0_DDR4_cke[0]}]
set_property IOSTANDARD SSTL12_DCI [ get_ports "C0_DDR4_cke[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "C0_DDR4_cke[0]" ]

set_property PACKAGE_PIN V26 [get_ports {C0_DDR4_ba[0]}]
set_property IOSTANDARD SSTL12_DCI [ get_ports "C0_DDR4_ba[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "C0_DDR4_ba[0]" ]

set_property PACKAGE_PIN U24 [get_ports {C0_DDR4_ba[1]}]
set_property IOSTANDARD SSTL12_DCI [ get_ports "C0_DDR4_ba[1]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "C0_DDR4_ba[1]" ]

set_property PACKAGE_PIN V24 [get_ports {C0_DDR4_bg[0]}]
set_property IOSTANDARD SSTL12_DCI [ get_ports "C0_DDR4_bg[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "C0_DDR4_bg[0]" ]

set_property PACKAGE_PIN T18 [get_ports c0_init_calib_complete]
set_property IOSTANDARD LVCMOS12 [get_ports c0_init_calib_complete]
set_property DRIVE 8 [get_ports c0_init_calib_complete]


## FMC HPC Interface

# GTH Clock Inputs
set_property PACKAGE_PIN T5 [get_ports GCLK0_M2C_N]
set_property PACKAGE_PIN T6 [get_ports GCLK0_M2C_P]
set_property PACKAGE_PIN Y5 [get_ports GCLK1_M2C_N]
set_property PACKAGE_PIN Y6 [get_ports GCLK1_M2C_P]

# GTH Ports (8)
set_property PACKAGE_PIN AA3 [get_ports DP0_C2M_N]
set_property PACKAGE_PIN AA4 [get_ports DP0_C2M_P]
set_property PACKAGE_PIN Y1  [get_ports DP0_M2C_N]
set_property PACKAGE_PIN Y2  [get_ports DP0_M2C_P]
set_property PACKAGE_PIN W3  [get_ports DP1_C2M_N]
set_property PACKAGE_PIN W4  [get_ports DP1_C2M_P]
set_property PACKAGE_PIN V1  [get_ports DP1_M2C_N]
set_property PACKAGE_PIN V2  [get_ports DP1_M2C_P]
set_property PACKAGE_PIN U3  [get_ports DP2_C2M_N]
set_property PACKAGE_PIN U4  [get_ports DP2_C2M_P]
set_property PACKAGE_PIN T1  [get_ports DP2_M2C_N]
set_property PACKAGE_PIN T2  [get_ports DP2_M2C_P]
set_property PACKAGE_PIN R3  [get_ports DP3_C2M_N]
set_property PACKAGE_PIN R4  [get_ports DP3_C2M_P]
set_property PACKAGE_PIN P1  [get_ports DP3_M2C_N]
set_property PACKAGE_PIN P2  [get_ports DP3_M2C_P]
set_property PACKAGE_PIN AF5 [get_ports DP4_C2M_N]
set_property PACKAGE_PIN AF6 [get_ports DP4_C2M_P]
set_property PACKAGE_PIN AF1 [get_ports DP4_M2C_N]
set_property PACKAGE_PIN AF2 [get_ports DP4_M2C_P]
set_property PACKAGE_PIN AD5 [get_ports DP5_C2M_N]
set_property PACKAGE_PIN AD6 [get_ports DP5_C2M_P]
set_property PACKAGE_PIN AE3 [get_ports DP5_M2C_N]
set_property PACKAGE_PIN AE4 [get_ports DP5_M2C_P]
set_property PACKAGE_PIN AC3 [get_ports DP6_C2M_N]
set_property PACKAGE_PIN AC4 [get_ports DP6_C2M_P]
set_property PACKAGE_PIN AD1 [get_ports DP6_M2C_N]
set_property PACKAGE_PIN AD2 [get_ports DP6_M2C_P]
set_property PACKAGE_PIN AB5 [get_ports DP7_C2M_N]
set_property PACKAGE_PIN AB6 [get_ports DP7_C2M_P]
set_property PACKAGE_PIN AB1 [get_ports DP7_M2C_N]
set_property PACKAGE_PIN AB2 [get_ports DP7_M2C_P]

# LA Differential pairs (34)
set_property PACKAGE_PIN AC16 [get_ports {FMC_LA_P[33]}]
set_property PACKAGE_PIN AD16 [get_ports {FMC_LA_N[33]}]
set_property PACKAGE_PIN AB17 [get_ports {FMC_LA_P[32]}]
set_property PACKAGE_PIN AC17 [get_ports {FMC_LA_N[32]}]
set_property PACKAGE_PIN AE17 [get_ports {FMC_LA_P[31]}]
set_property PACKAGE_PIN AE18 [get_ports {FMC_LA_N[31]}]
set_property PACKAGE_PIN AF19 [get_ports {FMC_LA_P[30]}]
set_property PACKAGE_PIN AF20 [get_ports {FMC_LA_N[30]}]
set_property PACKAGE_PIN AC18 [get_ports {FMC_LA_P[29]}]
set_property PACKAGE_PIN AD18 [get_ports {FMC_LA_N[29]}]
set_property PACKAGE_PIN AF17 [get_ports {FMC_LA_P[28]}]
set_property PACKAGE_PIN AF18 [get_ports {FMC_LA_N[28]}]
set_property PACKAGE_PIN W16 [get_ports {FMC_LA_P[27]}]
set_property PACKAGE_PIN Y16 [get_ports {FMC_LA_N[27]}]
set_property PACKAGE_PIN W21 [get_ports {FMC_LA_P[26]}]
set_property PACKAGE_PIN Y21 [get_ports {FMC_LA_N[26]}]
set_property PACKAGE_PIN W18 [get_ports {FMC_LA_P[25]}]
set_property PACKAGE_PIN W19 [get_ports {FMC_LA_N[25]}]
set_property PACKAGE_PIN V18 [get_ports {FMC_LA_P[24]}]
set_property PACKAGE_PIN V19 [get_ports {FMC_LA_N[24]}]
set_property PACKAGE_PIN Y17 [get_ports {FMC_LA_P[23]}]
set_property PACKAGE_PIN Y18 [get_ports {FMC_LA_N[23]}]
set_property PACKAGE_PIN AC19 [get_ports {FMC_LA_P[22]}]
set_property PACKAGE_PIN AD19 [get_ports {FMC_LA_N[22]}]
set_property PACKAGE_PIN AE20 [get_ports {FMC_LA_P[21]}]
set_property PACKAGE_PIN AE21 [get_ports {FMC_LA_N[21]}]
set_property PACKAGE_PIN AB21 [get_ports {FMC_LA_P[20]}]
set_property PACKAGE_PIN AC21 [get_ports {FMC_LA_N[20]}]
set_property PACKAGE_PIN AD20 [get_ports {FMC_LA_P[19]}]
set_property PACKAGE_PIN AD21 [get_ports {FMC_LA_N[19]}]
set_property PACKAGE_PIN AB19 [get_ports {FMC_LA_P[18]}]
set_property PACKAGE_PIN AB20 [get_ports {FMC_LA_N[18]}]
set_property PACKAGE_PIN W20 [get_ports {FMC_LA_P[17]}]
set_property PACKAGE_PIN Y20 [get_ports {FMC_LA_N[17]}]
set_property PACKAGE_PIN AE16 [get_ports {FMC_LA_P[16]}]
set_property PACKAGE_PIN AF15 [get_ports {FMC_LA_N[16]}]
set_property PACKAGE_PIN AF14 [get_ports {FMC_LA_P[15]}]
set_property PACKAGE_PIN AF13 [get_ports {FMC_LA_N[15]}]
set_property PACKAGE_PIN AD15 [get_ports {FMC_LA_P[14]}]
set_property PACKAGE_PIN AE15 [get_ports {FMC_LA_N[14]}]
set_property PACKAGE_PIN AE12 [get_ports {FMC_LA_P[13]}]
set_property PACKAGE_PIN AF12 [get_ports {FMC_LA_N[13]}]
set_property PACKAGE_PIN AC14 [get_ports {FMC_LA_P[12]}]
set_property PACKAGE_PIN AC13 [get_ports {FMC_LA_N[12]}]
set_property PACKAGE_PIN AD14 [get_ports {FMC_LA_P[11]}]
set_property PACKAGE_PIN AD13 [get_ports {FMC_LA_N[11]}]
set_property PACKAGE_PIN AA15 [get_ports {FMC_LA_P[10]}]
set_property PACKAGE_PIN AB15 [get_ports {FMC_LA_N[10]}]
set_property PACKAGE_PIN W15 [get_ports {FMC_LA_P[9]}]
set_property PACKAGE_PIN Y15 [get_ports {FMC_LA_N[9]}]
set_property PACKAGE_PIN AA14 [get_ports {FMC_LA_P[8]}]
set_property PACKAGE_PIN AB14 [get_ports {FMC_LA_N[8]}]
set_property PACKAGE_PIN W14 [get_ports {FMC_LA_P[7]}]
set_property PACKAGE_PIN W13 [get_ports {FMC_LA_N[7]}]
set_property PACKAGE_PIN AA13 [get_ports {FMC_LA_P[6]}]
set_property PACKAGE_PIN AA12 [get_ports {FMC_LA_N[6]}]
set_property PACKAGE_PIN AC9 [get_ports {FMC_LA_P[5]}]
set_property PACKAGE_PIN AD9 [get_ports {FMC_LA_N[5]}]
set_property PACKAGE_PIN AE10 [get_ports {FMC_LA_P[4]}]
set_property PACKAGE_PIN AF10 [get_ports {FMC_LA_N[4]}]
set_property PACKAGE_PIN AC8 [get_ports {FMC_LA_P[3]}]
set_property PACKAGE_PIN AD8 [get_ports {FMC_LA_N[3]}]
set_property PACKAGE_PIN AB10 [get_ports {FMC_LA_P[2]}]
set_property PACKAGE_PIN AB9 [get_ports {FMC_LA_N[2]}]
set_property PACKAGE_PIN AD11 [get_ports {FMC_LA_P[1]}]
set_property PACKAGE_PIN AE11 [get_ports {FMC_LA_N[1]}]
set_property PACKAGE_PIN AB12 [get_ports {FMC_LA_P[0]}]
set_property PACKAGE_PIN AB11 [get_ports {FMC_LA_N[0]}]

# Please modify the IOSTANDARD when using the signals as differential pairs.
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[33]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[33]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[32]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[32]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[31]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[31]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[30]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[30]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[29]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[29]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[28]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[28]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[27]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[27]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[26]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[26]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[25]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[25]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[24]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[24]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[23]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[23]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[22]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[22]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[21]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[21]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[20]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[20]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[19]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[19]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[18]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[18]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[17]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[17]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[16]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[16]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[15]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[15]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[14]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[14]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[13]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[13]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[12]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[12]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[11]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[11]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[10]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[10]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_P[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {FMC_LA_N[0]}]

set_property PACKAGE_PIN AC11 [get_ports FMC_CLK0_M2C_N]
set_property IOSTANDARD LVCMOS25 [get_ports FMC_CLK0_M2C_N]
set_property PACKAGE_PIN AC12 [get_ports FMC_CLK0_M2C_P]
set_property IOSTANDARD LVCMOS25 [get_ports FMC_CLK0_M2C_P]

set_property PACKAGE_PIN AA20 [get_ports FMC_CLK1_M2C_N]
set_property IOSTANDARD LVCMOS25 [get_ports FMC_CLK1_M2C_N]
set_property PACKAGE_PIN AA19 [get_ports FMC_CLK1_M2C_P]
set_property IOSTANDARD LVCMOS25 [get_ports FMC_CLK1_M2C_P]

set_property  PACKAGE_PIN AF25 [get_ports FMC_SCL]
set_property  PACKAGE_PIN AE22 [get_ports FMC_SDA]
set_property  PACKAGE_PIN AF22 [get_ports TRST_L]
set_property  PACKAGE_PIN AE25 [get_ports PRSNT_M2C_L]

set_property  IOSTANDARD LVCMOS25 [get_ports FMC_SCL]
set_property  IOSTANDARD LVCMOS25 [get_ports FMC_SDA]
set_property  IOSTANDARD LVCMOS25 [get_ports TRST_L]
set_property  IOSTANDARD LVCMOS25 [get_ports PRSNT_M2C_L]


## PMOD Interfaces

# PMOD1 Connector (J12)
set_property PACKAGE_PIN J13 [get_ports pmod1_pin1]
set_property PACKAGE_PIN H13 [get_ports pmod1_pin2]
set_property PACKAGE_PIN A13 [get_ports pmod1_pin3]
set_property PACKAGE_PIN A12 [get_ports pmod1_pin4]
set_property PACKAGE_PIN C12 [get_ports pmod1_pin7]
set_property PACKAGE_PIN B12 [get_ports pmod1_pin8]
set_property PACKAGE_PIN D13 [get_ports pmod1_pin9]
set_property PACKAGE_PIN C13 [get_ports pmod1_pin10]

set_property IOSTANDARD LVCMOS18 [get_ports pmod1_pin1]
set_property IOSTANDARD LVCMOS18 [get_ports pmod1_pin2]
set_property IOSTANDARD LVCMOS18 [get_ports pmod1_pin3]
set_property IOSTANDARD LVCMOS18 [get_ports pmod1_pin4]
set_property IOSTANDARD LVCMOS18 [get_ports pmod1_pin7]
set_property IOSTANDARD LVCMOS18 [get_ports pmod1_pin8]
set_property IOSTANDARD LVCMOS18 [get_ports pmod1_pin9]
set_property IOSTANDARD LVCMOS18 [get_ports pmod1_pin10]

# PMOD2 Connector (J13)
set_property PACKAGE_PIN F9 [get_ports pmod2_pin1]
set_property PACKAGE_PIN F8 [get_ports pmod2_pin2]
set_property PACKAGE_PIN E8 [get_ports pmod2_pin3]
set_property PACKAGE_PIN D8 [get_ports pmod2_pin4]
set_property PACKAGE_PIN E10 [get_ports pmod2_pin7]
set_property PACKAGE_PIN D10 [get_ports pmod2_pin8]
set_property PACKAGE_PIN G12 [get_ports pmod2_pin9]
set_property PACKAGE_PIN F12 [get_ports pmod2_pin10]

set_property IOSTANDARD LVCMOS18 [get_ports pmod2_pin1]
set_property IOSTANDARD LVCMOS18 [get_ports pmod2_pin2]
set_property IOSTANDARD LVCMOS18 [get_ports pmod2_pin3]
set_property IOSTANDARD LVCMOS18 [get_ports pmod2_pin4]
set_property IOSTANDARD LVCMOS18 [get_ports pmod2_pin7]
set_property IOSTANDARD LVCMOS18 [get_ports pmod2_pin8]
set_property IOSTANDARD LVCMOS18 [get_ports pmod2_pin9]
set_property IOSTANDARD LVCMOS18 [get_ports pmod2_pin10]

# PMOD3 Connector (J14)
set_property PACKAGE_PIN F18 [get_ports pmod3_pin1]
set_property PACKAGE_PIN F19 [get_ports pmod3_pin2]
set_property PACKAGE_PIN G17 [get_ports pmod3_pin3]
set_property PACKAGE_PIN F17 [get_ports pmod3_pin4]
set_property PACKAGE_PIN G19 [get_ports pmod3_pin7]
set_property PACKAGE_PIN F20 [get_ports pmod3_pin8]
set_property PACKAGE_PIN C17 [get_ports pmod3_pin9]
set_property PACKAGE_PIN B17 [get_ports pmod3_pin10]

set_property IOSTANDARD LVCMOS18 [get_ports pmod3_pin1]
set_property IOSTANDARD LVCMOS18 [get_ports pmod3_pin2]
set_property IOSTANDARD LVCMOS18 [get_ports pmod3_pin3]
set_property IOSTANDARD LVCMOS18 [get_ports pmod3_pin4]
set_property IOSTANDARD LVCMOS18 [get_ports pmod3_pin7]
set_property IOSTANDARD LVCMOS18 [get_ports pmod3_pin8]
set_property IOSTANDARD LVCMOS18 [get_ports pmod3_pin9]
set_property IOSTANDARD LVCMOS18 [get_ports pmod3_pin10]

# PMOD4 Connector (J15)
set_property PACKAGE_PIN C16 [get_ports pmod4_pin1]
set_property PACKAGE_PIN B16 [get_ports pmod4_pin2]
set_property PACKAGE_PIN B19 [get_ports pmod4_pin3]
set_property PACKAGE_PIN A19 [get_ports pmod4_pin4]
set_property PACKAGE_PIN A17 [get_ports pmod4_pin7]
set_property PACKAGE_PIN A18 [get_ports pmod4_pin8]
set_property PACKAGE_PIN D18 [get_ports pmod4_pin9]
set_property PACKAGE_PIN C18 [get_ports pmod4_pin10]

set_property IOSTANDARD LVCMOS18 [get_ports pmod4_pin1]
set_property IOSTANDARD LVCMOS18 [get_ports pmod4_pin2]
set_property IOSTANDARD LVCMOS18 [get_ports pmod4_pin3]
set_property IOSTANDARD LVCMOS18 [get_ports pmod4_pin4]
set_property IOSTANDARD LVCMOS18 [get_ports pmod4_pin7]
set_property IOSTANDARD LVCMOS18 [get_ports pmod4_pin8]
set_property IOSTANDARD LVCMOS18 [get_ports pmod4_pin9]
set_property IOSTANDARD LVCMOS18 [get_ports pmod4_pin10]


## HDMI Interface
set_property  PACKAGE_PIN  B21  [get_ports hdmio_io_clk]
set_property  PACKAGE_PIN  B20  [get_ports hdmio_io_spdif]
set_property  PACKAGE_PIN  C22  [get_ports hdmio_io_vsync]
set_property  PACKAGE_PIN  C21  [get_ports hdmio_io_hsync]
set_property  PACKAGE_PIN  B22  [get_ports hdmio_io_de]
set_property  PACKAGE_PIN  A20  [get_ports hdmio_io_data[0]]
set_property  PACKAGE_PIN  A22  [get_ports hdmio_io_data[1]]
set_property  PACKAGE_PIN  A23  [get_ports hdmio_io_data[2]]
set_property  PACKAGE_PIN  C26  [get_ports hdmio_io_data[3]]
set_property  PACKAGE_PIN  B26  [get_ports hdmio_io_data[4]]
set_property  PACKAGE_PIN  D24  [get_ports hdmio_io_data[5]]
set_property  PACKAGE_PIN  C24  [get_ports hdmio_io_data[6]]
set_property  PACKAGE_PIN  D23  [get_ports hdmio_io_data[7]]
set_property  PACKAGE_PIN  C23  [get_ports hdmio_io_data[8]]
set_property  PACKAGE_PIN  B24  [get_ports hdmio_io_data[9]]
set_property  PACKAGE_PIN  B25  [get_ports hdmio_io_data[10]]
set_property  PACKAGE_PIN  D25  [get_ports hdmio_io_data[11]]
set_property  PACKAGE_PIN  D26  [get_ports hdmio_io_data[12]]
set_property  PACKAGE_PIN  E23  [get_ports hdmio_io_data[13]]
set_property  PACKAGE_PIN  A24  [get_ports hdmio_io_data[14]]
set_property  PACKAGE_PIN  A25  [get_ports hdmio_io_data[15]]
set_property  PACKAGE_PIN  D21  [get_ports iic_scl_io]
set_property  PACKAGE_PIN  E22  [get_ports iic_sda_io]
set_property  PACKAGE_PIN  E21  [get_ports hdmio_io_int]
set_property  PACKAGE_PIN  E20  [get_ports hdmio_io_spdifout]

set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_clk]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_spdif]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_vsync]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_hsync]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_de]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[0]]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[1]]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[2]]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[3]]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[4]]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[5]]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[6]]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[7]]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[8]]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[9]]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[10]]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[11]]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[12]]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[13]]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[14]]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_data[15]]
set_property  IOSTANDARD LVCMOS18 [get_ports iic_scl_io]
set_property  IOSTANDARD LVCMOS18 [get_ports iic_sda_io]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_int]
set_property  IOSTANDARD LVCMOS18 [get_ports hdmio_io_spdifout]

set_property SLEW SLOW [get_ports {iic_scl_io}]
set_property DRIVE 8 [get_ports {iic_scl_io}]

set_property SLEW SLOW [get_ports {iic_sda_io}]
set_property DRIVE 8 [get_ports {iic_sda_io}]


# LVDS Touch Panel Interface
set_property  PACKAGE_PIN  W8   [get_ports CLK_N]
set_property  PACKAGE_PIN  W9   [get_ports CLK_P]
set_property  PACKAGE_PIN  AA9  [get_ports TP_D0_N]
set_property  PACKAGE_PIN  AA10 [get_ports TP_D0_P]
set_property  PACKAGE_PIN  Y10  [get_ports TP_D1_N]
set_property  PACKAGE_PIN  Y11  [get_ports TP_D1_P]
set_property  PACKAGE_PIN  AA8  [get_ports TP_D2_N]
set_property  PACKAGE_PIN  Y8   [get_ports TP_D2_P]
set_property  PACKAGE_PIN  V11  [get_ports TP_D3_N]
set_property  PACKAGE_PIN  V12  [get_ports TP_D3_P]
set_property  PACKAGE_PIN  W11  [get_ports TP_IRQ#]
set_property  PACKAGE_PIN  Y12  [get_ports TP_SCL]
set_property  PACKAGE_PIN  W10  [get_ports TP_SDA]

set_property  IOSTANDARD LVDS_25 [get_ports CLK_N]
set_property  IOSTANDARD LVDS_25 [get_ports CLK_P]
set_property  IOSTANDARD LVDS_25 [get_ports TP_D0_N]
set_property  IOSTANDARD LVDS_25 [get_ports TP_D0_P]
set_property  IOSTANDARD LVDS_25 [get_ports TP_D1_N]
set_property  IOSTANDARD LVDS_25 [get_ports TP_D1_P]
set_property  IOSTANDARD LVDS_25 [get_ports TP_D2_N]
set_property  IOSTANDARD LVDS_25 [get_ports TP_D2_P]
set_property  IOSTANDARD LVDS_25 [get_ports TP_D3_N]
set_property  IOSTANDARD LVDS_25 [get_ports TP_D3_P]
set_property  IOSTANDARD LVCMOS25 [get_ports TP_IRQ#]
set_property  IOSTANDARD LVCMOS25 [get_ports TP_SCL]
set_property  IOSTANDARD LVCMOS25 [get_ports TP_SDA]


# LVDS Programmable Clock Generator (CDCM61002)
set_property  PACKAGE_PIN M5   [get_ports LVDS_CLK0_N]
set_property  PACKAGE_PIN M6   [get_ports LVDS_CLK0_P]
set_property  PACKAGE_PIN P5   [get_ports LVDS_CLK1_N]
set_property  PACKAGE_PIN P6   [get_ports LVDS_CLK1_P]

set_property  IOSTANDARD LVDS [get_ports LVDS_CLK0_N]
set_property  IOSTANDARD LVDS [get_ports LVDS_CLK0_P]
set_property  IOSTANDARD LVDS [get_ports LVDS_CLK1_N]
set_property  IOSTANDARD LVDS [get_ports LVDS_CLK1_P]


# SFP+ Interfaces
set_property  PACKAGE_PIN M2   	  [get_ports SFP1_RX_N]
set_property  PACKAGE_PIN M1   	  [get_ports SFP1_RX_P]
set_property  PACKAGE_PIN N3   	  [get_ports SFP1_TX_N]
set_property  PACKAGE_PIN N4   	  [get_ports SFP1_TX_P]
set_property  PACKAGE_PIN AD26    [get_ports SFP1_RX_LOS]
set_property  PACKAGE_PIN AE26    [get_ports SFP1_SCL]
set_property  PACKAGE_PIN AF23    [get_ports SFP1_SDA]
set_property  PACKAGE_PIN AF24    [get_ports SFP1_TX_DISABLE]
set_property  IOSTANDARD LVCMOS25 [get_ports SFP1_RX_LOS]
set_property  IOSTANDARD LVCMOS25 [get_ports SFP1_SCL]
set_property  IOSTANDARD LVCMOS25 [get_ports SFP1_SDA]
set_property  IOSTANDARD LVCMOS25 [get_ports SFP1_TX_DISABLE]

set_property  PACKAGE_PIN K2      [get_ports SFP2_RX_N]
set_property  PACKAGE_PIN K1      [get_ports SFP2_RX_P]
set_property  PACKAGE_PIN L3      [get_ports SFP2_TX_N]
set_property  PACKAGE_PIN L4      [get_ports SFP2_TX_P]
set_property  PACKAGE_PIN AD25    [get_ports SFP2_RX_LOS]
set_property  PACKAGE_PIN AC22    [get_ports SFP2_SCL]
set_property  PACKAGE_PIN AD23    [get_ports SFP2_SDA]
set_property  PACKAGE_PIN AE23    [get_ports SFP2_TX_DISABLE]
set_property  IOSTANDARD LVCMOS25 [get_ports SFP2_RX_LOS]
set_property  IOSTANDARD LVCMOS25 [get_ports SFP2_SCL]
set_property  IOSTANDARD LVCMOS25 [get_ports SFP2_SDA]
set_property  IOSTANDARD LVCMOS25 [get_ports SFP2_TX_DISABLE]


# GTH SMA Connectors
set_property  PACKAGE_PIN H1   [get_ports SMA1_RX_N]
set_property  PACKAGE_PIN H2   [get_ports SMA1_RX_P]
set_property  PACKAGE_PIN J3   [get_ports SMA1_TX_N]
set_property  PACKAGE_PIN J4   [get_ports SMA1_TX_P]
set_property  PACKAGE_PIN F1   [get_ports SMA2_RX_N]
set_property  PACKAGE_PIN F2   [get_ports SMA2_RX_P]
set_property  PACKAGE_PIN G3   [get_ports SMA2_TX_N]
set_property  PACKAGE_PIN G4   [get_ports SMA2_TX_P]


# PMBus Interface
set_property  PACKAGE_PIN  Y13  [get_ports pwr_scl_io]
set_property  PACKAGE_PIN  AD10  [get_ports pwr_sda_io]
set_property  PACKAGE_PIN  AE13  [get_ports pwr_tmon]

set_property  IOSTANDARD LVCMOS25 [get_ports pwr_scl_io]
set_property  IOSTANDARD LVCMOS25 [get_ports pwr_sda_io]
set_property  IOSTANDARD LVCMOS25 [get_ports pwr_tmon]

set_property SLEW SLOW [get_ports {pwr_scl_io}]
set_property DRIVE 8 [get_ports {pwr_scl_io}]

set_property SLEW SLOW [get_ports {pwr_sda_io}]
set_property DRIVE 8 [get_ports {pwr_sda_io}]


