`timescale 1ns / 1ps

module fpga_top(
  // LED出力
  output [7:0] led,
  // リセット入力
  input        reset,
  // クロック入力
  input        clock,
  // EEPROM
  output       eeprom_cs,
  output       eeprom_cclk,
  output       eeprom_so,
  input        eeprom_si,
  // Ethernet
  inout        eth_mdio,
  inout        eth_mdc,
  inout [ 3:0] eth_rxd,
  inout        eth_rx_dv,
  inout        eth_rx_clk,
  inout        eth_rx_er,
  inout        eth_tx_clk,
  inout        eth_tx_en,
  inout [ 3:0] eth_txd,
  inout        eth_col,
  inout        eth_crs,
  inout        eth_tx_er,
  // デバイス間通信
  inout        devlink0,
  inout        devlink1,
  inout        devlink2,
  inout        devlink3,
  inout        devlink4,
  inout        devlink5,
  inout        devlink6,
  inout        devlink7,
  inout        devlink8,
  inout        devlink9,
  // DDR
  inout        ddr2_odt1,
  inout        ddr2_odt0,
  inout        ddr2_s1_n,
  inout        ddr2_s0_n,
  inout        ddr2_cke1,
  inout        ddr2_cke0,
  inout        ddr2_cas_n,
  inout        ddr2_ras_n,
  inout        ddr2_we_n,
  inout        ddr2_dqs0,
  inout        ddr2_dqs0_n,
  inout        ddr2_dqs1,
  inout        ddr2_dqs1_n,
  inout        ddr2_dqs2,
  inout        ddr2_dqs2_n,
  inout        ddr2_dqs3,
  inout        ddr2_dqs3_n,
  inout        ddr2_dm0,
  inout        ddr2_dm1,
  inout        ddr2_dm2,
  inout        ddr2_dm3,
  inout [13:0] ddr2_a,
  inout [31:0] ddr2_dq,
  inout        ddr2_ck1,
  inout        ddr2_ck1_n,
  inout        ddr2_ck0,
  inout        ddr2_ck0_n,
  inout        ddr2_ba2,
  inout        ddr2_ba1,
  inout        ddr2_ba0,
  inout        ddr2_scl,
  inout        ddr2_sda
);

  assign led[0]   = devlink0;
  assign led[1]   = devlink1;
  assign led[2]   = devlink2;
  assign led[3]   = devlink3;
  assign led[4]   = devlink4;
  assign led[5]   = devlink5;
  assign led[6]   = devlink6;
  assign led[7]   = devlink7;
  assign devlink8 = 1'bz;
  assign devlink9 = 1'bz;
  
  assign eeprom_cs    = reset;
  assign eeprom_cclk  = clock;
  assign eeprom_so    = eeprom_si;
  assign eth_mdio     = 1'bz;
  assign eth_mdc      = 1'bz;
  assign eth_rxd      = 4'bzzzz;
  assign eth_txd      = 4'bzzzz;
  assign eth_rx_dv    = 1'bz;
  assign eth_rx_clk   = 1'bz;
  assign eth_rx_er    = 1'bz;
  assign eth_tx_clk   = 1'bz;
  assign eth_tx_en    = 1'bz;
  assign eth_col      = 1'bz;
  assign eth_crs      = 1'bz;
  assign eth_tx_er    = 1'bz;
  assign ddr2_odt1    = 1'bz;
  assign ddr2_odt0    = 1'bz;
  assign ddr2_a       = 14'bzzzzzzzzzzzzzz;
  assign ddr2_dq      = 32'hzzzz_zzzz;
  assign ddr2_s1_n    = 1'bz;
  assign ddr2_s0_n    = 1'bz;
  assign ddr2_cke1    = 1'bz;
  assign ddr2_cke0    = 1'bz;
  assign ddr2_cas_n   = 1'bz;
  assign ddr2_ras_n   = 1'bz;
  assign ddr2_we_n    = 1'bz;
  assign ddr2_dqs0    = 1'bz;
  assign ddr2_dqs0_n  = 1'bz;
  assign ddr2_dqs1    = 1'bz;
  assign ddr2_dqs1_n  = 1'bz;
  assign ddr2_dqs2    = 1'bz;
  assign ddr2_dqs2_n  = 1'bz;
  assign ddr2_dqs3    = 1'bz;
  assign ddr2_dqs3_n  = 1'bz;
  assign ddr2_dm0     = 1'bz;
  assign ddr2_dm1     = 1'bz;
  assign ddr2_dm2     = 1'bz;
  assign ddr2_dm3     = 1'bz;
  assign ddr2_ck1     = 1'bz;
  assign ddr2_ck1_n   = 1'bz;
  assign ddr2_ck0     = 1'bz;
  assign ddr2_ck0_n   = 1'bz;
  assign ddr2_ba2     = 1'bz;
  assign ddr2_ba1     = 1'bz;
  assign ddr2_ba0     = 1'bz;
  assign ddr2_scl     = 1'bz;
  assign ddr2_sda     = 1'bz;
  
endmodule