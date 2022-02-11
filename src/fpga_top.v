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

reg r_CS;
reg r_Write;
reg r_Read;
reg [7:0] r_Address;
reg [7:0] r_Data_i;
reg [3:0] r_STRB;
wire      w_ack;

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
assign devlink1  = 1'b0;
assign devlink2  = 1'b0;
assign devlink3  = 1'b0;
assign devlink4  = 1'b0;
assign devlink5  = 1'b0;
assign devlink6  = 1'b0;
assign devlink7  = 1'b0;
assign devlink8  = 1'b0;
assign devlink9  = 1'b0;

always @(posedge mclock) begin
  if (mreset) begin
    r_CS      <= 1'b0;
    r_Write   <= 1'b0;
    r_Read    <= 1'b0;
    r_Address <= 8'h00;
    r_Data_i  <= 8'h00;
    r_state   <= 8'h01;
  end else begin
    case (r_state)
      8'h01 : begin
        r_CS      <= 1'b0;
        r_Write   <= 1'b0;
        r_Read    <= 1'b0;
        r_Address <= 8'h00;
        r_Data_i  <= 8'h00;
        r_state   <= r_state + 8'h01;
      end
      8'h02 : begin
        r_CS      <= 1'b1;
        r_Write   <= 1'b1;
        r_Read    <= 1'b0;
        r_Address <= 8'h00;
        r_Data_i  <= 8'h01;
        r_state   <= r_state + 8'h01;
      end
      8'h03 : begin
        r_CS      <= 1'b0;
        r_Write   <= 1'b0;
        r_Read    <= 1'b0;
        r_Address <= 8'h00;
        r_Data_i  <= 8'h00;
        r_state   <= r_state + 8'h01;
      end
      8'h04 : begin
        r_CS      <= 1'b1;
        r_Write   <= 1'b1;
        r_Read    <= 1'b0;
        r_Address <= 8'h01;
        r_Data_i  <= 8'h02;
        r_state   <= r_state + 8'h01;
      end
      8'h05 : begin
        r_CS      <= 1'b0;
        r_Write   <= 1'b0;
        r_Read    <= 1'b0;
        r_Address <= 8'h00;
        r_Data_i  <= 8'h00;
        r_state   <= r_state + 8'h01;
      end
      8'h06 : begin
        r_CS      <= 1'b1;
        r_Write   <= 1'b1;
        r_Read    <= 1'b0;
        r_Address <= 8'h02;
        r_Data_i  <= 8'h03;
        r_state   <= r_state + 8'h01;
      end
      8'h07 : begin
        r_CS      <= 1'b0;
        r_Write   <= 1'b0;
        r_Read    <= 1'b0;
        r_Address <= 8'h00;
        r_Data_i  <= 8'h00;
        r_state   <= r_state + 8'h01;
      end
      8'h08 : begin
        r_CS      <= 1'b1;
        r_Write   <= 1'b1;
        r_Read    <= 1'b0;
        r_Address <= 8'h03;
        r_Data_i  <= 8'h04;
        r_state   <= r_state + 8'h01;
      end
      8'h09 : begin
        r_CS      <= 1'b0;
        r_Write   <= 1'b0;
        r_Read    <= 1'b0;
        r_Address <= 8'h00;
        r_Data_i  <= 8'h00;
        r_state   <= r_state + 8'h01;
      end
      8'h0A : begin
        r_CS      <= 1'b1;
        r_Write   <= 1'b1;
        r_Read    <= 1'b0;
        r_Address <= 8'h04;
        r_Data_i  <= 8'h05;
        r_state   <= r_state + 8'h01;
      end
      8'h0B : begin
        r_CS      <= 1'b0;
        r_Write   <= 1'b0;
        r_Read    <= 1'b0;
        r_Address <= 8'h00;
        r_Data_i  <= 8'h00;
        r_state   <= r_state + 8'h01;
      end
      8'h0C : begin
        r_CS      <= 1'b1;
        r_Write   <= 1'b1;
        r_Read    <= 1'b0;
        r_Address <= 8'h05;
        r_Data_i  <= 8'h06;
        r_state   <= r_state + 8'h01;
      end
      8'h0D : begin
        r_CS      <= 1'b0;
        r_Write   <= 1'b0;
        r_Read    <= 1'b0;
        r_Address <= 8'h00;
        r_Data_i  <= 8'h00;
        r_state   <= r_state + 8'h01;
      end
      8'h0E : begin
        r_CS      <= 1'b1;
        r_Write   <= 1'b1;
        r_Read    <= 1'b0;
        r_Address <= 8'h06;
        r_Data_i  <= 8'h07;
        r_state   <= r_state + 8'h01;
      end
      8'h0F : begin
        r_CS      <= 1'b0;
        r_Write   <= 1'b0;
        r_Read    <= 1'b0;
        r_Address <= 8'h00;
        r_Data_i  <= 8'h00;
        r_state   <= r_state + 8'h01;
      end
    endcase
  end
end

dotmatrix dotmatrix_u(
  .mclock(mclock),     // input 
  .mreset(mreset),     // input 
  .CS(r_CS),           // input 
  .Write(r_Write),     // input 
  .Read(r_Read),       // input 
  .Address(r_Address), // input [7:0]
  .Data_i(r_Data_i),   // input [7:0]
  .STRB(r_STRB),       // input [3:0]
  .Data_o(),           // output [7:0]
  .ack(w_ack),              // output 
  .Row(led_a),              // output [7:0]
  .Col(led_k)               // output [7:0]
);


endmodule