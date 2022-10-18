`timescale 1ns / 1ps

module fpga_top(
  // A/Dコンバータ
  input  ad_dout,
  output ad_din,
  output ad_cs,
  output ad_sclk,
  // UART
  output uart_tx,
  input  uart_rx,
  // 7seg
  output seg_si,
  output seg_rck,
  output seg_sck,
  output seg_a_en,
  output seg_b_en,
  // VGA出力
  output vga_rd,
  output vga_gr,
  output vga_bl,
  output vga_hsync,
  output vga_vsync,
  // 拡張入出力
  inout  io1,
  inout  io2,
  inout  io3,
  inout  io4,
  inout  io5,
  inout  io6,
  // LED出力
  output led1,
  output led2,
  // SW入力
  input  sw,
  // リセット入力
  input  reset1,
  input  reset2,
  // ドットマトリクスLED
  output [7:0] led_a,
  output [7:0] led_k,
  // メモリカード
  output mem_sclk,
  inout  mem_cmd,
  inout  mem_dat0,
  inout  mem_dat1,
  inout  mem_dat2,
  inout  mem_dat3,
  // フォトカプラ出力
  output pc_out1,
  output pc_out2,
  output pc_out3,
  output pc_out4,
  output pc_out5,
  output pc_out6,
  output pc_out7,
  output pc_out8,
  output pc_out9,
  output pc_out10,
  output pc_out11,
  output pc_out12,
  // デバイス間通信
  inout  devlink0,
  inout  devlink1,
  inout  devlink2,
  inout  devlink3,
  inout  devlink4,
  inout  devlink5,
  inout  devlink6,
  inout  devlink7,
  inout  devlink8,
  inout  devlink9,
  // クロック入力
  input  clock
);

assign ad_din    = ad_dout;
assign ad_cs     = 1'b0;
assign ad_sclk   = 1'b0;
assign uart_tx   = uart_rx;
assign seg_si    = 1'b0;
assign seg_rck   = 1'b0;
assign seg_sck   = 1'b0;
assign seg_a_en  = 1'b0;
assign seg_b_en  = 1'b0;
assign vga_rd    = 1'b0;
assign vga_gr    = 1'b0;
assign vga_bl    = 1'b0;
assign vga_hsync = 1'b0;
assign vga_vsync = 1'b0;
assign io1       = 1'b0;
assign io2       = 1'b0;
assign io3       = 1'b0;
assign io4       = 1'b0;
assign io5       = 1'b0;
assign io6       = 1'b0;
assign led1      = sw;
assign led2      = reset1 || reset2;
assign mem_sclk  = mem_cmd || mem_dat3 || mem_dat2 || mem_dat1 || mem_dat0;
assign pc_out1   = 1'b0;
assign pc_out2   = 1'b0;
assign pc_out3   = 1'b0;
assign pc_out4   = 1'b0;
assign pc_out5   = 1'b0;
assign pc_out6   = 1'b0;
assign pc_out7   = 1'b0;
assign pc_out8   = 1'b0;
assign pc_out9   = 1'b0;
assign pc_out10  = 1'b0;
assign pc_out11  = 1'b0;
assign pc_out12  = 1'b0;
assign devlink0  = clock;
assign devlink1  = sw;
assign devlink2  = 1'b0;
assign devlink3  = 1'b0;
assign devlink4  = 1'b0;
assign devlink5  = 1'b0;
assign devlink6  = 1'b0;
assign devlink7  = 1'b0;
assign devlink8  = 1'b0;
assign devlink9  = 1'b0;

endmodule