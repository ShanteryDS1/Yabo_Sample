`timescale 1ns / 1ps

module tb_dotmatrix;

reg mclock;
reg mreset;

reg r_CS;
reg r_Write;
reg r_Read;
reg [7:0] r_Address;
reg [7:0] r_Data_i;
reg [3:0] r_STRB;
wire      w_ack;

// 20MHz-> 50ns
// 25MHz-> 40ns

task busWrite(
  input [ 7:0] address,
  input [ 7:0] data
);
  begin
    @(posedge mclock);
    r_Address = address;
    r_Data_i  = data;
    r_CS      = 1'b1;
    r_Write   = 1'b1;
    @(posedge mclock);
    @(w_ack);
    @(posedge mclock);
    r_Data_i  = 8'hxx;
    r_CS      = 1'b0;
    r_Write   = 1'b0;
    @(posedge mclock);
    @(w_ack);
    @(posedge mclock);
  end
endtask

initial begin
  mclock    = 1'b0;
  mreset    = 1'b0;
  r_CS      = 1'b0;
  r_Write   = 1'b0;
  r_Read    = 1'b0;
  r_Address = 8'h00;
  r_Data_i  = 8'h00;
  r_STRB    = 4'b0000;
  dotmatrix_u.image_mem[0] = 8'h01;
  dotmatrix_u.image_mem[1] = 8'h02;
  dotmatrix_u.image_mem[2] = 8'h03;
  dotmatrix_u.image_mem[3] = 8'h04;
  dotmatrix_u.image_mem[4] = 8'h05;
  dotmatrix_u.image_mem[5] = 8'h06;
  dotmatrix_u.image_mem[6] = 8'h07;
  dotmatrix_u.image_mem[7] = 8'h08;
  #(2000);
  mreset = 1'b1;
  #(2000);
  mreset = 1'b0;
  #(20000);
  busWrite(0, 8'hFF);
  busWrite(1, 8'hFE);
  busWrite(2, 8'hFD);
  busWrite(3, 8'hFC);
  busWrite(4, 8'hFB);
  busWrite(5, 8'hFA);
  busWrite(6, 8'hF9);
  busWrite(7, 8'hF8);
  #(20000);
  $stop;
end

always begin
  #(20);
  mclock = ~mclock;
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
  .Row(),              // output [7:0]
  .Col()               // output [7:0]
);

endmodule