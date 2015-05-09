//Legal Notice: (C)2011 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module vga_controller (
                        // inputs:
                         clk,
                         master_data_valid,
                         master_readdata,
                         master_waitrequest,
                         reset_n,
                         slave_address,
                         slave_chipselect,
                         slave_write,
                         slave_writedata,
                         vga_clk,

                        // outputs:
                         B,
                         G,
                         M1,
                         M2,
                         R,
                         blank_n,
                         hsync,
                         master_address,
                         master_read,
                         slave_readdata,
                         sync_n,
                         sync_t,
                         vsync
                      )
;

  output  [  7: 0] B;
  output  [  7: 0] G;
  output           M1;
  output           M2;
  output  [  7: 0] R;
  output           blank_n;
  output           hsync;
  output  [ 31: 0] master_address;
  output           master_read;
  output  [ 31: 0] slave_readdata;
  output           sync_n;
  output           sync_t;
  output           vsync;
  input            clk;
  input            master_data_valid;
  input   [ 31: 0] master_readdata;
  input            master_waitrequest;
  input            reset_n;
  input   [  1: 0] slave_address;
  input            slave_chipselect;
  input            slave_write;
  input   [ 31: 0] slave_writedata;
  input            vga_clk;

  reg     [  7: 0] B;
  reg     [  7: 0] G;
  wire             M1;
  reg              M2;
  reg     [  7: 0] R;
  wire    [ 31: 0] address_counter;
  wire             address_counter_incr;
  wire             address_counter_sload;
  wire    [ 29: 0] address_counter_temp;
  reg              blank_n;
  wire    [  9: 0] column_counter;
  wire    [  2: 0] config_counter;
  wire             ctrl_reg_go_bit;
  reg     [ 31: 0] current_dma;
  wire             display_active;
  reg     [ 31: 0] dma_modulus_reg;
  reg     [ 31: 0] dma_source_reg;
  wire             empty_the_fifo;
  wire    [ 31: 0] fifo_data_in;
  wire    [ 31: 0] fifo_data_out;
  reg              fifo_emptied;
  reg              fifo_has_data;
  reg              fifo_has_data_reg1;
  reg              fifo_has_room;
  reg              fifo_has_room_reg1;
  wire             fifo_rdempty;
  wire             fifo_read_req;
  wire    [ 11: 0] fifo_used;
  wire             fifo_write_clk;
  wire             fifo_write_req;
  reg              go_bit;
  reg              go_bit_vga;
  reg              go_bit_vga_reg1;
  reg              hblank;
  wire             hsync;
  wire             hsync_temp;
  reg     [ 31: 0] last_dma_addr_reg;
  wire    [ 31: 0] master_address;
  wire             master_read;
  reg              mux_toggle;
  wire             read_16b;
  wire    [  9: 0] row_counter;
  reg     [ 31: 0] slave_control_reg;
  wire    [ 31: 0] slave_readdata;
  wire             stop_config_counter;
  reg              sync_n;
  reg              sync_n_init;
  reg              sync_t;
  reg              vblank;
  wire    [ 15: 0] vga_16bit_out;
  reg              vga_start;
  wire             vsync;
  wire             vsync_temp;
  dcfifo the_dcfifo
    (
      .aclr (!reset_n),
      .data (fifo_data_in),
      .q (fifo_data_out),
      .rdclk (vga_clk),
      .rdempty (fifo_rdempty),
      .rdreq (fifo_read_req),
      .wrclk (fifo_write_clk),
      .wrreq (fifo_write_req),
      .wrusedw (fifo_used)
    );

  defparam the_dcfifo.LPM_NUMWORDS = 4096,
           the_dcfifo.LPM_SHOWAHEAD = "ON",
           the_dcfifo.LPM_WIDTH = 32;

  assign fifo_write_clk = clk;
  assign fifo_data_in = master_readdata;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_has_room_reg1 <= 0;
      else 
        fifo_has_room_reg1 <= fifo_used < 3584;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_has_room <= 0;
      else 
        fifo_has_room <= fifo_has_room_reg1;
    end


  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_has_data_reg1 <= 0;
      else 
        fifo_has_data_reg1 <= fifo_used > 2048;
    end


  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_has_data <= 0;
      else 
        fifo_has_data <= fifo_has_data_reg1;
    end


  lpm_counter dma_address_counter
    (
      .aclr (!reset_n),
      .clock (clk),
      .cnt_en (address_counter_incr),
      .data (dma_source_reg[31 : 2]),
      .q (address_counter_temp),
      .sload (address_counter_sload)
    );

  defparam dma_address_counter.LPM_WIDTH = 30;

  assign address_counter_incr = (master_read == 1) && (master_waitrequest == 0) && (go_bit == 1);
  assign address_counter_sload = (go_bit == 0) ||(address_counter_incr && (address_counter == last_dma_addr_reg));
  assign address_counter = {address_counter_temp, 2'b00};
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_dma_addr_reg <= 0;
      else if (address_counter_sload)
          last_dma_addr_reg <= dma_source_reg + dma_modulus_reg - 4;
    end


  lpm_counter vga_column_counter
    (
      .aclr (!reset_n),
      .clock (vga_clk),
      .cnt_en (vga_start),
      .q (column_counter),
      .sclr (!vga_start)
    );

  defparam vga_column_counter.LPM_MODULUS = 800,
           vga_column_counter.LPM_WIDTH = 10;

  lpm_counter vga_row_counter
    (
      .aclr (!reset_n),
      .clock (vga_clk),
      .cnt_en (vga_start && (column_counter == (800 - 1))),
      .q (row_counter),
      .sclr (!vga_start)
    );

  defparam vga_row_counter.LPM_MODULUS = 524,
           vga_row_counter.LPM_WIDTH = 10;

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          go_bit <= 0;
      else 
        go_bit <= ctrl_reg_go_bit & stop_config_counter & fifo_emptied;
    end


  assign stop_config_counter = config_counter == 3'b101;
  lpm_counter vga_config_counter
    (
      .aclr (!reset_n),
      .clock (vga_clk),
      .cnt_en (!stop_config_counter),
      .q (config_counter)
    );

  defparam vga_config_counter.LPM_WIDTH = 3;

  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sync_n_init <= 0;
      else 
        sync_n_init <= config_counter[2] | (config_counter[0] & !config_counter[1]);
    end


  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          M2 <= 0;
      else 
        M2 <= config_counter[1];
    end


  assign M1 = 0;
  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_emptied <= 0;
      else 
        fifo_emptied <= ctrl_reg_go_bit & (fifo_emptied | fifo_rdempty);
    end


  assign empty_the_fifo = !fifo_emptied;
  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          go_bit_vga_reg1 <= 0;
      else 
        go_bit_vga_reg1 <= go_bit;
    end


  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          go_bit_vga <= 0;
      else 
        go_bit_vga <= go_bit_vga_reg1;
    end


  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_start <= 0;
      else 
        vga_start <= (vga_start & go_bit_vga) | (fifo_has_data & go_bit_vga);
    end


  assign vga_16bit_out = mux_toggle ? fifo_data_out[31 : 16] : fifo_data_out[15 : 0];
  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          mux_toggle <= 0;
      else 
        mux_toggle <= (!mux_toggle) & (read_16b);
    end


  assign fifo_read_req = (mux_toggle & read_16b) | empty_the_fifo;
  assign read_16b = hblank & vblank;
  assign display_active = read_16b;
  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          R <= 0;
      else 
        R <= display_active ? ({vga_16bit_out[15 : 11], 3'b111}) : 8'b00000000;
    end


  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          G <= 0;
      else 
        G <= display_active ? ({vga_16bit_out[10 : 5], 2'b11}) : 8'b00000000;
    end


  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          B <= 0;
      else 
        B <= display_active ? ({vga_16bit_out[4 : 0], 3'b111}) : 8'b00000000;
    end


  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sync_n <= 0;
      else 
        sync_n <= vga_start ? (vsync_temp ~^ hsync_temp) : sync_n_init;
    end


  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sync_t <= 0;
      else 
        sync_t <= vga_start ? 0 : 0;
    end


  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          blank_n <= 0;
      else 
        blank_n <= display_active;
    end


  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vblank <= 0;
      else 
        vblank <= (row_counter >= (33)) && (row_counter < (513));
    end


  assign vsync_temp = (row_counter >= (2)) && (row_counter < (524));
  lpm_shiftreg vsync_delay
    (
      .aclr (!reset_n),
      .clock (vga_clk),
      .shiftin (vsync_temp),
      .shiftout (vsync)
    );

  defparam vsync_delay.LPM_WIDTH = 8;

  always @(posedge vga_clk or negedge reset_n)
    begin
      if (reset_n == 0)
          hblank <= 0;
      else 
        hblank <= (column_counter >= (144)) && (column_counter < (784));
    end


  assign hsync_temp = (column_counter >= (96)) && (column_counter < (800));
  lpm_shiftreg hsync_delay
    (
      .aclr (!reset_n),
      .clock (vga_clk),
      .shiftin (hsync_temp),
      .shiftout (hsync)
    );

  defparam hsync_delay.LPM_WIDTH = 8;

  assign slave_readdata = ((slave_address == 0))? slave_control_reg :
    ((slave_address == 1))? dma_source_reg :
    ((slave_address == 2))? dma_modulus_reg :
    ((slave_address == 3))? current_dma :
    slave_control_reg;

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          slave_control_reg <= 0;
      else if (slave_write && slave_chipselect && (slave_address == 0))
          slave_control_reg <= slave_writedata;
    end


  assign ctrl_reg_go_bit = slave_control_reg[0];
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dma_source_reg <= 0;
      else if (slave_write && slave_chipselect && (slave_address == 1))
          dma_source_reg <= slave_writedata;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dma_modulus_reg <= 0;
      else if (slave_write && slave_chipselect && (slave_address == 2))
          dma_modulus_reg <= slave_writedata;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          current_dma <= 0;
      else if (address_counter_sload)
          current_dma <= dma_source_reg;
    end


  assign master_address = address_counter;
  assign master_read = fifo_has_room & go_bit;
  assign fifo_write_req = master_data_valid & go_bit;
  //s1, which is an e_avalon_slave
  //m1, which is an e_avalon_master

endmodule

