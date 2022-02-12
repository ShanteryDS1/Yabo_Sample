`timescale 1ns / 1ps

module dotmatrix(
  input            mclock,
  input            mreset,
  input            CS,
  input            Write,
  input            Read,
  input      [7:0] Address,
  input      [7:0] Data_i,
  input      [3:0] STRB,
  output reg [7:0] Data_o,
  output reg       ack,
  output     [7:0] Row,
  output     [7:0] Col

);

reg [7:0] image_mem [0:7];
reg [7:0] r_state;
reg [11:0] r_disp_tick_count;
reg        r_disp_tick;
reg [ 2:0] r_disp_row;
reg [ 7:0] r_wait_time_100us;

localparam DISP_TICK  = 12'd2500; // 25MHz
localparam DISP_TIME  = 8'd35; // 0.1ms 60
localparam BLANK_TIME = 8'd1;  // 0.1ms
localparam DISP_ROW   = 3'd7;

localparam ST_IDLE = 8'h1;
localparam ST_GET  = 8'h2;
localparam ST_DISP = 8'h3;
localparam ST_NEXT = 8'h4;

localparam TRUE  = 1'b1;
localparam FALSE = 1'b0;

assign Col = image_mem[r_disp_row];
assign Row = ~((r_state == ST_DISP) ? 8'h01 << r_disp_row : 8'd00);

always @(posedge mclock) begin
  if (mreset) begin
    
  end else begin
    if (CS && Write) begin
      image_mem[Address] <= Data_i;
      Data_o             <= 8'hxx;
      ack                <= TRUE;
    end else begin
      if (CS && Read) begin
        Data_o <= image_mem[Address];
        ack    <= TRUE;
      end else begin
        Data_o <= 8'hxx;
        ack    <= FALSE;
      end
    end
  end
end

always @(posedge mclock) begin
  if (mreset) begin
    r_disp_tick_count <= 12'd0;
    r_disp_tick       <= FALSE;
  end else begin
    if (r_disp_tick_count != DISP_TICK) begin
      r_disp_tick_count <= r_disp_tick_count + 12'd1;
      r_disp_tick       <= FALSE;
    end else begin
      r_disp_tick_count <= 12'd0;
      r_disp_tick       <= TRUE;
    end
  end
end

always @(posedge mclock) begin
  if (mreset) begin
    r_state           <= ST_IDLE;
    r_wait_time_100us <= 8'd0;
    r_disp_row        <= 3'd0;
  end else begin
    case (r_state)
      ST_IDLE : begin
        if (r_disp_tick) begin
          if (r_wait_time_100us != BLANK_TIME) begin
            r_state           <= r_state;
            r_wait_time_100us <= r_wait_time_100us + 8'd1;
          end else begin
            r_state           <= ST_GET;
            r_wait_time_100us <= 8'dx;
          end
        end else begin
          r_state           <= r_state;
          r_wait_time_100us <= r_wait_time_100us;
        end
        r_disp_row <= r_disp_row;
      end

      ST_GET : begin
        r_state           <= ST_DISP;
        r_wait_time_100us <= 8'd0;
        r_disp_row <= r_disp_row;
      end

      ST_DISP : begin
        if (r_disp_tick) begin
          if (r_wait_time_100us != DISP_TIME) begin
            r_state           <= r_state;
            r_wait_time_100us <= r_wait_time_100us + 8'd1;
          end else begin
            r_state           <= ST_NEXT;
            r_wait_time_100us <= 8'dx;
          end
        end else begin
          r_state           <= r_state;
          r_wait_time_100us <= r_wait_time_100us;
        end
        r_disp_row <= r_disp_row;
      end

      ST_NEXT : begin
        if (r_disp_row != DISP_ROW) begin
          r_disp_row <= r_disp_row + 3'd1;
        end else begin
          r_disp_row <= 3'd0;
        end
        r_state <= ST_IDLE;
        r_wait_time_100us <= 8'd0;
      end

      default : begin
        r_state           <= ST_IDLE;
        r_wait_time_100us <= 8'd0;
        r_disp_row        <= 3'd0;
      end
    endcase
  end
end

endmodule