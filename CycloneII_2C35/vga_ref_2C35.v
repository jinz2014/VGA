//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


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

module clocks_avalon_clocks_slave_arbitrator (
                                               // inputs:
                                                clk,
                                                clocks_avalon_clocks_slave_readdata,
                                                reset_n,
                                                vga_ref_2C35_clock_0_out_address_to_slave,
                                                vga_ref_2C35_clock_0_out_read,
                                                vga_ref_2C35_clock_0_out_write,

                                               // outputs:
                                                clocks_avalon_clocks_slave_address,
                                                clocks_avalon_clocks_slave_readdata_from_sa,
                                                d1_clocks_avalon_clocks_slave_end_xfer,
                                                vga_ref_2C35_clock_0_out_granted_clocks_avalon_clocks_slave,
                                                vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave,
                                                vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave,
                                                vga_ref_2C35_clock_0_out_requests_clocks_avalon_clocks_slave
                                             )
;

  output           clocks_avalon_clocks_slave_address;
  output  [  7: 0] clocks_avalon_clocks_slave_readdata_from_sa;
  output           d1_clocks_avalon_clocks_slave_end_xfer;
  output           vga_ref_2C35_clock_0_out_granted_clocks_avalon_clocks_slave;
  output           vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave;
  output           vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave;
  output           vga_ref_2C35_clock_0_out_requests_clocks_avalon_clocks_slave;
  input            clk;
  input   [  7: 0] clocks_avalon_clocks_slave_readdata;
  input            reset_n;
  input            vga_ref_2C35_clock_0_out_address_to_slave;
  input            vga_ref_2C35_clock_0_out_read;
  input            vga_ref_2C35_clock_0_out_write;

  wire             clocks_avalon_clocks_slave_address;
  wire             clocks_avalon_clocks_slave_allgrants;
  wire             clocks_avalon_clocks_slave_allow_new_arb_cycle;
  wire             clocks_avalon_clocks_slave_any_bursting_master_saved_grant;
  wire             clocks_avalon_clocks_slave_any_continuerequest;
  wire             clocks_avalon_clocks_slave_arb_counter_enable;
  reg              clocks_avalon_clocks_slave_arb_share_counter;
  wire             clocks_avalon_clocks_slave_arb_share_counter_next_value;
  wire             clocks_avalon_clocks_slave_arb_share_set_values;
  wire             clocks_avalon_clocks_slave_beginbursttransfer_internal;
  wire             clocks_avalon_clocks_slave_begins_xfer;
  wire             clocks_avalon_clocks_slave_end_xfer;
  wire             clocks_avalon_clocks_slave_firsttransfer;
  wire             clocks_avalon_clocks_slave_grant_vector;
  wire             clocks_avalon_clocks_slave_in_a_read_cycle;
  wire             clocks_avalon_clocks_slave_in_a_write_cycle;
  wire             clocks_avalon_clocks_slave_master_qreq_vector;
  wire             clocks_avalon_clocks_slave_non_bursting_master_requests;
  wire    [  7: 0] clocks_avalon_clocks_slave_readdata_from_sa;
  reg              clocks_avalon_clocks_slave_reg_firsttransfer;
  reg              clocks_avalon_clocks_slave_slavearbiterlockenable;
  wire             clocks_avalon_clocks_slave_slavearbiterlockenable2;
  wire             clocks_avalon_clocks_slave_unreg_firsttransfer;
  wire             clocks_avalon_clocks_slave_waits_for_read;
  wire             clocks_avalon_clocks_slave_waits_for_write;
  reg              d1_clocks_avalon_clocks_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_clocks_avalon_clocks_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register;
  wire             vga_ref_2C35_clock_0_out_arbiterlock;
  wire             vga_ref_2C35_clock_0_out_arbiterlock2;
  wire             vga_ref_2C35_clock_0_out_continuerequest;
  wire             vga_ref_2C35_clock_0_out_granted_clocks_avalon_clocks_slave;
  wire             vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave;
  wire             vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave;
  reg              vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register;
  wire             vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register_in;
  wire             vga_ref_2C35_clock_0_out_requests_clocks_avalon_clocks_slave;
  wire             vga_ref_2C35_clock_0_out_saved_grant_clocks_avalon_clocks_slave;
  wire             wait_for_clocks_avalon_clocks_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~clocks_avalon_clocks_slave_end_xfer;
    end


  assign clocks_avalon_clocks_slave_begins_xfer = ~d1_reasons_to_wait & ((vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave));
  //assign clocks_avalon_clocks_slave_readdata_from_sa = clocks_avalon_clocks_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clocks_avalon_clocks_slave_readdata_from_sa = clocks_avalon_clocks_slave_readdata;

  assign vga_ref_2C35_clock_0_out_requests_clocks_avalon_clocks_slave = ((1) & (vga_ref_2C35_clock_0_out_read | vga_ref_2C35_clock_0_out_write)) & vga_ref_2C35_clock_0_out_read;
  //clocks_avalon_clocks_slave_arb_share_counter set values, which is an e_mux
  assign clocks_avalon_clocks_slave_arb_share_set_values = 1;

  //clocks_avalon_clocks_slave_non_bursting_master_requests mux, which is an e_mux
  assign clocks_avalon_clocks_slave_non_bursting_master_requests = vga_ref_2C35_clock_0_out_requests_clocks_avalon_clocks_slave;

  //clocks_avalon_clocks_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign clocks_avalon_clocks_slave_any_bursting_master_saved_grant = 0;

  //clocks_avalon_clocks_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign clocks_avalon_clocks_slave_arb_share_counter_next_value = clocks_avalon_clocks_slave_firsttransfer ? (clocks_avalon_clocks_slave_arb_share_set_values - 1) : |clocks_avalon_clocks_slave_arb_share_counter ? (clocks_avalon_clocks_slave_arb_share_counter - 1) : 0;

  //clocks_avalon_clocks_slave_allgrants all slave grants, which is an e_mux
  assign clocks_avalon_clocks_slave_allgrants = |clocks_avalon_clocks_slave_grant_vector;

  //clocks_avalon_clocks_slave_end_xfer assignment, which is an e_assign
  assign clocks_avalon_clocks_slave_end_xfer = ~(clocks_avalon_clocks_slave_waits_for_read | clocks_avalon_clocks_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_clocks_avalon_clocks_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_clocks_avalon_clocks_slave = clocks_avalon_clocks_slave_end_xfer & (~clocks_avalon_clocks_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //clocks_avalon_clocks_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign clocks_avalon_clocks_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_clocks_avalon_clocks_slave & clocks_avalon_clocks_slave_allgrants) | (end_xfer_arb_share_counter_term_clocks_avalon_clocks_slave & ~clocks_avalon_clocks_slave_non_bursting_master_requests);

  //clocks_avalon_clocks_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clocks_avalon_clocks_slave_arb_share_counter <= 0;
      else if (clocks_avalon_clocks_slave_arb_counter_enable)
          clocks_avalon_clocks_slave_arb_share_counter <= clocks_avalon_clocks_slave_arb_share_counter_next_value;
    end


  //clocks_avalon_clocks_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clocks_avalon_clocks_slave_slavearbiterlockenable <= 0;
      else if ((|clocks_avalon_clocks_slave_master_qreq_vector & end_xfer_arb_share_counter_term_clocks_avalon_clocks_slave) | (end_xfer_arb_share_counter_term_clocks_avalon_clocks_slave & ~clocks_avalon_clocks_slave_non_bursting_master_requests))
          clocks_avalon_clocks_slave_slavearbiterlockenable <= |clocks_avalon_clocks_slave_arb_share_counter_next_value;
    end


  //vga_ref_2C35_clock_0/out clocks/avalon_clocks_slave arbiterlock, which is an e_assign
  assign vga_ref_2C35_clock_0_out_arbiterlock = clocks_avalon_clocks_slave_slavearbiterlockenable & vga_ref_2C35_clock_0_out_continuerequest;

  //clocks_avalon_clocks_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign clocks_avalon_clocks_slave_slavearbiterlockenable2 = |clocks_avalon_clocks_slave_arb_share_counter_next_value;

  //vga_ref_2C35_clock_0/out clocks/avalon_clocks_slave arbiterlock2, which is an e_assign
  assign vga_ref_2C35_clock_0_out_arbiterlock2 = clocks_avalon_clocks_slave_slavearbiterlockenable2 & vga_ref_2C35_clock_0_out_continuerequest;

  //clocks_avalon_clocks_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign clocks_avalon_clocks_slave_any_continuerequest = 1;

  //vga_ref_2C35_clock_0_out_continuerequest continued request, which is an e_assign
  assign vga_ref_2C35_clock_0_out_continuerequest = 1;

  assign vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave = vga_ref_2C35_clock_0_out_requests_clocks_avalon_clocks_slave & ~((vga_ref_2C35_clock_0_out_read & ((|vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register))));
  //vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register_in = vga_ref_2C35_clock_0_out_granted_clocks_avalon_clocks_slave & vga_ref_2C35_clock_0_out_read & ~clocks_avalon_clocks_slave_waits_for_read & ~(|vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register);

  //shift register p1 vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register = {vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register, vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register_in};

  //vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register <= 0;
      else 
        vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register <= p1_vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register;
    end


  //local readdatavalid vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave, which is an e_mux
  assign vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave = vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave_shift_register;

  //master is always granted when requested
  assign vga_ref_2C35_clock_0_out_granted_clocks_avalon_clocks_slave = vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave;

  //vga_ref_2C35_clock_0/out saved-grant clocks/avalon_clocks_slave, which is an e_assign
  assign vga_ref_2C35_clock_0_out_saved_grant_clocks_avalon_clocks_slave = vga_ref_2C35_clock_0_out_requests_clocks_avalon_clocks_slave;

  //allow new arb cycle for clocks/avalon_clocks_slave, which is an e_assign
  assign clocks_avalon_clocks_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign clocks_avalon_clocks_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign clocks_avalon_clocks_slave_master_qreq_vector = 1;

  //clocks_avalon_clocks_slave_firsttransfer first transaction, which is an e_assign
  assign clocks_avalon_clocks_slave_firsttransfer = clocks_avalon_clocks_slave_begins_xfer ? clocks_avalon_clocks_slave_unreg_firsttransfer : clocks_avalon_clocks_slave_reg_firsttransfer;

  //clocks_avalon_clocks_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign clocks_avalon_clocks_slave_unreg_firsttransfer = ~(clocks_avalon_clocks_slave_slavearbiterlockenable & clocks_avalon_clocks_slave_any_continuerequest);

  //clocks_avalon_clocks_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clocks_avalon_clocks_slave_reg_firsttransfer <= 1'b1;
      else if (clocks_avalon_clocks_slave_begins_xfer)
          clocks_avalon_clocks_slave_reg_firsttransfer <= clocks_avalon_clocks_slave_unreg_firsttransfer;
    end


  //clocks_avalon_clocks_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign clocks_avalon_clocks_slave_beginbursttransfer_internal = clocks_avalon_clocks_slave_begins_xfer;

  //clocks_avalon_clocks_slave_address mux, which is an e_mux
  assign clocks_avalon_clocks_slave_address = vga_ref_2C35_clock_0_out_address_to_slave;

  //d1_clocks_avalon_clocks_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_clocks_avalon_clocks_slave_end_xfer <= 1;
      else 
        d1_clocks_avalon_clocks_slave_end_xfer <= clocks_avalon_clocks_slave_end_xfer;
    end


  //clocks_avalon_clocks_slave_waits_for_read in a cycle, which is an e_mux
  assign clocks_avalon_clocks_slave_waits_for_read = clocks_avalon_clocks_slave_in_a_read_cycle & 0;

  //clocks_avalon_clocks_slave_in_a_read_cycle assignment, which is an e_assign
  assign clocks_avalon_clocks_slave_in_a_read_cycle = vga_ref_2C35_clock_0_out_granted_clocks_avalon_clocks_slave & vga_ref_2C35_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = clocks_avalon_clocks_slave_in_a_read_cycle;

  //clocks_avalon_clocks_slave_waits_for_write in a cycle, which is an e_mux
  assign clocks_avalon_clocks_slave_waits_for_write = clocks_avalon_clocks_slave_in_a_write_cycle & 0;

  //clocks_avalon_clocks_slave_in_a_write_cycle assignment, which is an e_assign
  assign clocks_avalon_clocks_slave_in_a_write_cycle = vga_ref_2C35_clock_0_out_granted_clocks_avalon_clocks_slave & vga_ref_2C35_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = clocks_avalon_clocks_slave_in_a_write_cycle;

  assign wait_for_clocks_avalon_clocks_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //clocks/avalon_clocks_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_read,
                                           cpu_data_master_waitrequest,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_latency_counter,
                                           cpu_instruction_master_read,
                                           cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_reset_n,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_reset_n;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 24: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg     [  2: 0] cpu_jtag_debug_module_arb_share_counter;
  wire    [  2: 0] cpu_jtag_debug_module_arb_share_counter_next_value;
  wire    [  2: 0] cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 24: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 24: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[24 : 11] , 11'b0} == 25'h1880800) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector);

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[24 : 11] , 11'b0} == 25'h1880800) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0) | (|cpu_instruction_master_read_data_valid_sdram_s1_shift_register))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cpu_jtag_debug_module = cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_jtag_debug_module_reset_n = reset_n;

  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     clk,
                                     cpu_data_master_address,
                                     cpu_data_master_byteenable_ext_flash_s1,
                                     cpu_data_master_byteenable_sdram_s1,
                                     cpu_data_master_byteenable_sram_avalon_sram_slave,
                                     cpu_data_master_byteenable_vga_ref_2C35_clock_0_in,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_ext_flash_s1,
                                     cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_granted_sdram_s1,
                                     cpu_data_master_granted_sram_avalon_sram_slave,
                                     cpu_data_master_granted_sys_clk_timer_s1,
                                     cpu_data_master_granted_sysid_control_slave,
                                     cpu_data_master_granted_vga_controller_s1,
                                     cpu_data_master_granted_vga_ref_2C35_clock_0_in,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_ext_flash_s1,
                                     cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_qualified_request_sdram_s1,
                                     cpu_data_master_qualified_request_sram_avalon_sram_slave,
                                     cpu_data_master_qualified_request_sys_clk_timer_s1,
                                     cpu_data_master_qualified_request_sysid_control_slave,
                                     cpu_data_master_qualified_request_vga_controller_s1,
                                     cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_ext_flash_s1,
                                     cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_read_data_valid_sdram_s1,
                                     cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                     cpu_data_master_read_data_valid_sram_avalon_sram_slave,
                                     cpu_data_master_read_data_valid_sram_avalon_sram_slave_shift_register,
                                     cpu_data_master_read_data_valid_sys_clk_timer_s1,
                                     cpu_data_master_read_data_valid_sysid_control_slave,
                                     cpu_data_master_read_data_valid_vga_controller_s1,
                                     cpu_data_master_read_data_valid_vga_ref_2C35_clock_0_in,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_ext_flash_s1,
                                     cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_requests_sdram_s1,
                                     cpu_data_master_requests_sram_avalon_sram_slave,
                                     cpu_data_master_requests_sys_clk_timer_s1,
                                     cpu_data_master_requests_sysid_control_slave,
                                     cpu_data_master_requests_vga_controller_s1,
                                     cpu_data_master_requests_vga_ref_2C35_clock_0_in,
                                     cpu_data_master_write,
                                     cpu_data_master_writedata,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                     d1_sdram_s1_end_xfer,
                                     d1_sram_avalon_sram_slave_end_xfer,
                                     d1_sys_clk_timer_s1_end_xfer,
                                     d1_sysid_control_slave_end_xfer,
                                     d1_tri_state_bridge_avalon_slave_end_xfer,
                                     d1_vga_controller_s1_end_xfer,
                                     d1_vga_ref_2C35_clock_0_in_end_xfer,
                                     ext_flash_s1_wait_counter_eq_0,
                                     ext_flash_s1_wait_counter_eq_1,
                                     incoming_tri_state_bridge_data_with_Xs_converted_to_0,
                                     jtag_uart_avalon_jtag_slave_irq_from_sa,
                                     jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                     jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                     registered_cpu_data_master_read_data_valid_ext_flash_s1,
                                     reset_n,
                                     sdram_s1_readdata_from_sa,
                                     sdram_s1_waitrequest_from_sa,
                                     sram_avalon_sram_slave_readdata_from_sa,
                                     sys_clk_timer_s1_irq_from_sa,
                                     sys_clk_timer_s1_readdata_from_sa,
                                     sysid_control_slave_readdata_from_sa,
                                     vga_controller_s1_readdata_from_sa,
                                     vga_ref_2C35_clock_0_in_readdata_from_sa,
                                     vga_ref_2C35_clock_0_in_waitrequest_from_sa,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_dbs_address,
                                     cpu_data_master_dbs_write_16,
                                     cpu_data_master_dbs_write_8,
                                     cpu_data_master_irq,
                                     cpu_data_master_no_byte_enables_and_last_term,
                                     cpu_data_master_readdata,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 24: 0] cpu_data_master_address_to_slave;
  output  [  1: 0] cpu_data_master_dbs_address;
  output  [ 15: 0] cpu_data_master_dbs_write_16;
  output  [  7: 0] cpu_data_master_dbs_write_8;
  output  [ 31: 0] cpu_data_master_irq;
  output           cpu_data_master_no_byte_enables_and_last_term;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_data_master_address;
  input            cpu_data_master_byteenable_ext_flash_s1;
  input   [  1: 0] cpu_data_master_byteenable_sdram_s1;
  input   [  1: 0] cpu_data_master_byteenable_sram_avalon_sram_slave;
  input            cpu_data_master_byteenable_vga_ref_2C35_clock_0_in;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_ext_flash_s1;
  input            cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_granted_sdram_s1;
  input            cpu_data_master_granted_sram_avalon_sram_slave;
  input            cpu_data_master_granted_sys_clk_timer_s1;
  input            cpu_data_master_granted_sysid_control_slave;
  input            cpu_data_master_granted_vga_controller_s1;
  input            cpu_data_master_granted_vga_ref_2C35_clock_0_in;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_ext_flash_s1;
  input            cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_qualified_request_sdram_s1;
  input            cpu_data_master_qualified_request_sram_avalon_sram_slave;
  input            cpu_data_master_qualified_request_sys_clk_timer_s1;
  input            cpu_data_master_qualified_request_sysid_control_slave;
  input            cpu_data_master_qualified_request_vga_controller_s1;
  input            cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_ext_flash_s1;
  input            cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_read_data_valid_sdram_s1;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_read_data_valid_sram_avalon_sram_slave;
  input            cpu_data_master_read_data_valid_sram_avalon_sram_slave_shift_register;
  input            cpu_data_master_read_data_valid_sys_clk_timer_s1;
  input            cpu_data_master_read_data_valid_sysid_control_slave;
  input            cpu_data_master_read_data_valid_vga_controller_s1;
  input            cpu_data_master_read_data_valid_vga_ref_2C35_clock_0_in;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_ext_flash_s1;
  input            cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_requests_sdram_s1;
  input            cpu_data_master_requests_sram_avalon_sram_slave;
  input            cpu_data_master_requests_sys_clk_timer_s1;
  input            cpu_data_master_requests_sysid_control_slave;
  input            cpu_data_master_requests_vga_controller_s1;
  input            cpu_data_master_requests_vga_ref_2C35_clock_0_in;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_jtag_uart_avalon_jtag_slave_end_xfer;
  input            d1_sdram_s1_end_xfer;
  input            d1_sram_avalon_sram_slave_end_xfer;
  input            d1_sys_clk_timer_s1_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            d1_tri_state_bridge_avalon_slave_end_xfer;
  input            d1_vga_controller_s1_end_xfer;
  input            d1_vga_ref_2C35_clock_0_in_end_xfer;
  input            ext_flash_s1_wait_counter_eq_0;
  input            ext_flash_s1_wait_counter_eq_1;
  input   [  7: 0] incoming_tri_state_bridge_data_with_Xs_converted_to_0;
  input            jtag_uart_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  input            registered_cpu_data_master_read_data_valid_ext_flash_s1;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;
  input   [ 15: 0] sram_avalon_sram_slave_readdata_from_sa;
  input            sys_clk_timer_s1_irq_from_sa;
  input   [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;
  input   [ 31: 0] vga_controller_s1_readdata_from_sa;
  input   [  7: 0] vga_ref_2C35_clock_0_in_readdata_from_sa;
  input            vga_ref_2C35_clock_0_in_waitrequest_from_sa;

  wire    [ 24: 0] cpu_data_master_address_to_slave;
  reg     [  1: 0] cpu_data_master_dbs_address;
  wire    [  1: 0] cpu_data_master_dbs_increment;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [  7: 0] cpu_data_master_dbs_write_8;
  wire    [ 31: 0] cpu_data_master_irq;
  reg              cpu_data_master_no_byte_enables_and_last_term;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_run;
  reg              cpu_data_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_0;
  reg     [  7: 0] dbs_8_reg_segment_1;
  reg     [  7: 0] dbs_8_reg_segment_2;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  wire             last_dbs_term_and_run;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_8_reg_segment_2;
  wire    [ 31: 0] p1_registered_cpu_data_master_readdata;
  wire             pre_dbs_count_enable;
  wire             r_0;
  wire             r_1;
  reg     [ 31: 0] registered_cpu_data_master_readdata;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~cpu_data_master_requests_jtag_uart_avalon_jtag_slave) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_sdram_s1 | (cpu_data_master_read_data_valid_sdram_s1 & cpu_data_master_dbs_address[1]) | (cpu_data_master_write & !cpu_data_master_byteenable_sdram_s1 & cpu_data_master_dbs_address[1]) | ~cpu_data_master_requests_sdram_s1) & (cpu_data_master_granted_sdram_s1 | ~cpu_data_master_qualified_request_sdram_s1) & ((~cpu_data_master_qualified_request_sdram_s1 | ~cpu_data_master_read | (cpu_data_master_read_data_valid_sdram_s1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sdram_s1 | ~cpu_data_master_write | (1 & ~sdram_s1_waitrequest_from_sa & (cpu_data_master_dbs_address[1]) & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_sram_avalon_sram_slave | (cpu_data_master_read_data_valid_sram_avalon_sram_slave & cpu_data_master_dbs_address[1]) | (cpu_data_master_write & !cpu_data_master_byteenable_sram_avalon_sram_slave & cpu_data_master_dbs_address[1]) | ~cpu_data_master_requests_sram_avalon_sram_slave) & ((~cpu_data_master_qualified_request_sram_avalon_sram_slave | ~cpu_data_master_read | (cpu_data_master_read_data_valid_sram_avalon_sram_slave & (cpu_data_master_dbs_address[1]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sram_avalon_sram_slave | ~cpu_data_master_write | (1 & (cpu_data_master_dbs_address[1]) & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_sys_clk_timer_s1 | ~cpu_data_master_requests_sys_clk_timer_s1);

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_data_master_qualified_request_sys_clk_timer_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sys_clk_timer_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sysid_control_slave | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & ((cpu_data_master_qualified_request_ext_flash_s1 | (registered_cpu_data_master_read_data_valid_ext_flash_s1 & cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0]) | ((cpu_data_master_write & !cpu_data_master_byteenable_ext_flash_s1 & cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0])) | ~cpu_data_master_requests_ext_flash_s1)) & (cpu_data_master_granted_ext_flash_s1 | ~cpu_data_master_qualified_request_ext_flash_s1) & ((~cpu_data_master_qualified_request_ext_flash_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_ext_flash_s1 & (cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_ext_flash_s1 | ~cpu_data_master_write | (1 & ext_flash_s1_wait_counter_eq_1 & (cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0]) & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_vga_controller_s1 | ~cpu_data_master_requests_vga_controller_s1) & ((~cpu_data_master_qualified_request_vga_controller_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_vga_controller_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & ((cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in | ((cpu_data_master_write & !cpu_data_master_byteenable_vga_ref_2C35_clock_0_in & cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0])) | ~cpu_data_master_requests_vga_ref_2C35_clock_0_in)) & ((~cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in | ~cpu_data_master_read | (1 & ~vga_ref_2C35_clock_0_in_waitrequest_from_sa & (cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in | ~cpu_data_master_write | (1 & ~vga_ref_2C35_clock_0_in_waitrequest_from_sa & (cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0]) & cpu_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[24 : 0];

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~cpu_data_master_requests_cpu_jtag_debug_module}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_jtag_uart_avalon_jtag_slave}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_sdram_s1}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_sram_avalon_sram_slave}} | registered_cpu_data_master_readdata) &
    ({32 {~cpu_data_master_requests_sys_clk_timer_s1}} | sys_clk_timer_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_sysid_control_slave}} | sysid_control_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_ext_flash_s1}} | {incoming_tri_state_bridge_data_with_Xs_converted_to_0[7 : 0],
    dbs_8_reg_segment_2,
    dbs_8_reg_segment_1,
    dbs_8_reg_segment_0}) &
    ({32 {~cpu_data_master_requests_vga_controller_s1}} | vga_controller_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_vga_ref_2C35_clock_0_in}} | registered_cpu_data_master_readdata);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_waitrequest <= ~0;
      else 
        cpu_data_master_waitrequest <= ~((~(cpu_data_master_read | cpu_data_master_write))? 0: (cpu_data_master_run & cpu_data_master_waitrequest));
    end


  //unpredictable registered wait state incoming data, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          registered_cpu_data_master_readdata <= 0;
      else 
        registered_cpu_data_master_readdata <= p1_registered_cpu_data_master_readdata;
    end


  //registered readdata mux, which is an e_mux
  assign p1_registered_cpu_data_master_readdata = ({32 {~cpu_data_master_requests_jtag_uart_avalon_jtag_slave}} | jtag_uart_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_sdram_s1}} | {sdram_s1_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_data_master_requests_sram_avalon_sram_slave}} | {sram_avalon_sram_slave_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_data_master_requests_vga_ref_2C35_clock_0_in}} | {vga_ref_2C35_clock_0_in_readdata_from_sa[7 : 0],
    dbs_8_reg_segment_2,
    dbs_8_reg_segment_1,
    dbs_8_reg_segment_0});

  //irq assign, which is an e_assign
  assign cpu_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    jtag_uart_avalon_jtag_slave_irq_from_sa,
    sys_clk_timer_s1_irq_from_sa};

  //no_byte_enables_and_last_term, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_no_byte_enables_and_last_term <= 0;
      else 
        cpu_data_master_no_byte_enables_and_last_term <= last_dbs_term_and_run;
    end


  //compute the last dbs term, which is an e_mux
  assign last_dbs_term_and_run = (cpu_data_master_requests_sdram_s1)? (((cpu_data_master_dbs_address == 2'b10) & cpu_data_master_write & !cpu_data_master_byteenable_sdram_s1)) :
    (cpu_data_master_requests_sram_avalon_sram_slave)? (((cpu_data_master_dbs_address == 2'b10) & cpu_data_master_write & !cpu_data_master_byteenable_sram_avalon_sram_slave)) :
    (cpu_data_master_requests_ext_flash_s1)? (((cpu_data_master_dbs_address == 2'b11) & cpu_data_master_write & !cpu_data_master_byteenable_ext_flash_s1)) :
    (((cpu_data_master_dbs_address == 2'b11) & cpu_data_master_write & !cpu_data_master_byteenable_vga_ref_2C35_clock_0_in));

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~cpu_data_master_no_byte_enables_and_last_term) & cpu_data_master_requests_sdram_s1 & cpu_data_master_write & !cpu_data_master_byteenable_sdram_s1)) |
    cpu_data_master_read_data_valid_sdram_s1 |
    (cpu_data_master_granted_sdram_s1 & cpu_data_master_write & 1 & 1 & ~sdram_s1_waitrequest_from_sa) |
    (((~cpu_data_master_no_byte_enables_and_last_term) & cpu_data_master_requests_sram_avalon_sram_slave & cpu_data_master_write & !cpu_data_master_byteenable_sram_avalon_sram_slave)) |
    cpu_data_master_read_data_valid_sram_avalon_sram_slave |
    (cpu_data_master_granted_sram_avalon_sram_slave & cpu_data_master_write & 1 & 1) |
    (((~cpu_data_master_no_byte_enables_and_last_term) & cpu_data_master_requests_ext_flash_s1 & cpu_data_master_write & !cpu_data_master_byteenable_ext_flash_s1)) |
    cpu_data_master_read_data_valid_ext_flash_s1 |
    ((cpu_data_master_granted_ext_flash_s1 & cpu_data_master_write & 1 & 1 & ({ext_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_avalon_slave_end_xfer}))) |
    (((~cpu_data_master_no_byte_enables_and_last_term) & cpu_data_master_requests_vga_ref_2C35_clock_0_in & cpu_data_master_write & !cpu_data_master_byteenable_vga_ref_2C35_clock_0_in)) |
    (cpu_data_master_granted_vga_ref_2C35_clock_0_in & cpu_data_master_read & 1 & 1 & ~vga_ref_2C35_clock_0_in_waitrequest_from_sa) |
    (cpu_data_master_granted_vga_ref_2C35_clock_0_in & cpu_data_master_write & 1 & 1 & ~vga_ref_2C35_clock_0_in_waitrequest_from_sa);

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = (cpu_data_master_requests_sdram_s1)? sdram_s1_readdata_from_sa :
    sram_avalon_sram_slave_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_data_master_dbs_write_16 = (cpu_data_master_dbs_address[1])? cpu_data_master_writedata[31 : 16] :
    (~(cpu_data_master_dbs_address[1]))? cpu_data_master_writedata[15 : 0] :
    (cpu_data_master_dbs_address[1])? cpu_data_master_writedata[31 : 16] :
    cpu_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign cpu_data_master_dbs_increment = (cpu_data_master_requests_sdram_s1)? 2 :
    (cpu_data_master_requests_sram_avalon_sram_slave)? 2 :
    (cpu_data_master_requests_ext_flash_s1)? 1 :
    (cpu_data_master_requests_vga_ref_2C35_clock_0_in)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_data_master_dbs_address + cpu_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable &
    (~(cpu_data_master_requests_sdram_s1 & ~cpu_data_master_waitrequest)) &
    (~(cpu_data_master_requests_sram_avalon_sram_slave & ~cpu_data_master_waitrequest)) &
    (~(cpu_data_master_requests_vga_ref_2C35_clock_0_in & ~cpu_data_master_waitrequest));

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_data_master_dbs_address <= next_dbs_address;
    end


  //input to dbs-8 stored 0, which is an e_mux
  assign p1_dbs_8_reg_segment_0 = (cpu_data_master_requests_ext_flash_s1)? incoming_tri_state_bridge_data_with_Xs_converted_to_0 :
    vga_ref_2C35_clock_0_in_readdata_from_sa;

  //dbs register for dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_data_master_dbs_address[1 : 0]) == 0))
          dbs_8_reg_segment_0 <= p1_dbs_8_reg_segment_0;
    end


  //input to dbs-8 stored 1, which is an e_mux
  assign p1_dbs_8_reg_segment_1 = (cpu_data_master_requests_ext_flash_s1)? incoming_tri_state_bridge_data_with_Xs_converted_to_0 :
    vga_ref_2C35_clock_0_in_readdata_from_sa;

  //dbs register for dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_1 <= 0;
      else if (dbs_count_enable & ((cpu_data_master_dbs_address[1 : 0]) == 1))
          dbs_8_reg_segment_1 <= p1_dbs_8_reg_segment_1;
    end


  //input to dbs-8 stored 2, which is an e_mux
  assign p1_dbs_8_reg_segment_2 = (cpu_data_master_requests_ext_flash_s1)? incoming_tri_state_bridge_data_with_Xs_converted_to_0 :
    vga_ref_2C35_clock_0_in_readdata_from_sa;

  //dbs register for dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_8_reg_segment_2 <= 0;
      else if (dbs_count_enable & ((cpu_data_master_dbs_address[1 : 0]) == 2))
          dbs_8_reg_segment_2 <= p1_dbs_8_reg_segment_2;
    end


  //mux write dbs 2, which is an e_mux
  assign cpu_data_master_dbs_write_8 = ((cpu_data_master_dbs_address[1 : 0] == 0))? cpu_data_master_writedata[7 : 0] :
    ((cpu_data_master_dbs_address[1 : 0] == 1))? cpu_data_master_writedata[15 : 8] :
    ((cpu_data_master_dbs_address[1 : 0] == 2))? cpu_data_master_writedata[23 : 16] :
    ((cpu_data_master_dbs_address[1 : 0] == 3))? cpu_data_master_writedata[31 : 24] :
    ((cpu_data_master_dbs_address[1 : 0] == 0))? cpu_data_master_writedata[7 : 0] :
    ((cpu_data_master_dbs_address[1 : 0] == 1))? cpu_data_master_writedata[15 : 8] :
    ((cpu_data_master_dbs_address[1 : 0] == 2))? cpu_data_master_writedata[23 : 16] :
    cpu_data_master_writedata[31 : 24];


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_ext_flash_s1,
                                            cpu_instruction_master_granted_sdram_s1,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_ext_flash_s1,
                                            cpu_instruction_master_qualified_request_sdram_s1,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_ext_flash_s1,
                                            cpu_instruction_master_read_data_valid_sdram_s1,
                                            cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_ext_flash_s1,
                                            cpu_instruction_master_requests_sdram_s1,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_sdram_s1_end_xfer,
                                            d1_tri_state_bridge_avalon_slave_end_xfer,
                                            ext_flash_s1_wait_counter_eq_0,
                                            ext_flash_s1_wait_counter_eq_1,
                                            incoming_tri_state_bridge_data,
                                            reset_n,
                                            sdram_s1_readdata_from_sa,
                                            sdram_s1_waitrequest_from_sa,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_dbs_address,
                                            cpu_instruction_master_latency_counter,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_readdatavalid,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 24: 0] cpu_instruction_master_address_to_slave;
  output  [  1: 0] cpu_instruction_master_dbs_address;
  output  [  1: 0] cpu_instruction_master_latency_counter;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_readdatavalid;
  output           cpu_instruction_master_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_ext_flash_s1;
  input            cpu_instruction_master_granted_sdram_s1;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_ext_flash_s1;
  input            cpu_instruction_master_qualified_request_sdram_s1;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_ext_flash_s1;
  input            cpu_instruction_master_read_data_valid_sdram_s1;
  input            cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_ext_flash_s1;
  input            cpu_instruction_master_requests_sdram_s1;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_sdram_s1_end_xfer;
  input            d1_tri_state_bridge_avalon_slave_end_xfer;
  input            ext_flash_s1_wait_counter_eq_0;
  input            ext_flash_s1_wait_counter_eq_1;
  input   [  7: 0] incoming_tri_state_bridge_data;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 24: 0] cpu_instruction_master_address_last_time;
  wire    [ 24: 0] cpu_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_instruction_master_dbs_address;
  wire    [  1: 0] cpu_instruction_master_dbs_increment;
  reg     [  1: 0] cpu_instruction_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_instruction_master_dbs_rdv_counter_inc;
  wire             cpu_instruction_master_is_granted_some_slave;
  reg     [  1: 0] cpu_instruction_master_latency_counter;
  wire    [  1: 0] cpu_instruction_master_next_dbs_rdv_counter;
  reg              cpu_instruction_master_read_but_no_slave_selected;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  reg     [  7: 0] dbs_latent_8_reg_segment_0;
  reg     [  7: 0] dbs_latent_8_reg_segment_1;
  reg     [  7: 0] dbs_latent_8_reg_segment_2;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  1: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  1: 0] p1_cpu_instruction_master_latency_counter;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_2;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_instruction_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_sdram_s1 | ~cpu_instruction_master_requests_sdram_s1) & (cpu_instruction_master_granted_sdram_s1 | ~cpu_instruction_master_qualified_request_sdram_s1) & ((~cpu_instruction_master_qualified_request_sdram_s1 | ~cpu_instruction_master_read | (1 & ~sdram_s1_waitrequest_from_sa & (cpu_instruction_master_dbs_address[1]) & cpu_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (cpu_instruction_master_qualified_request_ext_flash_s1 | ~cpu_instruction_master_requests_ext_flash_s1) & (cpu_instruction_master_granted_ext_flash_s1 | ~cpu_instruction_master_qualified_request_ext_flash_s1) & ((~cpu_instruction_master_qualified_request_ext_flash_s1 | ~cpu_instruction_master_read | (1 & ((ext_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_avalon_slave_end_xfer)) & (cpu_instruction_master_dbs_address[1] & cpu_instruction_master_dbs_address[0]) & cpu_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = cpu_instruction_master_address[24 : 0];

  //cpu_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_instruction_master_read_but_no_slave_selected <= cpu_instruction_master_read & cpu_instruction_master_run & ~cpu_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_instruction_master_is_granted_some_slave = cpu_instruction_master_granted_cpu_jtag_debug_module |
    cpu_instruction_master_granted_sdram_s1 |
    cpu_instruction_master_granted_ext_flash_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_instruction_master_readdatavalid = (cpu_instruction_master_read_data_valid_sdram_s1 & dbs_rdv_counter_overflow) |
    (cpu_instruction_master_read_data_valid_ext_flash_s1 & dbs_rdv_counter_overflow);

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_instruction_master_readdatavalid = cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_data_valid_cpu_jtag_debug_module |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid;

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~(cpu_instruction_master_qualified_request_cpu_jtag_debug_module & cpu_instruction_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_instruction_master_read_data_valid_sdram_s1}} | {sdram_s1_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~cpu_instruction_master_read_data_valid_ext_flash_s1}} | {incoming_tri_state_bridge_data[7 : 0],
    dbs_latent_8_reg_segment_2,
    dbs_latent_8_reg_segment_1,
    dbs_latent_8_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_latency_counter <= 0;
      else 
        cpu_instruction_master_latency_counter <= p1_cpu_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_instruction_master_latency_counter = ((cpu_instruction_master_run & cpu_instruction_master_read))? latency_load_value :
    (cpu_instruction_master_latency_counter)? cpu_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {2 {cpu_instruction_master_requests_ext_flash_s1}} & 2;

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = sdram_s1_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_instruction_master_dbs_increment = (cpu_instruction_master_requests_sdram_s1)? 2 :
    (cpu_instruction_master_requests_ext_flash_s1)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_instruction_master_dbs_address + cpu_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_instruction_master_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign cpu_instruction_master_next_dbs_rdv_counter = cpu_instruction_master_dbs_rdv_counter + cpu_instruction_master_dbs_rdv_counter_inc;

  //cpu_instruction_master_rdv_inc_mux, which is an e_mux
  assign cpu_instruction_master_dbs_rdv_counter_inc = (cpu_instruction_master_read_data_valid_sdram_s1)? 2 :
    1;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_instruction_master_read_data_valid_sdram_s1 |
    cpu_instruction_master_read_data_valid_ext_flash_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_instruction_master_dbs_rdv_counter <= cpu_instruction_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_instruction_master_dbs_rdv_counter[1] & ~cpu_instruction_master_next_dbs_rdv_counter[1];

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (cpu_instruction_master_granted_sdram_s1 & cpu_instruction_master_read & 1 & 1 & ~sdram_s1_waitrequest_from_sa) |
    ((cpu_instruction_master_granted_ext_flash_s1 & cpu_instruction_master_read & 1 & 1 & ({ext_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_avalon_slave_end_xfer})));

  //input to latent dbs-8 stored 0, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_0 = incoming_tri_state_bridge_data;

  //dbs register for latent dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1 : 0]) == 0))
          dbs_latent_8_reg_segment_0 <= p1_dbs_latent_8_reg_segment_0;
    end


  //input to latent dbs-8 stored 1, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_1 = incoming_tri_state_bridge_data;

  //dbs register for latent dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_1 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1 : 0]) == 1))
          dbs_latent_8_reg_segment_1 <= p1_dbs_latent_8_reg_segment_1;
    end


  //input to latent dbs-8 stored 2, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_2 = incoming_tri_state_bridge_data;

  //dbs register for latent dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_2 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1 : 0]) == 2))
          dbs_latent_8_reg_segment_2 <= p1_dbs_latent_8_reg_segment_2;
    end



//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else 
        cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else 
        cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_avalon_jtag_slave_arbitrator (
                                                // inputs:
                                                 clk,
                                                 cpu_data_master_address_to_slave,
                                                 cpu_data_master_read,
                                                 cpu_data_master_waitrequest,
                                                 cpu_data_master_write,
                                                 cpu_data_master_writedata,
                                                 jtag_uart_avalon_jtag_slave_dataavailable,
                                                 jtag_uart_avalon_jtag_slave_irq,
                                                 jtag_uart_avalon_jtag_slave_readdata,
                                                 jtag_uart_avalon_jtag_slave_readyfordata,
                                                 jtag_uart_avalon_jtag_slave_waitrequest,
                                                 reset_n,

                                                // outputs:
                                                 cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                                 d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                                 jtag_uart_avalon_jtag_slave_address,
                                                 jtag_uart_avalon_jtag_slave_chipselect,
                                                 jtag_uart_avalon_jtag_slave_dataavailable_from_sa,
                                                 jtag_uart_avalon_jtag_slave_irq_from_sa,
                                                 jtag_uart_avalon_jtag_slave_read_n,
                                                 jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_readyfordata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_reset_n,
                                                 jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                                 jtag_uart_avalon_jtag_slave_write_n,
                                                 jtag_uart_avalon_jtag_slave_writedata
                                              )
;

  output           cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  output           d1_jtag_uart_avalon_jtag_slave_end_xfer;
  output           jtag_uart_avalon_jtag_slave_address;
  output           jtag_uart_avalon_jtag_slave_chipselect;
  output           jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_avalon_jtag_slave_reset_n;
  output           jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            jtag_uart_avalon_jtag_slave_dataavailable;
  input            jtag_uart_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  input            jtag_uart_avalon_jtag_slave_readyfordata;
  input            jtag_uart_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave;
  reg              d1_jtag_uart_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_allgrants;
  wire             jtag_uart_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_avalon_jtag_slave_arb_counter_enable;
  reg     [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_counter;
  wire    [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  reg              jtag_uart_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [ 24: 0] shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master;
  wire             wait_for_jtag_uart_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave));
  //assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata;

  assign cpu_data_master_requests_jtag_uart_avalon_jtag_slave = ({cpu_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h1881030) & (cpu_data_master_read | cpu_data_master_write);
  //assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest;

  //jtag_uart_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_non_bursting_master_requests = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_avalon_jtag_slave_firsttransfer ? (jtag_uart_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_avalon_jtag_slave_arb_share_counter ? (jtag_uart_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_allgrants = |jtag_uart_avalon_jtag_slave_grant_vector;

  //jtag_uart_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_end_xfer = ~(jtag_uart_avalon_jtag_slave_waits_for_read | jtag_uart_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave = jtag_uart_avalon_jtag_slave_end_xfer & (~jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & jtag_uart_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = jtag_uart_avalon_jtag_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //jtag_uart_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_jtag_uart_avalon_jtag_slave = cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;

  //cpu/data_master saved-grant jtag_uart/avalon_jtag_slave, which is an e_assign
  assign cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_avalon_jtag_slave_chipselect = cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  //jtag_uart_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_firsttransfer = jtag_uart_avalon_jtag_slave_begins_xfer ? jtag_uart_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_avalon_jtag_slave_begins_xfer)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_read_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read);

  //~jtag_uart_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_write_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write);

  assign shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //jtag_uart_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_address = shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master >> 2;

  //d1_jtag_uart_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_avalon_jtag_slave_end_xfer <= jtag_uart_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_read = jtag_uart_avalon_jtag_slave_in_a_read_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_read_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_write = jtag_uart_avalon_jtag_slave_in_a_write_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_write_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_sdram_s1_module (
                                                         // inputs:
                                                          clear_fifo,
                                                          clk,
                                                          data_in,
                                                          read,
                                                          reset_n,
                                                          sync_reset,
                                                          write,

                                                         // outputs:
                                                          data_out,
                                                          empty,
                                                          fifo_contains_ones_n,
                                                          full
                                                       )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_instruction_master_to_sdram_s1_module (
                                                                // inputs:
                                                                 clear_fifo,
                                                                 clk,
                                                                 data_in,
                                                                 read,
                                                                 reset_n,
                                                                 sync_reset,
                                                                 write,

                                                                // outputs:
                                                                 data_out,
                                                                 empty,
                                                                 fifo_contains_ones_n,
                                                                 full
                                                              )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_vga_controller_m1_to_sdram_s1_module (
                                                           // inputs:
                                                            clear_fifo,
                                                            clk,
                                                            data_in,
                                                            read,
                                                            reset_n,
                                                            sync_reset,
                                                            write,

                                                           // outputs:
                                                            data_out,
                                                            empty,
                                                            fifo_contains_ones_n,
                                                            full
                                                         )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_s1_arbitrator (
                             // inputs:
                              clk,
                              cpu_data_master_address_to_slave,
                              cpu_data_master_byteenable,
                              cpu_data_master_dbs_address,
                              cpu_data_master_dbs_write_16,
                              cpu_data_master_no_byte_enables_and_last_term,
                              cpu_data_master_read,
                              cpu_data_master_waitrequest,
                              cpu_data_master_write,
                              cpu_instruction_master_address_to_slave,
                              cpu_instruction_master_dbs_address,
                              cpu_instruction_master_latency_counter,
                              cpu_instruction_master_read,
                              reset_n,
                              sdram_s1_readdata,
                              sdram_s1_readdatavalid,
                              sdram_s1_waitrequest,
                              vga_controller_m1_address_to_slave,
                              vga_controller_m1_dbs_address,
                              vga_controller_m1_latency_counter,
                              vga_controller_m1_read,

                             // outputs:
                              cpu_data_master_byteenable_sdram_s1,
                              cpu_data_master_granted_sdram_s1,
                              cpu_data_master_qualified_request_sdram_s1,
                              cpu_data_master_read_data_valid_sdram_s1,
                              cpu_data_master_read_data_valid_sdram_s1_shift_register,
                              cpu_data_master_requests_sdram_s1,
                              cpu_instruction_master_granted_sdram_s1,
                              cpu_instruction_master_qualified_request_sdram_s1,
                              cpu_instruction_master_read_data_valid_sdram_s1,
                              cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
                              cpu_instruction_master_requests_sdram_s1,
                              d1_sdram_s1_end_xfer,
                              sdram_s1_address,
                              sdram_s1_byteenable_n,
                              sdram_s1_chipselect,
                              sdram_s1_read_n,
                              sdram_s1_readdata_from_sa,
                              sdram_s1_reset_n,
                              sdram_s1_waitrequest_from_sa,
                              sdram_s1_write_n,
                              sdram_s1_writedata,
                              vga_controller_m1_granted_sdram_s1,
                              vga_controller_m1_qualified_request_sdram_s1,
                              vga_controller_m1_read_data_valid_sdram_s1,
                              vga_controller_m1_read_data_valid_sdram_s1_shift_register,
                              vga_controller_m1_requests_sdram_s1
                           )
;

  output  [  1: 0] cpu_data_master_byteenable_sdram_s1;
  output           cpu_data_master_granted_sdram_s1;
  output           cpu_data_master_qualified_request_sdram_s1;
  output           cpu_data_master_read_data_valid_sdram_s1;
  output           cpu_data_master_read_data_valid_sdram_s1_shift_register;
  output           cpu_data_master_requests_sdram_s1;
  output           cpu_instruction_master_granted_sdram_s1;
  output           cpu_instruction_master_qualified_request_sdram_s1;
  output           cpu_instruction_master_read_data_valid_sdram_s1;
  output           cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  output           cpu_instruction_master_requests_sdram_s1;
  output           d1_sdram_s1_end_xfer;
  output  [ 21: 0] sdram_s1_address;
  output  [  1: 0] sdram_s1_byteenable_n;
  output           sdram_s1_chipselect;
  output           sdram_s1_read_n;
  output  [ 15: 0] sdram_s1_readdata_from_sa;
  output           sdram_s1_reset_n;
  output           sdram_s1_waitrequest_from_sa;
  output           sdram_s1_write_n;
  output  [ 15: 0] sdram_s1_writedata;
  output           vga_controller_m1_granted_sdram_s1;
  output           vga_controller_m1_qualified_request_sdram_s1;
  output           vga_controller_m1_read_data_valid_sdram_s1;
  output           vga_controller_m1_read_data_valid_sdram_s1_shift_register;
  output           vga_controller_m1_requests_sdram_s1;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [ 15: 0] cpu_data_master_dbs_write_16;
  input            cpu_data_master_no_byte_enables_and_last_term;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 24: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata;
  input            sdram_s1_readdatavalid;
  input            sdram_s1_waitrequest;
  input   [ 31: 0] vga_controller_m1_address_to_slave;
  input   [  1: 0] vga_controller_m1_dbs_address;
  input            vga_controller_m1_latency_counter;
  input            vga_controller_m1_read;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire    [  1: 0] cpu_data_master_byteenable_sdram_s1;
  wire    [  1: 0] cpu_data_master_byteenable_sdram_s1_segment_0;
  wire    [  1: 0] cpu_data_master_byteenable_sdram_s1_segment_1;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sdram_s1;
  wire             cpu_data_master_qualified_request_sdram_s1;
  wire             cpu_data_master_rdv_fifo_empty_sdram_s1;
  wire             cpu_data_master_rdv_fifo_output_from_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_data_master_requests_sdram_s1;
  wire             cpu_data_master_saved_grant_sdram_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_sdram_s1;
  wire             cpu_instruction_master_qualified_request_sdram_s1;
  wire             cpu_instruction_master_rdv_fifo_empty_sdram_s1;
  wire             cpu_instruction_master_rdv_fifo_output_from_sdram_s1;
  wire             cpu_instruction_master_read_data_valid_sdram_s1;
  wire             cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_instruction_master_requests_sdram_s1;
  wire             cpu_instruction_master_saved_grant_sdram_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sdram_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sdram_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_sdram_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_sdram_s1;
  reg              last_cycle_vga_controller_m1_granted_slave_sdram_s1;
  wire    [ 21: 0] sdram_s1_address;
  wire             sdram_s1_allgrants;
  wire             sdram_s1_allow_new_arb_cycle;
  wire             sdram_s1_any_bursting_master_saved_grant;
  wire             sdram_s1_any_continuerequest;
  reg     [  2: 0] sdram_s1_arb_addend;
  wire             sdram_s1_arb_counter_enable;
  reg     [  2: 0] sdram_s1_arb_share_counter;
  wire    [  2: 0] sdram_s1_arb_share_counter_next_value;
  wire    [  2: 0] sdram_s1_arb_share_set_values;
  wire    [  2: 0] sdram_s1_arb_winner;
  wire             sdram_s1_arbitration_holdoff_internal;
  wire             sdram_s1_beginbursttransfer_internal;
  wire             sdram_s1_begins_xfer;
  wire    [  1: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire    [  5: 0] sdram_s1_chosen_master_double_vector;
  wire    [  2: 0] sdram_s1_chosen_master_rot_left;
  wire             sdram_s1_end_xfer;
  wire             sdram_s1_firsttransfer;
  wire    [  2: 0] sdram_s1_grant_vector;
  wire             sdram_s1_in_a_read_cycle;
  wire             sdram_s1_in_a_write_cycle;
  wire    [  2: 0] sdram_s1_master_qreq_vector;
  wire             sdram_s1_move_on_to_next_transaction;
  wire             sdram_s1_non_bursting_master_requests;
  wire             sdram_s1_read_n;
  wire    [ 15: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid_from_sa;
  reg              sdram_s1_reg_firsttransfer;
  wire             sdram_s1_reset_n;
  reg     [  2: 0] sdram_s1_saved_chosen_master_vector;
  reg              sdram_s1_slavearbiterlockenable;
  wire             sdram_s1_slavearbiterlockenable2;
  wire             sdram_s1_unreg_firsttransfer;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_waits_for_read;
  wire             sdram_s1_waits_for_write;
  wire             sdram_s1_write_n;
  wire    [ 15: 0] sdram_s1_writedata;
  wire    [ 24: 0] shifted_address_to_sdram_s1_from_cpu_data_master;
  wire    [ 24: 0] shifted_address_to_sdram_s1_from_cpu_instruction_master;
  wire    [ 31: 0] shifted_address_to_sdram_s1_from_vga_controller_m1;
  wire             vga_controller_m1_arbiterlock;
  wire             vga_controller_m1_arbiterlock2;
  wire             vga_controller_m1_continuerequest;
  wire             vga_controller_m1_granted_sdram_s1;
  wire             vga_controller_m1_qualified_request_sdram_s1;
  wire             vga_controller_m1_rdv_fifo_empty_sdram_s1;
  wire             vga_controller_m1_rdv_fifo_output_from_sdram_s1;
  wire             vga_controller_m1_read_data_valid_sdram_s1;
  wire             vga_controller_m1_read_data_valid_sdram_s1_shift_register;
  wire             vga_controller_m1_requests_sdram_s1;
  wire             vga_controller_m1_saved_grant_sdram_s1;
  wire             wait_for_sdram_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sdram_s1_end_xfer;
    end


  assign sdram_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sdram_s1 | cpu_instruction_master_qualified_request_sdram_s1 | vga_controller_m1_qualified_request_sdram_s1));
  //assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid;

  //assign sdram_s1_readdata_from_sa = sdram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdata_from_sa = sdram_s1_readdata;

  assign cpu_data_master_requests_sdram_s1 = ({cpu_data_master_address_to_slave[24 : 23] , 23'b0} == 25'h800000) & (cpu_data_master_read | cpu_data_master_write);
  //assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest;

  //sdram_s1_arb_share_counter set values, which is an e_mux
  assign sdram_s1_arb_share_set_values = (cpu_data_master_granted_sdram_s1)? 2 :
    (cpu_instruction_master_granted_sdram_s1)? 2 :
    (vga_controller_m1_granted_sdram_s1)? 2 :
    (cpu_data_master_granted_sdram_s1)? 2 :
    (cpu_instruction_master_granted_sdram_s1)? 2 :
    (vga_controller_m1_granted_sdram_s1)? 2 :
    (cpu_data_master_granted_sdram_s1)? 2 :
    (cpu_instruction_master_granted_sdram_s1)? 2 :
    (vga_controller_m1_granted_sdram_s1)? 2 :
    1;

  //sdram_s1_non_bursting_master_requests mux, which is an e_mux
  assign sdram_s1_non_bursting_master_requests = cpu_data_master_requests_sdram_s1 |
    cpu_instruction_master_requests_sdram_s1 |
    vga_controller_m1_requests_sdram_s1 |
    cpu_data_master_requests_sdram_s1 |
    cpu_instruction_master_requests_sdram_s1 |
    vga_controller_m1_requests_sdram_s1 |
    cpu_data_master_requests_sdram_s1 |
    cpu_instruction_master_requests_sdram_s1 |
    vga_controller_m1_requests_sdram_s1;

  //sdram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sdram_s1_any_bursting_master_saved_grant = 0;

  //sdram_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sdram_s1_arb_share_counter_next_value = sdram_s1_firsttransfer ? (sdram_s1_arb_share_set_values - 1) : |sdram_s1_arb_share_counter ? (sdram_s1_arb_share_counter - 1) : 0;

  //sdram_s1_allgrants all slave grants, which is an e_mux
  assign sdram_s1_allgrants = (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector);

  //sdram_s1_end_xfer assignment, which is an e_assign
  assign sdram_s1_end_xfer = ~(sdram_s1_waits_for_read | sdram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sdram_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sdram_s1 = sdram_s1_end_xfer & (~sdram_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sdram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sdram_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sdram_s1 & sdram_s1_allgrants) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests);

  //sdram_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_share_counter <= 0;
      else if (sdram_s1_arb_counter_enable)
          sdram_s1_arb_share_counter <= sdram_s1_arb_share_counter_next_value;
    end


  //sdram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_slavearbiterlockenable <= 0;
      else if ((|sdram_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sdram_s1) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests))
          sdram_s1_slavearbiterlockenable <= |sdram_s1_arb_share_counter_next_value;
    end


  //cpu/data_master sdram/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sdram_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sdram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sdram_s1_slavearbiterlockenable2 = |sdram_s1_arb_share_counter_next_value;

  //cpu/data_master sdram/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master sdram/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = sdram_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master sdram/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_sdram_s1 <= cpu_instruction_master_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_sdram_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_sdram_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = (last_cycle_cpu_instruction_master_granted_slave_sdram_s1 & cpu_instruction_master_requests_sdram_s1) |
    (last_cycle_cpu_instruction_master_granted_slave_sdram_s1 & cpu_instruction_master_requests_sdram_s1);

  //sdram_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sdram_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    vga_controller_m1_continuerequest |
    cpu_data_master_continuerequest |
    vga_controller_m1_continuerequest |
    cpu_data_master_continuerequest |
    cpu_instruction_master_continuerequest;

  //vga_controller/m1 sdram/s1 arbiterlock, which is an e_assign
  assign vga_controller_m1_arbiterlock = sdram_s1_slavearbiterlockenable & vga_controller_m1_continuerequest;

  //vga_controller/m1 sdram/s1 arbiterlock2, which is an e_assign
  assign vga_controller_m1_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & vga_controller_m1_continuerequest;

  //vga_controller/m1 granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_vga_controller_m1_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_vga_controller_m1_granted_slave_sdram_s1 <= vga_controller_m1_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~vga_controller_m1_requests_sdram_s1) ? 0 : last_cycle_vga_controller_m1_granted_slave_sdram_s1;
    end


  //vga_controller_m1_continuerequest continued request, which is an e_mux
  assign vga_controller_m1_continuerequest = (last_cycle_vga_controller_m1_granted_slave_sdram_s1 & vga_controller_m1_requests_sdram_s1) |
    (last_cycle_vga_controller_m1_granted_slave_sdram_s1 & vga_controller_m1_requests_sdram_s1);

  assign cpu_data_master_qualified_request_sdram_s1 = cpu_data_master_requests_sdram_s1 & ~((cpu_data_master_read & (~cpu_data_master_waitrequest | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))) | ((~cpu_data_master_waitrequest | cpu_data_master_no_byte_enables_and_last_term | !cpu_data_master_byteenable_sdram_s1) & cpu_data_master_write) | cpu_instruction_master_arbiterlock | vga_controller_m1_arbiterlock);
  //unique name for sdram_s1_move_on_to_next_transaction, which is an e_assign
  assign sdram_s1_move_on_to_next_transaction = sdram_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_data_master_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_sdram_s1_module rdv_fifo_for_cpu_data_master_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_sdram_s1),
      .data_out             (cpu_data_master_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_sdram_s1_shift_register = ~cpu_data_master_rdv_fifo_empty_sdram_s1;
  //local readdatavalid cpu_data_master_read_data_valid_sdram_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & cpu_data_master_rdv_fifo_output_from_sdram_s1) & ~ cpu_data_master_rdv_fifo_empty_sdram_s1;

  //sdram_s1_writedata mux, which is an e_mux
  assign sdram_s1_writedata = cpu_data_master_dbs_write_16;

  assign cpu_instruction_master_requests_sdram_s1 = (({cpu_instruction_master_address_to_slave[24 : 23] , 23'b0} == 25'h800000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_sdram_s1 <= cpu_data_master_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_sdram_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_sdram_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = (last_cycle_cpu_data_master_granted_slave_sdram_s1 & cpu_data_master_requests_sdram_s1) |
    (last_cycle_cpu_data_master_granted_slave_sdram_s1 & cpu_data_master_requests_sdram_s1);

  assign cpu_instruction_master_qualified_request_sdram_s1 = cpu_instruction_master_requests_sdram_s1 & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0) | (1 < cpu_instruction_master_latency_counter))) | cpu_data_master_arbiterlock | vga_controller_m1_arbiterlock);
  //rdv_fifo_for_cpu_instruction_master_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_instruction_master_to_sdram_s1_module rdv_fifo_for_cpu_instruction_master_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_instruction_master_granted_sdram_s1),
      .data_out             (cpu_instruction_master_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_instruction_master_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign cpu_instruction_master_read_data_valid_sdram_s1_shift_register = ~cpu_instruction_master_rdv_fifo_empty_sdram_s1;
  //local readdatavalid cpu_instruction_master_read_data_valid_sdram_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & cpu_instruction_master_rdv_fifo_output_from_sdram_s1) & ~ cpu_instruction_master_rdv_fifo_empty_sdram_s1;

  assign vga_controller_m1_requests_sdram_s1 = (({vga_controller_m1_address_to_slave[31 : 23] , 23'b0} == 32'h800000) & (vga_controller_m1_read)) & vga_controller_m1_read;
  assign vga_controller_m1_qualified_request_sdram_s1 = vga_controller_m1_requests_sdram_s1 & ~((vga_controller_m1_read & ((vga_controller_m1_latency_counter != 0) | (1 < vga_controller_m1_latency_counter))) | cpu_data_master_arbiterlock | cpu_instruction_master_arbiterlock);
  //rdv_fifo_for_vga_controller_m1_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_vga_controller_m1_to_sdram_s1_module rdv_fifo_for_vga_controller_m1_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (vga_controller_m1_granted_sdram_s1),
      .data_out             (vga_controller_m1_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (vga_controller_m1_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign vga_controller_m1_read_data_valid_sdram_s1_shift_register = ~vga_controller_m1_rdv_fifo_empty_sdram_s1;
  //local readdatavalid vga_controller_m1_read_data_valid_sdram_s1, which is an e_mux
  assign vga_controller_m1_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & vga_controller_m1_rdv_fifo_output_from_sdram_s1) & ~ vga_controller_m1_rdv_fifo_empty_sdram_s1;

  //allow new arb cycle for sdram/s1, which is an e_assign
  assign sdram_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock & ~vga_controller_m1_arbiterlock;

  //vga_controller/m1 assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[0] = vga_controller_m1_qualified_request_sdram_s1;

  //vga_controller/m1 grant sdram/s1, which is an e_assign
  assign vga_controller_m1_granted_sdram_s1 = sdram_s1_grant_vector[0];

  //vga_controller/m1 saved-grant sdram/s1, which is an e_assign
  assign vga_controller_m1_saved_grant_sdram_s1 = sdram_s1_arb_winner[0] && vga_controller_m1_requests_sdram_s1;

  //cpu/instruction_master assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[1] = cpu_instruction_master_qualified_request_sdram_s1;

  //cpu/instruction_master grant sdram/s1, which is an e_assign
  assign cpu_instruction_master_granted_sdram_s1 = sdram_s1_grant_vector[1];

  //cpu/instruction_master saved-grant sdram/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_sdram_s1 = sdram_s1_arb_winner[1] && cpu_instruction_master_requests_sdram_s1;

  //cpu/data_master assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[2] = cpu_data_master_qualified_request_sdram_s1;

  //cpu/data_master grant sdram/s1, which is an e_assign
  assign cpu_data_master_granted_sdram_s1 = sdram_s1_grant_vector[2];

  //cpu/data_master saved-grant sdram/s1, which is an e_assign
  assign cpu_data_master_saved_grant_sdram_s1 = sdram_s1_arb_winner[2] && cpu_data_master_requests_sdram_s1;

  //sdram/s1 chosen-master double-vector, which is an e_assign
  assign sdram_s1_chosen_master_double_vector = {sdram_s1_master_qreq_vector, sdram_s1_master_qreq_vector} & ({~sdram_s1_master_qreq_vector, ~sdram_s1_master_qreq_vector} + sdram_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign sdram_s1_arb_winner = (sdram_s1_allow_new_arb_cycle & | sdram_s1_grant_vector) ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;

  //saved sdram_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_saved_chosen_master_vector <= 0;
      else if (sdram_s1_allow_new_arb_cycle)
          sdram_s1_saved_chosen_master_vector <= |sdram_s1_grant_vector ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sdram_s1_grant_vector = {(sdram_s1_chosen_master_double_vector[2] | sdram_s1_chosen_master_double_vector[5]),
    (sdram_s1_chosen_master_double_vector[1] | sdram_s1_chosen_master_double_vector[4]),
    (sdram_s1_chosen_master_double_vector[0] | sdram_s1_chosen_master_double_vector[3])};

  //sdram/s1 chosen master rotated left, which is an e_assign
  assign sdram_s1_chosen_master_rot_left = (sdram_s1_arb_winner << 1) ? (sdram_s1_arb_winner << 1) : 1;

  //sdram/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_addend <= 1;
      else if (|sdram_s1_grant_vector)
          sdram_s1_arb_addend <= sdram_s1_end_xfer? sdram_s1_chosen_master_rot_left : sdram_s1_grant_vector;
    end


  //sdram_s1_reset_n assignment, which is an e_assign
  assign sdram_s1_reset_n = reset_n;

  assign sdram_s1_chipselect = cpu_data_master_granted_sdram_s1 | cpu_instruction_master_granted_sdram_s1 | vga_controller_m1_granted_sdram_s1;
  //sdram_s1_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_firsttransfer = sdram_s1_begins_xfer ? sdram_s1_unreg_firsttransfer : sdram_s1_reg_firsttransfer;

  //sdram_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_unreg_firsttransfer = ~(sdram_s1_slavearbiterlockenable & sdram_s1_any_continuerequest);

  //sdram_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_reg_firsttransfer <= 1'b1;
      else if (sdram_s1_begins_xfer)
          sdram_s1_reg_firsttransfer <= sdram_s1_unreg_firsttransfer;
    end


  //sdram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sdram_s1_beginbursttransfer_internal = sdram_s1_begins_xfer;

  //sdram_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sdram_s1_arbitration_holdoff_internal = sdram_s1_begins_xfer & sdram_s1_firsttransfer;

  //~sdram_s1_read_n assignment, which is an e_mux
  assign sdram_s1_read_n = ~((cpu_data_master_granted_sdram_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_sdram_s1 & cpu_instruction_master_read) | (vga_controller_m1_granted_sdram_s1 & vga_controller_m1_read));

  //~sdram_s1_write_n assignment, which is an e_mux
  assign sdram_s1_write_n = ~(cpu_data_master_granted_sdram_s1 & cpu_data_master_write);

  assign shifted_address_to_sdram_s1_from_cpu_data_master = {cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1],
    {1 {1'b0}}};

  //sdram_s1_address mux, which is an e_mux
  assign sdram_s1_address = (cpu_data_master_granted_sdram_s1)? (shifted_address_to_sdram_s1_from_cpu_data_master >> 1) :
    (cpu_instruction_master_granted_sdram_s1)? (shifted_address_to_sdram_s1_from_cpu_instruction_master >> 1) :
    (shifted_address_to_sdram_s1_from_vga_controller_m1 >> 1);

  assign shifted_address_to_sdram_s1_from_cpu_instruction_master = {cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  assign shifted_address_to_sdram_s1_from_vga_controller_m1 = {vga_controller_m1_address_to_slave >> 2,
    vga_controller_m1_dbs_address[1],
    {1 {1'b0}}};

  //d1_sdram_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sdram_s1_end_xfer <= 1;
      else 
        d1_sdram_s1_end_xfer <= sdram_s1_end_xfer;
    end


  //sdram_s1_waits_for_read in a cycle, which is an e_mux
  assign sdram_s1_waits_for_read = sdram_s1_in_a_read_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_read_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_read_cycle = (cpu_data_master_granted_sdram_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_sdram_s1 & cpu_instruction_master_read) | (vga_controller_m1_granted_sdram_s1 & vga_controller_m1_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sdram_s1_in_a_read_cycle;

  //sdram_s1_waits_for_write in a cycle, which is an e_mux
  assign sdram_s1_waits_for_write = sdram_s1_in_a_write_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_write_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_write_cycle = cpu_data_master_granted_sdram_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sdram_s1_in_a_write_cycle;

  assign wait_for_sdram_s1_counter = 0;
  //~sdram_s1_byteenable_n byte enable port mux, which is an e_mux
  assign sdram_s1_byteenable_n = ~((cpu_data_master_granted_sdram_s1)? cpu_data_master_byteenable_sdram_s1 :
    -1);

  assign {cpu_data_master_byteenable_sdram_s1_segment_1,
cpu_data_master_byteenable_sdram_s1_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_sdram_s1 = ((cpu_data_master_dbs_address[1] == 0))? cpu_data_master_byteenable_sdram_s1_segment_0 :
    cpu_data_master_byteenable_sdram_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sdram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_sdram_s1 + cpu_instruction_master_granted_sdram_s1 + vga_controller_m1_granted_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_sdram_s1 + cpu_instruction_master_saved_grant_sdram_s1 + vga_controller_m1_saved_grant_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_sram_avalon_sram_slave_module (
                                                                       // inputs:
                                                                        clear_fifo,
                                                                        clk,
                                                                        data_in,
                                                                        read,
                                                                        reset_n,
                                                                        sync_reset,
                                                                        write,

                                                                       // outputs:
                                                                        data_out,
                                                                        empty,
                                                                        fifo_contains_ones_n,
                                                                        full
                                                                     )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  wire             full_2;
  reg     [  2: 0] how_many_ones;
  wire    [  2: 0] one_count_minus_one;
  wire    [  2: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  reg              stage_0;
  reg              stage_1;
  wire    [  2: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_1;
  assign empty = !full_0;
  assign full_2 = 0;
  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    0;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sram_avalon_sram_slave_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_data_master_address_to_slave,
                                            cpu_data_master_byteenable,
                                            cpu_data_master_dbs_address,
                                            cpu_data_master_dbs_write_16,
                                            cpu_data_master_no_byte_enables_and_last_term,
                                            cpu_data_master_read,
                                            cpu_data_master_waitrequest,
                                            cpu_data_master_write,
                                            reset_n,
                                            sram_avalon_sram_slave_readdata,
                                            sram_avalon_sram_slave_readdatavalid,

                                           // outputs:
                                            cpu_data_master_byteenable_sram_avalon_sram_slave,
                                            cpu_data_master_granted_sram_avalon_sram_slave,
                                            cpu_data_master_qualified_request_sram_avalon_sram_slave,
                                            cpu_data_master_read_data_valid_sram_avalon_sram_slave,
                                            cpu_data_master_read_data_valid_sram_avalon_sram_slave_shift_register,
                                            cpu_data_master_requests_sram_avalon_sram_slave,
                                            d1_sram_avalon_sram_slave_end_xfer,
                                            sram_avalon_sram_slave_address,
                                            sram_avalon_sram_slave_byteenable,
                                            sram_avalon_sram_slave_read,
                                            sram_avalon_sram_slave_readdata_from_sa,
                                            sram_avalon_sram_slave_reset,
                                            sram_avalon_sram_slave_write,
                                            sram_avalon_sram_slave_writedata
                                         )
;

  output  [  1: 0] cpu_data_master_byteenable_sram_avalon_sram_slave;
  output           cpu_data_master_granted_sram_avalon_sram_slave;
  output           cpu_data_master_qualified_request_sram_avalon_sram_slave;
  output           cpu_data_master_read_data_valid_sram_avalon_sram_slave;
  output           cpu_data_master_read_data_valid_sram_avalon_sram_slave_shift_register;
  output           cpu_data_master_requests_sram_avalon_sram_slave;
  output           d1_sram_avalon_sram_slave_end_xfer;
  output  [ 17: 0] sram_avalon_sram_slave_address;
  output  [  1: 0] sram_avalon_sram_slave_byteenable;
  output           sram_avalon_sram_slave_read;
  output  [ 15: 0] sram_avalon_sram_slave_readdata_from_sa;
  output           sram_avalon_sram_slave_reset;
  output           sram_avalon_sram_slave_write;
  output  [ 15: 0] sram_avalon_sram_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [ 15: 0] cpu_data_master_dbs_write_16;
  input            cpu_data_master_no_byte_enables_and_last_term;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input            reset_n;
  input   [ 15: 0] sram_avalon_sram_slave_readdata;
  input            sram_avalon_sram_slave_readdatavalid;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_sram_slave;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_sram_slave_segment_0;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_sram_slave_segment_1;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sram_avalon_sram_slave;
  wire             cpu_data_master_qualified_request_sram_avalon_sram_slave;
  wire             cpu_data_master_rdv_fifo_empty_sram_avalon_sram_slave;
  wire             cpu_data_master_rdv_fifo_output_from_sram_avalon_sram_slave;
  wire             cpu_data_master_read_data_valid_sram_avalon_sram_slave;
  wire             cpu_data_master_read_data_valid_sram_avalon_sram_slave_shift_register;
  wire             cpu_data_master_requests_sram_avalon_sram_slave;
  wire             cpu_data_master_saved_grant_sram_avalon_sram_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sram_avalon_sram_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sram_avalon_sram_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_sram_avalon_sram_slave_from_cpu_data_master;
  wire    [ 17: 0] sram_avalon_sram_slave_address;
  wire             sram_avalon_sram_slave_allgrants;
  wire             sram_avalon_sram_slave_allow_new_arb_cycle;
  wire             sram_avalon_sram_slave_any_bursting_master_saved_grant;
  wire             sram_avalon_sram_slave_any_continuerequest;
  wire             sram_avalon_sram_slave_arb_counter_enable;
  reg     [  2: 0] sram_avalon_sram_slave_arb_share_counter;
  wire    [  2: 0] sram_avalon_sram_slave_arb_share_counter_next_value;
  wire    [  2: 0] sram_avalon_sram_slave_arb_share_set_values;
  wire             sram_avalon_sram_slave_beginbursttransfer_internal;
  wire             sram_avalon_sram_slave_begins_xfer;
  wire    [  1: 0] sram_avalon_sram_slave_byteenable;
  wire             sram_avalon_sram_slave_end_xfer;
  wire             sram_avalon_sram_slave_firsttransfer;
  wire             sram_avalon_sram_slave_grant_vector;
  wire             sram_avalon_sram_slave_in_a_read_cycle;
  wire             sram_avalon_sram_slave_in_a_write_cycle;
  wire             sram_avalon_sram_slave_master_qreq_vector;
  wire             sram_avalon_sram_slave_move_on_to_next_transaction;
  wire             sram_avalon_sram_slave_non_bursting_master_requests;
  wire             sram_avalon_sram_slave_read;
  wire    [ 15: 0] sram_avalon_sram_slave_readdata_from_sa;
  wire             sram_avalon_sram_slave_readdatavalid_from_sa;
  reg              sram_avalon_sram_slave_reg_firsttransfer;
  wire             sram_avalon_sram_slave_reset;
  reg              sram_avalon_sram_slave_slavearbiterlockenable;
  wire             sram_avalon_sram_slave_slavearbiterlockenable2;
  wire             sram_avalon_sram_slave_unreg_firsttransfer;
  wire             sram_avalon_sram_slave_waits_for_read;
  wire             sram_avalon_sram_slave_waits_for_write;
  wire             sram_avalon_sram_slave_write;
  wire    [ 15: 0] sram_avalon_sram_slave_writedata;
  wire             wait_for_sram_avalon_sram_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sram_avalon_sram_slave_end_xfer;
    end


  assign sram_avalon_sram_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sram_avalon_sram_slave));
  //assign sram_avalon_sram_slave_readdata_from_sa = sram_avalon_sram_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sram_avalon_sram_slave_readdata_from_sa = sram_avalon_sram_slave_readdata;

  assign cpu_data_master_requests_sram_avalon_sram_slave = ({cpu_data_master_address_to_slave[24 : 19] , 19'b0} == 25'h1800000) & (cpu_data_master_read | cpu_data_master_write);
  //assign sram_avalon_sram_slave_readdatavalid_from_sa = sram_avalon_sram_slave_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sram_avalon_sram_slave_readdatavalid_from_sa = sram_avalon_sram_slave_readdatavalid;

  //sram_avalon_sram_slave_arb_share_counter set values, which is an e_mux
  assign sram_avalon_sram_slave_arb_share_set_values = (cpu_data_master_granted_sram_avalon_sram_slave)? 2 :
    1;

  //sram_avalon_sram_slave_non_bursting_master_requests mux, which is an e_mux
  assign sram_avalon_sram_slave_non_bursting_master_requests = cpu_data_master_requests_sram_avalon_sram_slave;

  //sram_avalon_sram_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sram_avalon_sram_slave_any_bursting_master_saved_grant = 0;

  //sram_avalon_sram_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sram_avalon_sram_slave_arb_share_counter_next_value = sram_avalon_sram_slave_firsttransfer ? (sram_avalon_sram_slave_arb_share_set_values - 1) : |sram_avalon_sram_slave_arb_share_counter ? (sram_avalon_sram_slave_arb_share_counter - 1) : 0;

  //sram_avalon_sram_slave_allgrants all slave grants, which is an e_mux
  assign sram_avalon_sram_slave_allgrants = |sram_avalon_sram_slave_grant_vector;

  //sram_avalon_sram_slave_end_xfer assignment, which is an e_assign
  assign sram_avalon_sram_slave_end_xfer = ~(sram_avalon_sram_slave_waits_for_read | sram_avalon_sram_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sram_avalon_sram_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sram_avalon_sram_slave = sram_avalon_sram_slave_end_xfer & (~sram_avalon_sram_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sram_avalon_sram_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sram_avalon_sram_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sram_avalon_sram_slave & sram_avalon_sram_slave_allgrants) | (end_xfer_arb_share_counter_term_sram_avalon_sram_slave & ~sram_avalon_sram_slave_non_bursting_master_requests);

  //sram_avalon_sram_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_sram_slave_arb_share_counter <= 0;
      else if (sram_avalon_sram_slave_arb_counter_enable)
          sram_avalon_sram_slave_arb_share_counter <= sram_avalon_sram_slave_arb_share_counter_next_value;
    end


  //sram_avalon_sram_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_sram_slave_slavearbiterlockenable <= 0;
      else if ((|sram_avalon_sram_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sram_avalon_sram_slave) | (end_xfer_arb_share_counter_term_sram_avalon_sram_slave & ~sram_avalon_sram_slave_non_bursting_master_requests))
          sram_avalon_sram_slave_slavearbiterlockenable <= |sram_avalon_sram_slave_arb_share_counter_next_value;
    end


  //cpu/data_master sram/avalon_sram_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sram_avalon_sram_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sram_avalon_sram_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sram_avalon_sram_slave_slavearbiterlockenable2 = |sram_avalon_sram_slave_arb_share_counter_next_value;

  //cpu/data_master sram/avalon_sram_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sram_avalon_sram_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sram_avalon_sram_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sram_avalon_sram_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sram_avalon_sram_slave = cpu_data_master_requests_sram_avalon_sram_slave & ~((cpu_data_master_read & (~cpu_data_master_waitrequest | (|cpu_data_master_read_data_valid_sram_avalon_sram_slave_shift_register))) | ((~cpu_data_master_waitrequest | cpu_data_master_no_byte_enables_and_last_term | !cpu_data_master_byteenable_sram_avalon_sram_slave) & cpu_data_master_write));
  //unique name for sram_avalon_sram_slave_move_on_to_next_transaction, which is an e_assign
  assign sram_avalon_sram_slave_move_on_to_next_transaction = sram_avalon_sram_slave_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_data_master_to_sram_avalon_sram_slave, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_sram_avalon_sram_slave_module rdv_fifo_for_cpu_data_master_to_sram_avalon_sram_slave
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_sram_avalon_sram_slave),
      .data_out             (cpu_data_master_rdv_fifo_output_from_sram_avalon_sram_slave),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_sram_avalon_sram_slave),
      .full                 (),
      .read                 (sram_avalon_sram_slave_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sram_avalon_sram_slave_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_sram_avalon_sram_slave_shift_register = ~cpu_data_master_rdv_fifo_empty_sram_avalon_sram_slave;
  //local readdatavalid cpu_data_master_read_data_valid_sram_avalon_sram_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_sram_avalon_sram_slave = sram_avalon_sram_slave_readdatavalid_from_sa;

  //sram_avalon_sram_slave_writedata mux, which is an e_mux
  assign sram_avalon_sram_slave_writedata = cpu_data_master_dbs_write_16;

  //master is always granted when requested
  assign cpu_data_master_granted_sram_avalon_sram_slave = cpu_data_master_qualified_request_sram_avalon_sram_slave;

  //cpu/data_master saved-grant sram/avalon_sram_slave, which is an e_assign
  assign cpu_data_master_saved_grant_sram_avalon_sram_slave = cpu_data_master_requests_sram_avalon_sram_slave;

  //allow new arb cycle for sram/avalon_sram_slave, which is an e_assign
  assign sram_avalon_sram_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sram_avalon_sram_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sram_avalon_sram_slave_master_qreq_vector = 1;

  //~sram_avalon_sram_slave_reset assignment, which is an e_assign
  assign sram_avalon_sram_slave_reset = ~reset_n;

  //sram_avalon_sram_slave_firsttransfer first transaction, which is an e_assign
  assign sram_avalon_sram_slave_firsttransfer = sram_avalon_sram_slave_begins_xfer ? sram_avalon_sram_slave_unreg_firsttransfer : sram_avalon_sram_slave_reg_firsttransfer;

  //sram_avalon_sram_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sram_avalon_sram_slave_unreg_firsttransfer = ~(sram_avalon_sram_slave_slavearbiterlockenable & sram_avalon_sram_slave_any_continuerequest);

  //sram_avalon_sram_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_sram_slave_reg_firsttransfer <= 1'b1;
      else if (sram_avalon_sram_slave_begins_xfer)
          sram_avalon_sram_slave_reg_firsttransfer <= sram_avalon_sram_slave_unreg_firsttransfer;
    end


  //sram_avalon_sram_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sram_avalon_sram_slave_beginbursttransfer_internal = sram_avalon_sram_slave_begins_xfer;

  //sram_avalon_sram_slave_read assignment, which is an e_mux
  assign sram_avalon_sram_slave_read = cpu_data_master_granted_sram_avalon_sram_slave & cpu_data_master_read;

  //sram_avalon_sram_slave_write assignment, which is an e_mux
  assign sram_avalon_sram_slave_write = cpu_data_master_granted_sram_avalon_sram_slave & cpu_data_master_write;

  assign shifted_address_to_sram_avalon_sram_slave_from_cpu_data_master = {cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1],
    {1 {1'b0}}};

  //sram_avalon_sram_slave_address mux, which is an e_mux
  assign sram_avalon_sram_slave_address = shifted_address_to_sram_avalon_sram_slave_from_cpu_data_master >> 1;

  //d1_sram_avalon_sram_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sram_avalon_sram_slave_end_xfer <= 1;
      else 
        d1_sram_avalon_sram_slave_end_xfer <= sram_avalon_sram_slave_end_xfer;
    end


  //sram_avalon_sram_slave_waits_for_read in a cycle, which is an e_mux
  assign sram_avalon_sram_slave_waits_for_read = sram_avalon_sram_slave_in_a_read_cycle & 0;

  //sram_avalon_sram_slave_in_a_read_cycle assignment, which is an e_assign
  assign sram_avalon_sram_slave_in_a_read_cycle = cpu_data_master_granted_sram_avalon_sram_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sram_avalon_sram_slave_in_a_read_cycle;

  //sram_avalon_sram_slave_waits_for_write in a cycle, which is an e_mux
  assign sram_avalon_sram_slave_waits_for_write = sram_avalon_sram_slave_in_a_write_cycle & 0;

  //sram_avalon_sram_slave_in_a_write_cycle assignment, which is an e_assign
  assign sram_avalon_sram_slave_in_a_write_cycle = cpu_data_master_granted_sram_avalon_sram_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sram_avalon_sram_slave_in_a_write_cycle;

  assign wait_for_sram_avalon_sram_slave_counter = 0;
  //sram_avalon_sram_slave_byteenable byte enable port mux, which is an e_mux
  assign sram_avalon_sram_slave_byteenable = (cpu_data_master_granted_sram_avalon_sram_slave)? cpu_data_master_byteenable_sram_avalon_sram_slave :
    -1;

  assign {cpu_data_master_byteenable_sram_avalon_sram_slave_segment_1,
cpu_data_master_byteenable_sram_avalon_sram_slave_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_sram_avalon_sram_slave = ((cpu_data_master_dbs_address[1] == 0))? cpu_data_master_byteenable_sram_avalon_sram_slave_segment_0 :
    cpu_data_master_byteenable_sram_avalon_sram_slave_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sram/avalon_sram_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sys_clk_timer_s1_arbitrator (
                                     // inputs:
                                      clk,
                                      cpu_data_master_address_to_slave,
                                      cpu_data_master_read,
                                      cpu_data_master_waitrequest,
                                      cpu_data_master_write,
                                      cpu_data_master_writedata,
                                      reset_n,
                                      sys_clk_timer_s1_irq,
                                      sys_clk_timer_s1_readdata,

                                     // outputs:
                                      cpu_data_master_granted_sys_clk_timer_s1,
                                      cpu_data_master_qualified_request_sys_clk_timer_s1,
                                      cpu_data_master_read_data_valid_sys_clk_timer_s1,
                                      cpu_data_master_requests_sys_clk_timer_s1,
                                      d1_sys_clk_timer_s1_end_xfer,
                                      sys_clk_timer_s1_address,
                                      sys_clk_timer_s1_chipselect,
                                      sys_clk_timer_s1_irq_from_sa,
                                      sys_clk_timer_s1_readdata_from_sa,
                                      sys_clk_timer_s1_reset_n,
                                      sys_clk_timer_s1_write_n,
                                      sys_clk_timer_s1_writedata
                                   )
;

  output           cpu_data_master_granted_sys_clk_timer_s1;
  output           cpu_data_master_qualified_request_sys_clk_timer_s1;
  output           cpu_data_master_read_data_valid_sys_clk_timer_s1;
  output           cpu_data_master_requests_sys_clk_timer_s1;
  output           d1_sys_clk_timer_s1_end_xfer;
  output  [  2: 0] sys_clk_timer_s1_address;
  output           sys_clk_timer_s1_chipselect;
  output           sys_clk_timer_s1_irq_from_sa;
  output  [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  output           sys_clk_timer_s1_reset_n;
  output           sys_clk_timer_s1_write_n;
  output  [ 15: 0] sys_clk_timer_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input            sys_clk_timer_s1_irq;
  input   [ 15: 0] sys_clk_timer_s1_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sys_clk_timer_s1;
  wire             cpu_data_master_qualified_request_sys_clk_timer_s1;
  wire             cpu_data_master_read_data_valid_sys_clk_timer_s1;
  wire             cpu_data_master_requests_sys_clk_timer_s1;
  wire             cpu_data_master_saved_grant_sys_clk_timer_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sys_clk_timer_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sys_clk_timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_sys_clk_timer_s1_from_cpu_data_master;
  wire    [  2: 0] sys_clk_timer_s1_address;
  wire             sys_clk_timer_s1_allgrants;
  wire             sys_clk_timer_s1_allow_new_arb_cycle;
  wire             sys_clk_timer_s1_any_bursting_master_saved_grant;
  wire             sys_clk_timer_s1_any_continuerequest;
  wire             sys_clk_timer_s1_arb_counter_enable;
  reg     [  2: 0] sys_clk_timer_s1_arb_share_counter;
  wire    [  2: 0] sys_clk_timer_s1_arb_share_counter_next_value;
  wire    [  2: 0] sys_clk_timer_s1_arb_share_set_values;
  wire             sys_clk_timer_s1_beginbursttransfer_internal;
  wire             sys_clk_timer_s1_begins_xfer;
  wire             sys_clk_timer_s1_chipselect;
  wire             sys_clk_timer_s1_end_xfer;
  wire             sys_clk_timer_s1_firsttransfer;
  wire             sys_clk_timer_s1_grant_vector;
  wire             sys_clk_timer_s1_in_a_read_cycle;
  wire             sys_clk_timer_s1_in_a_write_cycle;
  wire             sys_clk_timer_s1_irq_from_sa;
  wire             sys_clk_timer_s1_master_qreq_vector;
  wire             sys_clk_timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  reg              sys_clk_timer_s1_reg_firsttransfer;
  wire             sys_clk_timer_s1_reset_n;
  reg              sys_clk_timer_s1_slavearbiterlockenable;
  wire             sys_clk_timer_s1_slavearbiterlockenable2;
  wire             sys_clk_timer_s1_unreg_firsttransfer;
  wire             sys_clk_timer_s1_waits_for_read;
  wire             sys_clk_timer_s1_waits_for_write;
  wire             sys_clk_timer_s1_write_n;
  wire    [ 15: 0] sys_clk_timer_s1_writedata;
  wire             wait_for_sys_clk_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sys_clk_timer_s1_end_xfer;
    end


  assign sys_clk_timer_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sys_clk_timer_s1));
  //assign sys_clk_timer_s1_readdata_from_sa = sys_clk_timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sys_clk_timer_s1_readdata_from_sa = sys_clk_timer_s1_readdata;

  assign cpu_data_master_requests_sys_clk_timer_s1 = ({cpu_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1881000) & (cpu_data_master_read | cpu_data_master_write);
  //sys_clk_timer_s1_arb_share_counter set values, which is an e_mux
  assign sys_clk_timer_s1_arb_share_set_values = 1;

  //sys_clk_timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign sys_clk_timer_s1_non_bursting_master_requests = cpu_data_master_requests_sys_clk_timer_s1;

  //sys_clk_timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sys_clk_timer_s1_any_bursting_master_saved_grant = 0;

  //sys_clk_timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sys_clk_timer_s1_arb_share_counter_next_value = sys_clk_timer_s1_firsttransfer ? (sys_clk_timer_s1_arb_share_set_values - 1) : |sys_clk_timer_s1_arb_share_counter ? (sys_clk_timer_s1_arb_share_counter - 1) : 0;

  //sys_clk_timer_s1_allgrants all slave grants, which is an e_mux
  assign sys_clk_timer_s1_allgrants = |sys_clk_timer_s1_grant_vector;

  //sys_clk_timer_s1_end_xfer assignment, which is an e_assign
  assign sys_clk_timer_s1_end_xfer = ~(sys_clk_timer_s1_waits_for_read | sys_clk_timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sys_clk_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sys_clk_timer_s1 = sys_clk_timer_s1_end_xfer & (~sys_clk_timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sys_clk_timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sys_clk_timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sys_clk_timer_s1 & sys_clk_timer_s1_allgrants) | (end_xfer_arb_share_counter_term_sys_clk_timer_s1 & ~sys_clk_timer_s1_non_bursting_master_requests);

  //sys_clk_timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_clk_timer_s1_arb_share_counter <= 0;
      else if (sys_clk_timer_s1_arb_counter_enable)
          sys_clk_timer_s1_arb_share_counter <= sys_clk_timer_s1_arb_share_counter_next_value;
    end


  //sys_clk_timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_clk_timer_s1_slavearbiterlockenable <= 0;
      else if ((|sys_clk_timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sys_clk_timer_s1) | (end_xfer_arb_share_counter_term_sys_clk_timer_s1 & ~sys_clk_timer_s1_non_bursting_master_requests))
          sys_clk_timer_s1_slavearbiterlockenable <= |sys_clk_timer_s1_arb_share_counter_next_value;
    end


  //cpu/data_master sys_clk_timer/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sys_clk_timer_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sys_clk_timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sys_clk_timer_s1_slavearbiterlockenable2 = |sys_clk_timer_s1_arb_share_counter_next_value;

  //cpu/data_master sys_clk_timer/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sys_clk_timer_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sys_clk_timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sys_clk_timer_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sys_clk_timer_s1 = cpu_data_master_requests_sys_clk_timer_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //sys_clk_timer_s1_writedata mux, which is an e_mux
  assign sys_clk_timer_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_sys_clk_timer_s1 = cpu_data_master_qualified_request_sys_clk_timer_s1;

  //cpu/data_master saved-grant sys_clk_timer/s1, which is an e_assign
  assign cpu_data_master_saved_grant_sys_clk_timer_s1 = cpu_data_master_requests_sys_clk_timer_s1;

  //allow new arb cycle for sys_clk_timer/s1, which is an e_assign
  assign sys_clk_timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sys_clk_timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sys_clk_timer_s1_master_qreq_vector = 1;

  //sys_clk_timer_s1_reset_n assignment, which is an e_assign
  assign sys_clk_timer_s1_reset_n = reset_n;

  assign sys_clk_timer_s1_chipselect = cpu_data_master_granted_sys_clk_timer_s1;
  //sys_clk_timer_s1_firsttransfer first transaction, which is an e_assign
  assign sys_clk_timer_s1_firsttransfer = sys_clk_timer_s1_begins_xfer ? sys_clk_timer_s1_unreg_firsttransfer : sys_clk_timer_s1_reg_firsttransfer;

  //sys_clk_timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sys_clk_timer_s1_unreg_firsttransfer = ~(sys_clk_timer_s1_slavearbiterlockenable & sys_clk_timer_s1_any_continuerequest);

  //sys_clk_timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sys_clk_timer_s1_reg_firsttransfer <= 1'b1;
      else if (sys_clk_timer_s1_begins_xfer)
          sys_clk_timer_s1_reg_firsttransfer <= sys_clk_timer_s1_unreg_firsttransfer;
    end


  //sys_clk_timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sys_clk_timer_s1_beginbursttransfer_internal = sys_clk_timer_s1_begins_xfer;

  //~sys_clk_timer_s1_write_n assignment, which is an e_mux
  assign sys_clk_timer_s1_write_n = ~(cpu_data_master_granted_sys_clk_timer_s1 & cpu_data_master_write);

  assign shifted_address_to_sys_clk_timer_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sys_clk_timer_s1_address mux, which is an e_mux
  assign sys_clk_timer_s1_address = shifted_address_to_sys_clk_timer_s1_from_cpu_data_master >> 2;

  //d1_sys_clk_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sys_clk_timer_s1_end_xfer <= 1;
      else 
        d1_sys_clk_timer_s1_end_xfer <= sys_clk_timer_s1_end_xfer;
    end


  //sys_clk_timer_s1_waits_for_read in a cycle, which is an e_mux
  assign sys_clk_timer_s1_waits_for_read = sys_clk_timer_s1_in_a_read_cycle & sys_clk_timer_s1_begins_xfer;

  //sys_clk_timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign sys_clk_timer_s1_in_a_read_cycle = cpu_data_master_granted_sys_clk_timer_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sys_clk_timer_s1_in_a_read_cycle;

  //sys_clk_timer_s1_waits_for_write in a cycle, which is an e_mux
  assign sys_clk_timer_s1_waits_for_write = sys_clk_timer_s1_in_a_write_cycle & 0;

  //sys_clk_timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign sys_clk_timer_s1_in_a_write_cycle = cpu_data_master_granted_sys_clk_timer_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sys_clk_timer_s1_in_a_write_cycle;

  assign wait_for_sys_clk_timer_s1_counter = 0;
  //assign sys_clk_timer_s1_irq_from_sa = sys_clk_timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sys_clk_timer_s1_irq_from_sa = sys_clk_timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sys_clk_timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_read,
                                         cpu_data_master_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         cpu_data_master_granted_sysid_control_slave,
                                         cpu_data_master_qualified_request_sysid_control_slave,
                                         cpu_data_master_read_data_valid_sysid_control_slave,
                                         cpu_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa,
                                         sysid_control_slave_reset_n
                                      )
;

  output           cpu_data_master_granted_sysid_control_slave;
  output           cpu_data_master_qualified_request_sysid_control_slave;
  output           cpu_data_master_read_data_valid_sysid_control_slave;
  output           cpu_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  output           sysid_control_slave_reset_n;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sysid_control_slave;
  wire             cpu_data_master_qualified_request_sysid_control_slave;
  wire             cpu_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_data_master_requests_sysid_control_slave;
  wire             cpu_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_sysid_control_slave_from_cpu_data_master;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg     [  2: 0] sysid_control_slave_arb_share_counter;
  wire    [  2: 0] sysid_control_slave_arb_share_counter_next_value;
  wire    [  2: 0] sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  wire             sysid_control_slave_reset_n;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign cpu_data_master_requests_sysid_control_slave = (({cpu_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h1881038) & (cpu_data_master_read | cpu_data_master_write)) & cpu_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = cpu_data_master_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //cpu/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //cpu/data_master sysid/control_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_sysid_control_slave = cpu_data_master_requests_sysid_control_slave;
  //master is always granted when requested
  assign cpu_data_master_granted_sysid_control_slave = cpu_data_master_qualified_request_sysid_control_slave;

  //cpu/data_master saved-grant sysid/control_slave, which is an e_assign
  assign cpu_data_master_saved_grant_sysid_control_slave = cpu_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_reset_n assignment, which is an e_assign
  assign sysid_control_slave_reset_n = reset_n;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  assign shifted_address_to_sysid_control_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = shifted_address_to_sysid_control_slave_from_cpu_data_master >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = cpu_data_master_granted_sysid_control_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = cpu_data_master_granted_sysid_control_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tri_state_bridge_avalon_slave_arbitrator (
                                                  // inputs:
                                                   clk,
                                                   cpu_data_master_address_to_slave,
                                                   cpu_data_master_byteenable,
                                                   cpu_data_master_dbs_address,
                                                   cpu_data_master_dbs_write_8,
                                                   cpu_data_master_no_byte_enables_and_last_term,
                                                   cpu_data_master_read,
                                                   cpu_data_master_write,
                                                   cpu_instruction_master_address_to_slave,
                                                   cpu_instruction_master_dbs_address,
                                                   cpu_instruction_master_latency_counter,
                                                   cpu_instruction_master_read,
                                                   cpu_instruction_master_read_data_valid_sdram_s1_shift_register,
                                                   reset_n,

                                                  // outputs:
                                                   cpu_data_master_byteenable_ext_flash_s1,
                                                   cpu_data_master_granted_ext_flash_s1,
                                                   cpu_data_master_qualified_request_ext_flash_s1,
                                                   cpu_data_master_read_data_valid_ext_flash_s1,
                                                   cpu_data_master_requests_ext_flash_s1,
                                                   cpu_instruction_master_granted_ext_flash_s1,
                                                   cpu_instruction_master_qualified_request_ext_flash_s1,
                                                   cpu_instruction_master_read_data_valid_ext_flash_s1,
                                                   cpu_instruction_master_requests_ext_flash_s1,
                                                   d1_tri_state_bridge_avalon_slave_end_xfer,
                                                   ext_flash_s1_wait_counter_eq_0,
                                                   ext_flash_s1_wait_counter_eq_1,
                                                   incoming_tri_state_bridge_data,
                                                   incoming_tri_state_bridge_data_with_Xs_converted_to_0,
                                                   registered_cpu_data_master_read_data_valid_ext_flash_s1,
                                                   select_n_to_the_ext_flash,
                                                   tri_state_bridge_address,
                                                   tri_state_bridge_data,
                                                   tri_state_bridge_readn,
                                                   write_n_to_the_ext_flash
                                                )
;

  output           cpu_data_master_byteenable_ext_flash_s1;
  output           cpu_data_master_granted_ext_flash_s1;
  output           cpu_data_master_qualified_request_ext_flash_s1;
  output           cpu_data_master_read_data_valid_ext_flash_s1;
  output           cpu_data_master_requests_ext_flash_s1;
  output           cpu_instruction_master_granted_ext_flash_s1;
  output           cpu_instruction_master_qualified_request_ext_flash_s1;
  output           cpu_instruction_master_read_data_valid_ext_flash_s1;
  output           cpu_instruction_master_requests_ext_flash_s1;
  output           d1_tri_state_bridge_avalon_slave_end_xfer;
  output           ext_flash_s1_wait_counter_eq_0;
  output           ext_flash_s1_wait_counter_eq_1;
  output  [  7: 0] incoming_tri_state_bridge_data;
  output  [  7: 0] incoming_tri_state_bridge_data_with_Xs_converted_to_0;
  output           registered_cpu_data_master_read_data_valid_ext_flash_s1;
  output           select_n_to_the_ext_flash;
  output  [ 21: 0] tri_state_bridge_address;
  inout   [  7: 0] tri_state_bridge_data;
  output           tri_state_bridge_readn;
  output           write_n_to_the_ext_flash;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [  7: 0] cpu_data_master_dbs_write_8;
  input            cpu_data_master_no_byte_enables_and_last_term;
  input            cpu_data_master_read;
  input            cpu_data_master_write;
  input   [ 24: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_byteenable_ext_flash_s1;
  wire             cpu_data_master_byteenable_ext_flash_s1_segment_0;
  wire             cpu_data_master_byteenable_ext_flash_s1_segment_1;
  wire             cpu_data_master_byteenable_ext_flash_s1_segment_2;
  wire             cpu_data_master_byteenable_ext_flash_s1_segment_3;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_ext_flash_s1;
  wire             cpu_data_master_qualified_request_ext_flash_s1;
  wire             cpu_data_master_read_data_valid_ext_flash_s1;
  reg     [  1: 0] cpu_data_master_read_data_valid_ext_flash_s1_shift_register;
  wire             cpu_data_master_read_data_valid_ext_flash_s1_shift_register_in;
  wire             cpu_data_master_requests_ext_flash_s1;
  wire             cpu_data_master_saved_grant_ext_flash_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_ext_flash_s1;
  wire             cpu_instruction_master_qualified_request_ext_flash_s1;
  wire             cpu_instruction_master_read_data_valid_ext_flash_s1;
  reg     [  1: 0] cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register_in;
  wire             cpu_instruction_master_requests_ext_flash_s1;
  wire             cpu_instruction_master_saved_grant_ext_flash_s1;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [  7: 0] d1_outgoing_tri_state_bridge_data /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
  reg              d1_tri_state_bridge_avalon_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_tri_state_bridge_avalon_slave;
  wire    [  1: 0] ext_flash_s1_counter_load_value;
  wire             ext_flash_s1_in_a_read_cycle;
  wire             ext_flash_s1_in_a_write_cycle;
  wire             ext_flash_s1_pretend_byte_enable;
  reg     [  1: 0] ext_flash_s1_wait_counter;
  wire             ext_flash_s1_wait_counter_eq_0;
  wire             ext_flash_s1_wait_counter_eq_1;
  wire             ext_flash_s1_waits_for_read;
  wire             ext_flash_s1_waits_for_write;
  wire             ext_flash_s1_with_write_latency;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [  7: 0] incoming_tri_state_bridge_data /* synthesis ALTERA_ATTRIBUTE = "FAST_INPUT_REGISTER=ON"  */;
  wire             incoming_tri_state_bridge_data_bit_0_is_x;
  wire             incoming_tri_state_bridge_data_bit_1_is_x;
  wire             incoming_tri_state_bridge_data_bit_2_is_x;
  wire             incoming_tri_state_bridge_data_bit_3_is_x;
  wire             incoming_tri_state_bridge_data_bit_4_is_x;
  wire             incoming_tri_state_bridge_data_bit_5_is_x;
  wire             incoming_tri_state_bridge_data_bit_6_is_x;
  wire             incoming_tri_state_bridge_data_bit_7_is_x;
  wire    [  7: 0] incoming_tri_state_bridge_data_with_Xs_converted_to_0;
  reg              last_cycle_cpu_data_master_granted_slave_ext_flash_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1;
  wire    [  7: 0] outgoing_tri_state_bridge_data;
  wire    [  1: 0] p1_cpu_data_master_read_data_valid_ext_flash_s1_shift_register;
  wire    [  1: 0] p1_cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register;
  wire             p1_select_n_to_the_ext_flash;
  wire    [ 21: 0] p1_tri_state_bridge_address;
  wire             p1_tri_state_bridge_readn;
  wire             p1_write_n_to_the_ext_flash;
  wire             registered_cpu_data_master_read_data_valid_ext_flash_s1;
  reg              select_n_to_the_ext_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             time_to_write;
  reg     [ 21: 0] tri_state_bridge_address /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             tri_state_bridge_avalon_slave_allgrants;
  wire             tri_state_bridge_avalon_slave_allow_new_arb_cycle;
  wire             tri_state_bridge_avalon_slave_any_bursting_master_saved_grant;
  wire             tri_state_bridge_avalon_slave_any_continuerequest;
  reg     [  1: 0] tri_state_bridge_avalon_slave_arb_addend;
  wire             tri_state_bridge_avalon_slave_arb_counter_enable;
  reg     [  2: 0] tri_state_bridge_avalon_slave_arb_share_counter;
  wire    [  2: 0] tri_state_bridge_avalon_slave_arb_share_counter_next_value;
  wire    [  2: 0] tri_state_bridge_avalon_slave_arb_share_set_values;
  wire    [  1: 0] tri_state_bridge_avalon_slave_arb_winner;
  wire             tri_state_bridge_avalon_slave_arbitration_holdoff_internal;
  wire             tri_state_bridge_avalon_slave_beginbursttransfer_internal;
  wire             tri_state_bridge_avalon_slave_begins_xfer;
  wire    [  3: 0] tri_state_bridge_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] tri_state_bridge_avalon_slave_chosen_master_rot_left;
  wire             tri_state_bridge_avalon_slave_end_xfer;
  wire             tri_state_bridge_avalon_slave_firsttransfer;
  wire    [  1: 0] tri_state_bridge_avalon_slave_grant_vector;
  wire    [  1: 0] tri_state_bridge_avalon_slave_master_qreq_vector;
  wire             tri_state_bridge_avalon_slave_non_bursting_master_requests;
  wire             tri_state_bridge_avalon_slave_read_pending;
  reg              tri_state_bridge_avalon_slave_reg_firsttransfer;
  reg     [  1: 0] tri_state_bridge_avalon_slave_saved_chosen_master_vector;
  reg              tri_state_bridge_avalon_slave_slavearbiterlockenable;
  wire             tri_state_bridge_avalon_slave_slavearbiterlockenable2;
  wire             tri_state_bridge_avalon_slave_unreg_firsttransfer;
  wire             tri_state_bridge_avalon_slave_write_pending;
  wire    [  7: 0] tri_state_bridge_data;
  reg              tri_state_bridge_readn /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             wait_for_ext_flash_s1_counter;
  reg              write_n_to_the_ext_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~tri_state_bridge_avalon_slave_end_xfer;
    end


  assign tri_state_bridge_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_ext_flash_s1 | cpu_instruction_master_qualified_request_ext_flash_s1));
  assign cpu_data_master_requests_ext_flash_s1 = ({cpu_data_master_address_to_slave[24 : 22] , 22'b0} == 25'h1400000) & (cpu_data_master_read | cpu_data_master_write);
  //~select_n_to_the_ext_flash of type chipselect to ~p1_select_n_to_the_ext_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_ext_flash <= ~0;
      else 
        select_n_to_the_ext_flash <= p1_select_n_to_the_ext_flash;
    end


  assign tri_state_bridge_avalon_slave_write_pending = 0;
  //tri_state_bridge/avalon_slave read pending calc, which is an e_assign
  assign tri_state_bridge_avalon_slave_read_pending = 0;

  //registered rdv signal_name registered_cpu_data_master_read_data_valid_ext_flash_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_ext_flash_s1 = cpu_data_master_read_data_valid_ext_flash_s1_shift_register[0];

  //tri_state_bridge_avalon_slave_arb_share_counter set values, which is an e_mux
  assign tri_state_bridge_avalon_slave_arb_share_set_values = (cpu_data_master_granted_ext_flash_s1)? 4 :
    (cpu_instruction_master_granted_ext_flash_s1)? 4 :
    (cpu_data_master_granted_ext_flash_s1)? 4 :
    (cpu_instruction_master_granted_ext_flash_s1)? 4 :
    1;

  //tri_state_bridge_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign tri_state_bridge_avalon_slave_non_bursting_master_requests = cpu_data_master_requests_ext_flash_s1 |
    cpu_instruction_master_requests_ext_flash_s1 |
    cpu_data_master_requests_ext_flash_s1 |
    cpu_instruction_master_requests_ext_flash_s1;

  //tri_state_bridge_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign tri_state_bridge_avalon_slave_any_bursting_master_saved_grant = 0;

  //tri_state_bridge_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign tri_state_bridge_avalon_slave_arb_share_counter_next_value = tri_state_bridge_avalon_slave_firsttransfer ? (tri_state_bridge_avalon_slave_arb_share_set_values - 1) : |tri_state_bridge_avalon_slave_arb_share_counter ? (tri_state_bridge_avalon_slave_arb_share_counter - 1) : 0;

  //tri_state_bridge_avalon_slave_allgrants all slave grants, which is an e_mux
  assign tri_state_bridge_avalon_slave_allgrants = (|tri_state_bridge_avalon_slave_grant_vector) |
    (|tri_state_bridge_avalon_slave_grant_vector) |
    (|tri_state_bridge_avalon_slave_grant_vector) |
    (|tri_state_bridge_avalon_slave_grant_vector);

  //tri_state_bridge_avalon_slave_end_xfer assignment, which is an e_assign
  assign tri_state_bridge_avalon_slave_end_xfer = ~(ext_flash_s1_waits_for_read | ext_flash_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_tri_state_bridge_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_tri_state_bridge_avalon_slave = tri_state_bridge_avalon_slave_end_xfer & (~tri_state_bridge_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //tri_state_bridge_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign tri_state_bridge_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_tri_state_bridge_avalon_slave & tri_state_bridge_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_tri_state_bridge_avalon_slave & ~tri_state_bridge_avalon_slave_non_bursting_master_requests);

  //tri_state_bridge_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_avalon_slave_arb_share_counter <= 0;
      else if (tri_state_bridge_avalon_slave_arb_counter_enable)
          tri_state_bridge_avalon_slave_arb_share_counter <= tri_state_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //tri_state_bridge_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|tri_state_bridge_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_tri_state_bridge_avalon_slave) | (end_xfer_arb_share_counter_term_tri_state_bridge_avalon_slave & ~tri_state_bridge_avalon_slave_non_bursting_master_requests))
          tri_state_bridge_avalon_slave_slavearbiterlockenable <= |tri_state_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //cpu/data_master tri_state_bridge/avalon_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = tri_state_bridge_avalon_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //tri_state_bridge_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign tri_state_bridge_avalon_slave_slavearbiterlockenable2 = |tri_state_bridge_avalon_slave_arb_share_counter_next_value;

  //cpu/data_master tri_state_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = tri_state_bridge_avalon_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master tri_state_bridge/avalon_slave arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = tri_state_bridge_avalon_slave_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master tri_state_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = tri_state_bridge_avalon_slave_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted ext_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1 <= cpu_instruction_master_saved_grant_ext_flash_s1 ? 1 : (tri_state_bridge_avalon_slave_arbitration_holdoff_internal | ~cpu_instruction_master_requests_ext_flash_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_ext_flash_s1 & cpu_instruction_master_requests_ext_flash_s1;

  //tri_state_bridge_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign tri_state_bridge_avalon_slave_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_ext_flash_s1 = cpu_data_master_requests_ext_flash_s1 & ~((cpu_data_master_read & (tri_state_bridge_avalon_slave_write_pending | (tri_state_bridge_avalon_slave_read_pending) | (|cpu_data_master_read_data_valid_ext_flash_s1_shift_register))) | ((tri_state_bridge_avalon_slave_read_pending | cpu_data_master_no_byte_enables_and_last_term | !cpu_data_master_byteenable_ext_flash_s1) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_ext_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_ext_flash_s1_shift_register_in = cpu_data_master_granted_ext_flash_s1 & cpu_data_master_read & ~ext_flash_s1_waits_for_read & ~(|cpu_data_master_read_data_valid_ext_flash_s1_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_ext_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_ext_flash_s1_shift_register = {cpu_data_master_read_data_valid_ext_flash_s1_shift_register, cpu_data_master_read_data_valid_ext_flash_s1_shift_register_in};

  //cpu_data_master_read_data_valid_ext_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_ext_flash_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_ext_flash_s1_shift_register <= p1_cpu_data_master_read_data_valid_ext_flash_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_ext_flash_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_ext_flash_s1 = cpu_data_master_read_data_valid_ext_flash_s1_shift_register[1];

  //tri_state_bridge_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_tri_state_bridge_data <= 0;
      else 
        incoming_tri_state_bridge_data <= tri_state_bridge_data;
    end


  //ext_flash_s1_with_write_latency assignment, which is an e_assign
  assign ext_flash_s1_with_write_latency = in_a_write_cycle & (cpu_data_master_qualified_request_ext_flash_s1 | cpu_instruction_master_qualified_request_ext_flash_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (ext_flash_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_tri_state_bridge_data register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_tri_state_bridge_data <= 0;
      else 
        d1_outgoing_tri_state_bridge_data <= outgoing_tri_state_bridge_data;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else 
        d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_tri_state_bridge_data tristate driver, which is an e_assign
  assign tri_state_bridge_data = (d1_in_a_write_cycle)? d1_outgoing_tri_state_bridge_data:{8{1'bz}};

  //outgoing_tri_state_bridge_data mux, which is an e_mux
  assign outgoing_tri_state_bridge_data = cpu_data_master_dbs_write_8;

  assign cpu_instruction_master_requests_ext_flash_s1 = (({cpu_instruction_master_address_to_slave[24 : 22] , 22'b0} == 25'h1400000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted ext_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_ext_flash_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_ext_flash_s1 <= cpu_data_master_saved_grant_ext_flash_s1 ? 1 : (tri_state_bridge_avalon_slave_arbitration_holdoff_internal | ~cpu_data_master_requests_ext_flash_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_ext_flash_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_ext_flash_s1 & cpu_data_master_requests_ext_flash_s1;

  assign cpu_instruction_master_qualified_request_ext_flash_s1 = cpu_instruction_master_requests_ext_flash_s1 & ~((cpu_instruction_master_read & (tri_state_bridge_avalon_slave_write_pending | (tri_state_bridge_avalon_slave_read_pending) | (2 < cpu_instruction_master_latency_counter) | (|cpu_instruction_master_read_data_valid_sdram_s1_shift_register))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register_in = cpu_instruction_master_granted_ext_flash_s1 & cpu_instruction_master_read & ~ext_flash_s1_waits_for_read;

  //shift register p1 cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register = {cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register, cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_ext_flash_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_ext_flash_s1 = cpu_instruction_master_read_data_valid_ext_flash_s1_shift_register[1];

  //allow new arb cycle for tri_state_bridge/avalon_slave, which is an e_assign
  assign tri_state_bridge_avalon_slave_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for ext_flash/s1, which is an e_assign
  assign tri_state_bridge_avalon_slave_master_qreq_vector[0] = cpu_instruction_master_qualified_request_ext_flash_s1;

  //cpu/instruction_master grant ext_flash/s1, which is an e_assign
  assign cpu_instruction_master_granted_ext_flash_s1 = tri_state_bridge_avalon_slave_grant_vector[0];

  //cpu/instruction_master saved-grant ext_flash/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_ext_flash_s1 = tri_state_bridge_avalon_slave_arb_winner[0] && cpu_instruction_master_requests_ext_flash_s1;

  //cpu/data_master assignment into master qualified-requests vector for ext_flash/s1, which is an e_assign
  assign tri_state_bridge_avalon_slave_master_qreq_vector[1] = cpu_data_master_qualified_request_ext_flash_s1;

  //cpu/data_master grant ext_flash/s1, which is an e_assign
  assign cpu_data_master_granted_ext_flash_s1 = tri_state_bridge_avalon_slave_grant_vector[1];

  //cpu/data_master saved-grant ext_flash/s1, which is an e_assign
  assign cpu_data_master_saved_grant_ext_flash_s1 = tri_state_bridge_avalon_slave_arb_winner[1] && cpu_data_master_requests_ext_flash_s1;

  //tri_state_bridge/avalon_slave chosen-master double-vector, which is an e_assign
  assign tri_state_bridge_avalon_slave_chosen_master_double_vector = {tri_state_bridge_avalon_slave_master_qreq_vector, tri_state_bridge_avalon_slave_master_qreq_vector} & ({~tri_state_bridge_avalon_slave_master_qreq_vector, ~tri_state_bridge_avalon_slave_master_qreq_vector} + tri_state_bridge_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign tri_state_bridge_avalon_slave_arb_winner = (tri_state_bridge_avalon_slave_allow_new_arb_cycle & | tri_state_bridge_avalon_slave_grant_vector) ? tri_state_bridge_avalon_slave_grant_vector : tri_state_bridge_avalon_slave_saved_chosen_master_vector;

  //saved tri_state_bridge_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_avalon_slave_saved_chosen_master_vector <= 0;
      else if (tri_state_bridge_avalon_slave_allow_new_arb_cycle)
          tri_state_bridge_avalon_slave_saved_chosen_master_vector <= |tri_state_bridge_avalon_slave_grant_vector ? tri_state_bridge_avalon_slave_grant_vector : tri_state_bridge_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign tri_state_bridge_avalon_slave_grant_vector = {(tri_state_bridge_avalon_slave_chosen_master_double_vector[1] | tri_state_bridge_avalon_slave_chosen_master_double_vector[3]),
    (tri_state_bridge_avalon_slave_chosen_master_double_vector[0] | tri_state_bridge_avalon_slave_chosen_master_double_vector[2])};

  //tri_state_bridge/avalon_slave chosen master rotated left, which is an e_assign
  assign tri_state_bridge_avalon_slave_chosen_master_rot_left = (tri_state_bridge_avalon_slave_arb_winner << 1) ? (tri_state_bridge_avalon_slave_arb_winner << 1) : 1;

  //tri_state_bridge/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_avalon_slave_arb_addend <= 1;
      else if (|tri_state_bridge_avalon_slave_grant_vector)
          tri_state_bridge_avalon_slave_arb_addend <= tri_state_bridge_avalon_slave_end_xfer? tri_state_bridge_avalon_slave_chosen_master_rot_left : tri_state_bridge_avalon_slave_grant_vector;
    end


  assign p1_select_n_to_the_ext_flash = ~(cpu_data_master_granted_ext_flash_s1 | cpu_instruction_master_granted_ext_flash_s1);
  //tri_state_bridge_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_avalon_slave_firsttransfer = tri_state_bridge_avalon_slave_begins_xfer ? tri_state_bridge_avalon_slave_unreg_firsttransfer : tri_state_bridge_avalon_slave_reg_firsttransfer;

  //tri_state_bridge_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_avalon_slave_unreg_firsttransfer = ~(tri_state_bridge_avalon_slave_slavearbiterlockenable & tri_state_bridge_avalon_slave_any_continuerequest);

  //tri_state_bridge_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (tri_state_bridge_avalon_slave_begins_xfer)
          tri_state_bridge_avalon_slave_reg_firsttransfer <= tri_state_bridge_avalon_slave_unreg_firsttransfer;
    end


  //tri_state_bridge_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign tri_state_bridge_avalon_slave_beginbursttransfer_internal = tri_state_bridge_avalon_slave_begins_xfer;

  //tri_state_bridge_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign tri_state_bridge_avalon_slave_arbitration_holdoff_internal = tri_state_bridge_avalon_slave_begins_xfer & tri_state_bridge_avalon_slave_firsttransfer;

  //~tri_state_bridge_readn of type read to ~p1_tri_state_bridge_readn, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_readn <= ~0;
      else 
        tri_state_bridge_readn <= p1_tri_state_bridge_readn;
    end


  //~p1_tri_state_bridge_readn assignment, which is an e_mux
  assign p1_tri_state_bridge_readn = ~((cpu_data_master_granted_ext_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_ext_flash_s1 & cpu_instruction_master_read));

  //~write_n_to_the_ext_flash of type write to ~p1_write_n_to_the_ext_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          write_n_to_the_ext_flash <= ~0;
      else 
        write_n_to_the_ext_flash <= p1_write_n_to_the_ext_flash;
    end


  //~p1_write_n_to_the_ext_flash assignment, which is an e_mux
  assign p1_write_n_to_the_ext_flash = ~(((cpu_data_master_granted_ext_flash_s1 & cpu_data_master_write)) & ext_flash_s1_pretend_byte_enable);

  //tri_state_bridge_address of type address to p1_tri_state_bridge_address, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_address <= 0;
      else 
        tri_state_bridge_address <= p1_tri_state_bridge_address;
    end


  //p1_tri_state_bridge_address mux, which is an e_mux
  assign p1_tri_state_bridge_address = (cpu_data_master_granted_ext_flash_s1)? ({cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1 : 0]}) :
    ({cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1 : 0]});

  //d1_tri_state_bridge_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tri_state_bridge_avalon_slave_end_xfer <= 1;
      else 
        d1_tri_state_bridge_avalon_slave_end_xfer <= tri_state_bridge_avalon_slave_end_xfer;
    end


  //ext_flash_s1_wait_counter_eq_1 assignment, which is an e_assign
  assign ext_flash_s1_wait_counter_eq_1 = ext_flash_s1_wait_counter == 1;

  //ext_flash_s1_waits_for_read in a cycle, which is an e_mux
  assign ext_flash_s1_waits_for_read = ext_flash_s1_in_a_read_cycle & wait_for_ext_flash_s1_counter;

  //ext_flash_s1_in_a_read_cycle assignment, which is an e_assign
  assign ext_flash_s1_in_a_read_cycle = (cpu_data_master_granted_ext_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_ext_flash_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = ext_flash_s1_in_a_read_cycle;

  //ext_flash_s1_waits_for_write in a cycle, which is an e_mux
  assign ext_flash_s1_waits_for_write = ext_flash_s1_in_a_write_cycle & wait_for_ext_flash_s1_counter;

  //ext_flash_s1_in_a_write_cycle assignment, which is an e_assign
  assign ext_flash_s1_in_a_write_cycle = cpu_data_master_granted_ext_flash_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = ext_flash_s1_in_a_write_cycle;

  assign ext_flash_s1_wait_counter_eq_0 = ext_flash_s1_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          ext_flash_s1_wait_counter <= 0;
      else 
        ext_flash_s1_wait_counter <= ext_flash_s1_counter_load_value;
    end


  assign ext_flash_s1_counter_load_value = ((ext_flash_s1_in_a_read_cycle & tri_state_bridge_avalon_slave_begins_xfer))? 3 :
    ((ext_flash_s1_in_a_write_cycle & tri_state_bridge_avalon_slave_begins_xfer))? 3 :
    (~ext_flash_s1_wait_counter_eq_0)? ext_flash_s1_wait_counter - 1 :
    0;

  assign wait_for_ext_flash_s1_counter = tri_state_bridge_avalon_slave_begins_xfer | ~ext_flash_s1_wait_counter_eq_0;
  //ext_flash_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  assign ext_flash_s1_pretend_byte_enable = (cpu_data_master_granted_ext_flash_s1)? cpu_data_master_byteenable_ext_flash_s1 :
    -1;

  assign {cpu_data_master_byteenable_ext_flash_s1_segment_3,
cpu_data_master_byteenable_ext_flash_s1_segment_2,
cpu_data_master_byteenable_ext_flash_s1_segment_1,
cpu_data_master_byteenable_ext_flash_s1_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_ext_flash_s1 = ((cpu_data_master_dbs_address[1 : 0] == 0))? cpu_data_master_byteenable_ext_flash_s1_segment_0 :
    ((cpu_data_master_dbs_address[1 : 0] == 1))? cpu_data_master_byteenable_ext_flash_s1_segment_1 :
    ((cpu_data_master_dbs_address[1 : 0] == 2))? cpu_data_master_byteenable_ext_flash_s1_segment_2 :
    cpu_data_master_byteenable_ext_flash_s1_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //incoming_tri_state_bridge_data_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_data_bit_0_is_x = ^(incoming_tri_state_bridge_data[0]) === 1'bx;

  //Crush incoming_tri_state_bridge_data_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_data_with_Xs_converted_to_0[0] = incoming_tri_state_bridge_data_bit_0_is_x ? 1'b0 : incoming_tri_state_bridge_data[0];

  //incoming_tri_state_bridge_data_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_data_bit_1_is_x = ^(incoming_tri_state_bridge_data[1]) === 1'bx;

  //Crush incoming_tri_state_bridge_data_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_data_with_Xs_converted_to_0[1] = incoming_tri_state_bridge_data_bit_1_is_x ? 1'b0 : incoming_tri_state_bridge_data[1];

  //incoming_tri_state_bridge_data_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_data_bit_2_is_x = ^(incoming_tri_state_bridge_data[2]) === 1'bx;

  //Crush incoming_tri_state_bridge_data_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_data_with_Xs_converted_to_0[2] = incoming_tri_state_bridge_data_bit_2_is_x ? 1'b0 : incoming_tri_state_bridge_data[2];

  //incoming_tri_state_bridge_data_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_data_bit_3_is_x = ^(incoming_tri_state_bridge_data[3]) === 1'bx;

  //Crush incoming_tri_state_bridge_data_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_data_with_Xs_converted_to_0[3] = incoming_tri_state_bridge_data_bit_3_is_x ? 1'b0 : incoming_tri_state_bridge_data[3];

  //incoming_tri_state_bridge_data_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_data_bit_4_is_x = ^(incoming_tri_state_bridge_data[4]) === 1'bx;

  //Crush incoming_tri_state_bridge_data_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_data_with_Xs_converted_to_0[4] = incoming_tri_state_bridge_data_bit_4_is_x ? 1'b0 : incoming_tri_state_bridge_data[4];

  //incoming_tri_state_bridge_data_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_data_bit_5_is_x = ^(incoming_tri_state_bridge_data[5]) === 1'bx;

  //Crush incoming_tri_state_bridge_data_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_data_with_Xs_converted_to_0[5] = incoming_tri_state_bridge_data_bit_5_is_x ? 1'b0 : incoming_tri_state_bridge_data[5];

  //incoming_tri_state_bridge_data_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_data_bit_6_is_x = ^(incoming_tri_state_bridge_data[6]) === 1'bx;

  //Crush incoming_tri_state_bridge_data_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_data_with_Xs_converted_to_0[6] = incoming_tri_state_bridge_data_bit_6_is_x ? 1'b0 : incoming_tri_state_bridge_data[6];

  //incoming_tri_state_bridge_data_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_tri_state_bridge_data_bit_7_is_x = ^(incoming_tri_state_bridge_data[7]) === 1'bx;

  //Crush incoming_tri_state_bridge_data_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_tri_state_bridge_data_with_Xs_converted_to_0[7] = incoming_tri_state_bridge_data_bit_7_is_x ? 1'b0 : incoming_tri_state_bridge_data[7];

  //ext_flash/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_ext_flash_s1 + cpu_instruction_master_granted_ext_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_ext_flash_s1 + cpu_instruction_master_saved_grant_ext_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_tri_state_bridge_data_with_Xs_converted_to_0 = incoming_tri_state_bridge_data;
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tri_state_bridge_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module vga_controller_s1_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_data_master_address_to_slave,
                                       cpu_data_master_read,
                                       cpu_data_master_waitrequest,
                                       cpu_data_master_write,
                                       cpu_data_master_writedata,
                                       reset_n,
                                       vga_controller_s1_readdata,

                                      // outputs:
                                       cpu_data_master_granted_vga_controller_s1,
                                       cpu_data_master_qualified_request_vga_controller_s1,
                                       cpu_data_master_read_data_valid_vga_controller_s1,
                                       cpu_data_master_requests_vga_controller_s1,
                                       d1_vga_controller_s1_end_xfer,
                                       vga_controller_s1_address,
                                       vga_controller_s1_chipselect,
                                       vga_controller_s1_readdata_from_sa,
                                       vga_controller_s1_reset_n,
                                       vga_controller_s1_write,
                                       vga_controller_s1_writedata
                                    )
;

  output           cpu_data_master_granted_vga_controller_s1;
  output           cpu_data_master_qualified_request_vga_controller_s1;
  output           cpu_data_master_read_data_valid_vga_controller_s1;
  output           cpu_data_master_requests_vga_controller_s1;
  output           d1_vga_controller_s1_end_xfer;
  output  [  1: 0] vga_controller_s1_address;
  output           vga_controller_s1_chipselect;
  output  [ 31: 0] vga_controller_s1_readdata_from_sa;
  output           vga_controller_s1_reset_n;
  output           vga_controller_s1_write;
  output  [ 31: 0] vga_controller_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input   [ 31: 0] vga_controller_s1_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_vga_controller_s1;
  wire             cpu_data_master_qualified_request_vga_controller_s1;
  wire             cpu_data_master_read_data_valid_vga_controller_s1;
  wire             cpu_data_master_requests_vga_controller_s1;
  wire             cpu_data_master_saved_grant_vga_controller_s1;
  reg              d1_reasons_to_wait;
  reg              d1_vga_controller_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_vga_controller_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_vga_controller_s1_from_cpu_data_master;
  wire    [  1: 0] vga_controller_s1_address;
  wire             vga_controller_s1_allgrants;
  wire             vga_controller_s1_allow_new_arb_cycle;
  wire             vga_controller_s1_any_bursting_master_saved_grant;
  wire             vga_controller_s1_any_continuerequest;
  wire             vga_controller_s1_arb_counter_enable;
  reg     [  2: 0] vga_controller_s1_arb_share_counter;
  wire    [  2: 0] vga_controller_s1_arb_share_counter_next_value;
  wire    [  2: 0] vga_controller_s1_arb_share_set_values;
  wire             vga_controller_s1_beginbursttransfer_internal;
  wire             vga_controller_s1_begins_xfer;
  wire             vga_controller_s1_chipselect;
  wire             vga_controller_s1_end_xfer;
  wire             vga_controller_s1_firsttransfer;
  wire             vga_controller_s1_grant_vector;
  wire             vga_controller_s1_in_a_read_cycle;
  wire             vga_controller_s1_in_a_write_cycle;
  wire             vga_controller_s1_master_qreq_vector;
  wire             vga_controller_s1_non_bursting_master_requests;
  wire    [ 31: 0] vga_controller_s1_readdata_from_sa;
  reg              vga_controller_s1_reg_firsttransfer;
  wire             vga_controller_s1_reset_n;
  reg              vga_controller_s1_slavearbiterlockenable;
  wire             vga_controller_s1_slavearbiterlockenable2;
  wire             vga_controller_s1_unreg_firsttransfer;
  wire             vga_controller_s1_waits_for_read;
  wire             vga_controller_s1_waits_for_write;
  wire             vga_controller_s1_write;
  wire    [ 31: 0] vga_controller_s1_writedata;
  wire             wait_for_vga_controller_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~vga_controller_s1_end_xfer;
    end


  assign vga_controller_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_vga_controller_s1));
  //assign vga_controller_s1_readdata_from_sa = vga_controller_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign vga_controller_s1_readdata_from_sa = vga_controller_s1_readdata;

  assign cpu_data_master_requests_vga_controller_s1 = ({cpu_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1881020) & (cpu_data_master_read | cpu_data_master_write);
  //vga_controller_s1_arb_share_counter set values, which is an e_mux
  assign vga_controller_s1_arb_share_set_values = 1;

  //vga_controller_s1_non_bursting_master_requests mux, which is an e_mux
  assign vga_controller_s1_non_bursting_master_requests = cpu_data_master_requests_vga_controller_s1;

  //vga_controller_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign vga_controller_s1_any_bursting_master_saved_grant = 0;

  //vga_controller_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign vga_controller_s1_arb_share_counter_next_value = vga_controller_s1_firsttransfer ? (vga_controller_s1_arb_share_set_values - 1) : |vga_controller_s1_arb_share_counter ? (vga_controller_s1_arb_share_counter - 1) : 0;

  //vga_controller_s1_allgrants all slave grants, which is an e_mux
  assign vga_controller_s1_allgrants = |vga_controller_s1_grant_vector;

  //vga_controller_s1_end_xfer assignment, which is an e_assign
  assign vga_controller_s1_end_xfer = ~(vga_controller_s1_waits_for_read | vga_controller_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_vga_controller_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_vga_controller_s1 = vga_controller_s1_end_xfer & (~vga_controller_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //vga_controller_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign vga_controller_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_vga_controller_s1 & vga_controller_s1_allgrants) | (end_xfer_arb_share_counter_term_vga_controller_s1 & ~vga_controller_s1_non_bursting_master_requests);

  //vga_controller_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_controller_s1_arb_share_counter <= 0;
      else if (vga_controller_s1_arb_counter_enable)
          vga_controller_s1_arb_share_counter <= vga_controller_s1_arb_share_counter_next_value;
    end


  //vga_controller_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_controller_s1_slavearbiterlockenable <= 0;
      else if ((|vga_controller_s1_master_qreq_vector & end_xfer_arb_share_counter_term_vga_controller_s1) | (end_xfer_arb_share_counter_term_vga_controller_s1 & ~vga_controller_s1_non_bursting_master_requests))
          vga_controller_s1_slavearbiterlockenable <= |vga_controller_s1_arb_share_counter_next_value;
    end


  //cpu/data_master vga_controller/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = vga_controller_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //vga_controller_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign vga_controller_s1_slavearbiterlockenable2 = |vga_controller_s1_arb_share_counter_next_value;

  //cpu/data_master vga_controller/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = vga_controller_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //vga_controller_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign vga_controller_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_vga_controller_s1 = cpu_data_master_requests_vga_controller_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //vga_controller_s1_writedata mux, which is an e_mux
  assign vga_controller_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_vga_controller_s1 = cpu_data_master_qualified_request_vga_controller_s1;

  //cpu/data_master saved-grant vga_controller/s1, which is an e_assign
  assign cpu_data_master_saved_grant_vga_controller_s1 = cpu_data_master_requests_vga_controller_s1;

  //allow new arb cycle for vga_controller/s1, which is an e_assign
  assign vga_controller_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign vga_controller_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign vga_controller_s1_master_qreq_vector = 1;

  //vga_controller_s1_reset_n assignment, which is an e_assign
  assign vga_controller_s1_reset_n = reset_n;

  assign vga_controller_s1_chipselect = cpu_data_master_granted_vga_controller_s1;
  //vga_controller_s1_firsttransfer first transaction, which is an e_assign
  assign vga_controller_s1_firsttransfer = vga_controller_s1_begins_xfer ? vga_controller_s1_unreg_firsttransfer : vga_controller_s1_reg_firsttransfer;

  //vga_controller_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign vga_controller_s1_unreg_firsttransfer = ~(vga_controller_s1_slavearbiterlockenable & vga_controller_s1_any_continuerequest);

  //vga_controller_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_controller_s1_reg_firsttransfer <= 1'b1;
      else if (vga_controller_s1_begins_xfer)
          vga_controller_s1_reg_firsttransfer <= vga_controller_s1_unreg_firsttransfer;
    end


  //vga_controller_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign vga_controller_s1_beginbursttransfer_internal = vga_controller_s1_begins_xfer;

  //vga_controller_s1_write assignment, which is an e_mux
  assign vga_controller_s1_write = cpu_data_master_granted_vga_controller_s1 & cpu_data_master_write;

  assign shifted_address_to_vga_controller_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //vga_controller_s1_address mux, which is an e_mux
  assign vga_controller_s1_address = shifted_address_to_vga_controller_s1_from_cpu_data_master >> 2;

  //d1_vga_controller_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_vga_controller_s1_end_xfer <= 1;
      else 
        d1_vga_controller_s1_end_xfer <= vga_controller_s1_end_xfer;
    end


  //vga_controller_s1_waits_for_read in a cycle, which is an e_mux
  assign vga_controller_s1_waits_for_read = vga_controller_s1_in_a_read_cycle & vga_controller_s1_begins_xfer;

  //vga_controller_s1_in_a_read_cycle assignment, which is an e_assign
  assign vga_controller_s1_in_a_read_cycle = cpu_data_master_granted_vga_controller_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = vga_controller_s1_in_a_read_cycle;

  //vga_controller_s1_waits_for_write in a cycle, which is an e_mux
  assign vga_controller_s1_waits_for_write = vga_controller_s1_in_a_write_cycle & 0;

  //vga_controller_s1_in_a_write_cycle assignment, which is an e_assign
  assign vga_controller_s1_in_a_write_cycle = cpu_data_master_granted_vga_controller_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = vga_controller_s1_in_a_write_cycle;

  assign wait_for_vga_controller_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //vga_controller/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module vga_controller_m1_arbitrator (
                                      // inputs:
                                       clk,
                                       d1_sdram_s1_end_xfer,
                                       reset_n,
                                       sdram_s1_readdata_from_sa,
                                       sdram_s1_waitrequest_from_sa,
                                       vga_controller_m1_address,
                                       vga_controller_m1_granted_sdram_s1,
                                       vga_controller_m1_qualified_request_sdram_s1,
                                       vga_controller_m1_read,
                                       vga_controller_m1_read_data_valid_sdram_s1,
                                       vga_controller_m1_read_data_valid_sdram_s1_shift_register,
                                       vga_controller_m1_requests_sdram_s1,

                                      // outputs:
                                       vga_controller_m1_address_to_slave,
                                       vga_controller_m1_dbs_address,
                                       vga_controller_m1_latency_counter,
                                       vga_controller_m1_readdata,
                                       vga_controller_m1_readdatavalid,
                                       vga_controller_m1_waitrequest
                                    )
;

  output  [ 31: 0] vga_controller_m1_address_to_slave;
  output  [  1: 0] vga_controller_m1_dbs_address;
  output           vga_controller_m1_latency_counter;
  output  [ 31: 0] vga_controller_m1_readdata;
  output           vga_controller_m1_readdatavalid;
  output           vga_controller_m1_waitrequest;
  input            clk;
  input            d1_sdram_s1_end_xfer;
  input            reset_n;
  input   [ 15: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;
  input   [ 31: 0] vga_controller_m1_address;
  input            vga_controller_m1_granted_sdram_s1;
  input            vga_controller_m1_qualified_request_sdram_s1;
  input            vga_controller_m1_read;
  input            vga_controller_m1_read_data_valid_sdram_s1;
  input            vga_controller_m1_read_data_valid_sdram_s1_shift_register;
  input            vga_controller_m1_requests_sdram_s1;

  reg              active_and_waiting_last_time;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire             latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             p1_vga_controller_m1_latency_counter;
  wire             pre_dbs_count_enable;
  wire             pre_flush_vga_controller_m1_readdatavalid;
  wire             r_0;
  reg     [ 31: 0] vga_controller_m1_address_last_time;
  wire    [ 31: 0] vga_controller_m1_address_to_slave;
  reg     [  1: 0] vga_controller_m1_dbs_address;
  wire    [  1: 0] vga_controller_m1_dbs_increment;
  reg     [  1: 0] vga_controller_m1_dbs_rdv_counter;
  wire    [  1: 0] vga_controller_m1_dbs_rdv_counter_inc;
  wire             vga_controller_m1_is_granted_some_slave;
  reg              vga_controller_m1_latency_counter;
  wire    [  1: 0] vga_controller_m1_next_dbs_rdv_counter;
  reg              vga_controller_m1_read_but_no_slave_selected;
  reg              vga_controller_m1_read_last_time;
  wire    [ 31: 0] vga_controller_m1_readdata;
  wire             vga_controller_m1_readdatavalid;
  wire             vga_controller_m1_run;
  wire             vga_controller_m1_waitrequest;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (vga_controller_m1_qualified_request_sdram_s1 | ~vga_controller_m1_requests_sdram_s1) & (vga_controller_m1_granted_sdram_s1 | ~vga_controller_m1_qualified_request_sdram_s1) & ((~vga_controller_m1_qualified_request_sdram_s1 | ~vga_controller_m1_read | (1 & ~sdram_s1_waitrequest_from_sa & (vga_controller_m1_dbs_address[1]) & vga_controller_m1_read)));

  //cascaded wait assignment, which is an e_assign
  assign vga_controller_m1_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign vga_controller_m1_address_to_slave = {9'b1,
    vga_controller_m1_address[22 : 0]};

  //vga_controller_m1_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_controller_m1_read_but_no_slave_selected <= 0;
      else 
        vga_controller_m1_read_but_no_slave_selected <= vga_controller_m1_read & vga_controller_m1_run & ~vga_controller_m1_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign vga_controller_m1_is_granted_some_slave = vga_controller_m1_granted_sdram_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_vga_controller_m1_readdatavalid = vga_controller_m1_read_data_valid_sdram_s1 & dbs_rdv_counter_overflow;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign vga_controller_m1_readdatavalid = vga_controller_m1_read_but_no_slave_selected |
    pre_flush_vga_controller_m1_readdatavalid;

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = sdram_s1_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((vga_controller_m1_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //vga_controller/m1 readdata mux, which is an e_mux
  assign vga_controller_m1_readdata = {sdram_s1_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0};

  //actual waitrequest port, which is an e_assign
  assign vga_controller_m1_waitrequest = ~vga_controller_m1_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_controller_m1_latency_counter <= 0;
      else 
        vga_controller_m1_latency_counter <= p1_vga_controller_m1_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_vga_controller_m1_latency_counter = ((vga_controller_m1_run & vga_controller_m1_read))? latency_load_value :
    (vga_controller_m1_latency_counter)? vga_controller_m1_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //dbs count increment, which is an e_mux
  assign vga_controller_m1_dbs_increment = (vga_controller_m1_requests_sdram_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = vga_controller_m1_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = vga_controller_m1_dbs_address + vga_controller_m1_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_controller_m1_dbs_address <= 0;
      else if (dbs_count_enable)
          vga_controller_m1_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign vga_controller_m1_next_dbs_rdv_counter = vga_controller_m1_dbs_rdv_counter + vga_controller_m1_dbs_rdv_counter_inc;

  //vga_controller_m1_rdv_inc_mux, which is an e_mux
  assign vga_controller_m1_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = vga_controller_m1_read_data_valid_sdram_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_controller_m1_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          vga_controller_m1_dbs_rdv_counter <= vga_controller_m1_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = vga_controller_m1_dbs_rdv_counter[1] & ~vga_controller_m1_next_dbs_rdv_counter[1];

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = vga_controller_m1_granted_sdram_s1 & vga_controller_m1_read & 1 & 1 & ~sdram_s1_waitrequest_from_sa;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //vga_controller_m1_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_controller_m1_address_last_time <= 0;
      else 
        vga_controller_m1_address_last_time <= vga_controller_m1_address;
    end


  //vga_controller/m1 waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= vga_controller_m1_waitrequest & (vga_controller_m1_read);
    end


  //vga_controller_m1_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (vga_controller_m1_address != vga_controller_m1_address_last_time))
        begin
          $write("%0d ns: vga_controller_m1_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //vga_controller_m1_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_controller_m1_read_last_time <= 0;
      else 
        vga_controller_m1_read_last_time <= vga_controller_m1_read;
    end


  //vga_controller_m1_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (vga_controller_m1_read != vga_controller_m1_read_last_time))
        begin
          $write("%0d ns: vga_controller_m1_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module vga_ref_2C35_clock_0_in_arbitrator (
                                            // inputs:
                                             clk,
                                             cpu_data_master_address_to_slave,
                                             cpu_data_master_byteenable,
                                             cpu_data_master_dbs_address,
                                             cpu_data_master_dbs_write_8,
                                             cpu_data_master_no_byte_enables_and_last_term,
                                             cpu_data_master_read,
                                             cpu_data_master_waitrequest,
                                             cpu_data_master_write,
                                             reset_n,
                                             vga_ref_2C35_clock_0_in_endofpacket,
                                             vga_ref_2C35_clock_0_in_readdata,
                                             vga_ref_2C35_clock_0_in_waitrequest,

                                            // outputs:
                                             cpu_data_master_byteenable_vga_ref_2C35_clock_0_in,
                                             cpu_data_master_granted_vga_ref_2C35_clock_0_in,
                                             cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in,
                                             cpu_data_master_read_data_valid_vga_ref_2C35_clock_0_in,
                                             cpu_data_master_requests_vga_ref_2C35_clock_0_in,
                                             d1_vga_ref_2C35_clock_0_in_end_xfer,
                                             vga_ref_2C35_clock_0_in_address,
                                             vga_ref_2C35_clock_0_in_endofpacket_from_sa,
                                             vga_ref_2C35_clock_0_in_nativeaddress,
                                             vga_ref_2C35_clock_0_in_read,
                                             vga_ref_2C35_clock_0_in_readdata_from_sa,
                                             vga_ref_2C35_clock_0_in_reset_n,
                                             vga_ref_2C35_clock_0_in_waitrequest_from_sa,
                                             vga_ref_2C35_clock_0_in_write,
                                             vga_ref_2C35_clock_0_in_writedata
                                          )
;

  output           cpu_data_master_byteenable_vga_ref_2C35_clock_0_in;
  output           cpu_data_master_granted_vga_ref_2C35_clock_0_in;
  output           cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in;
  output           cpu_data_master_read_data_valid_vga_ref_2C35_clock_0_in;
  output           cpu_data_master_requests_vga_ref_2C35_clock_0_in;
  output           d1_vga_ref_2C35_clock_0_in_end_xfer;
  output           vga_ref_2C35_clock_0_in_address;
  output           vga_ref_2C35_clock_0_in_endofpacket_from_sa;
  output           vga_ref_2C35_clock_0_in_nativeaddress;
  output           vga_ref_2C35_clock_0_in_read;
  output  [  7: 0] vga_ref_2C35_clock_0_in_readdata_from_sa;
  output           vga_ref_2C35_clock_0_in_reset_n;
  output           vga_ref_2C35_clock_0_in_waitrequest_from_sa;
  output           vga_ref_2C35_clock_0_in_write;
  output  [  7: 0] vga_ref_2C35_clock_0_in_writedata;
  input            clk;
  input   [ 24: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [  7: 0] cpu_data_master_dbs_write_8;
  input            cpu_data_master_no_byte_enables_and_last_term;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input            reset_n;
  input            vga_ref_2C35_clock_0_in_endofpacket;
  input   [  7: 0] vga_ref_2C35_clock_0_in_readdata;
  input            vga_ref_2C35_clock_0_in_waitrequest;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_byteenable_vga_ref_2C35_clock_0_in;
  wire             cpu_data_master_byteenable_vga_ref_2C35_clock_0_in_segment_0;
  wire             cpu_data_master_byteenable_vga_ref_2C35_clock_0_in_segment_1;
  wire             cpu_data_master_byteenable_vga_ref_2C35_clock_0_in_segment_2;
  wire             cpu_data_master_byteenable_vga_ref_2C35_clock_0_in_segment_3;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_vga_ref_2C35_clock_0_in;
  wire             cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in;
  wire             cpu_data_master_read_data_valid_vga_ref_2C35_clock_0_in;
  wire             cpu_data_master_requests_vga_ref_2C35_clock_0_in;
  wire             cpu_data_master_saved_grant_vga_ref_2C35_clock_0_in;
  reg              d1_reasons_to_wait;
  reg              d1_vga_ref_2C35_clock_0_in_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_vga_ref_2C35_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             vga_ref_2C35_clock_0_in_address;
  wire             vga_ref_2C35_clock_0_in_allgrants;
  wire             vga_ref_2C35_clock_0_in_allow_new_arb_cycle;
  wire             vga_ref_2C35_clock_0_in_any_bursting_master_saved_grant;
  wire             vga_ref_2C35_clock_0_in_any_continuerequest;
  wire             vga_ref_2C35_clock_0_in_arb_counter_enable;
  reg     [  2: 0] vga_ref_2C35_clock_0_in_arb_share_counter;
  wire    [  2: 0] vga_ref_2C35_clock_0_in_arb_share_counter_next_value;
  wire    [  2: 0] vga_ref_2C35_clock_0_in_arb_share_set_values;
  wire             vga_ref_2C35_clock_0_in_beginbursttransfer_internal;
  wire             vga_ref_2C35_clock_0_in_begins_xfer;
  wire             vga_ref_2C35_clock_0_in_end_xfer;
  wire             vga_ref_2C35_clock_0_in_endofpacket_from_sa;
  wire             vga_ref_2C35_clock_0_in_firsttransfer;
  wire             vga_ref_2C35_clock_0_in_grant_vector;
  wire             vga_ref_2C35_clock_0_in_in_a_read_cycle;
  wire             vga_ref_2C35_clock_0_in_in_a_write_cycle;
  wire             vga_ref_2C35_clock_0_in_master_qreq_vector;
  wire             vga_ref_2C35_clock_0_in_nativeaddress;
  wire             vga_ref_2C35_clock_0_in_non_bursting_master_requests;
  wire             vga_ref_2C35_clock_0_in_pretend_byte_enable;
  wire             vga_ref_2C35_clock_0_in_read;
  wire    [  7: 0] vga_ref_2C35_clock_0_in_readdata_from_sa;
  reg              vga_ref_2C35_clock_0_in_reg_firsttransfer;
  wire             vga_ref_2C35_clock_0_in_reset_n;
  reg              vga_ref_2C35_clock_0_in_slavearbiterlockenable;
  wire             vga_ref_2C35_clock_0_in_slavearbiterlockenable2;
  wire             vga_ref_2C35_clock_0_in_unreg_firsttransfer;
  wire             vga_ref_2C35_clock_0_in_waitrequest_from_sa;
  wire             vga_ref_2C35_clock_0_in_waits_for_read;
  wire             vga_ref_2C35_clock_0_in_waits_for_write;
  wire             vga_ref_2C35_clock_0_in_write;
  wire    [  7: 0] vga_ref_2C35_clock_0_in_writedata;
  wire             wait_for_vga_ref_2C35_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~vga_ref_2C35_clock_0_in_end_xfer;
    end


  assign vga_ref_2C35_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in));
  //assign vga_ref_2C35_clock_0_in_readdata_from_sa = vga_ref_2C35_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign vga_ref_2C35_clock_0_in_readdata_from_sa = vga_ref_2C35_clock_0_in_readdata;

  assign cpu_data_master_requests_vga_ref_2C35_clock_0_in = ({cpu_data_master_address_to_slave[24 : 1] , 1'b0} == 25'h1881040) & (cpu_data_master_read | cpu_data_master_write);
  //assign vga_ref_2C35_clock_0_in_waitrequest_from_sa = vga_ref_2C35_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign vga_ref_2C35_clock_0_in_waitrequest_from_sa = vga_ref_2C35_clock_0_in_waitrequest;

  //vga_ref_2C35_clock_0_in_arb_share_counter set values, which is an e_mux
  assign vga_ref_2C35_clock_0_in_arb_share_set_values = (cpu_data_master_granted_vga_ref_2C35_clock_0_in)? 4 :
    1;

  //vga_ref_2C35_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign vga_ref_2C35_clock_0_in_non_bursting_master_requests = cpu_data_master_requests_vga_ref_2C35_clock_0_in;

  //vga_ref_2C35_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign vga_ref_2C35_clock_0_in_any_bursting_master_saved_grant = 0;

  //vga_ref_2C35_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign vga_ref_2C35_clock_0_in_arb_share_counter_next_value = vga_ref_2C35_clock_0_in_firsttransfer ? (vga_ref_2C35_clock_0_in_arb_share_set_values - 1) : |vga_ref_2C35_clock_0_in_arb_share_counter ? (vga_ref_2C35_clock_0_in_arb_share_counter - 1) : 0;

  //vga_ref_2C35_clock_0_in_allgrants all slave grants, which is an e_mux
  assign vga_ref_2C35_clock_0_in_allgrants = |vga_ref_2C35_clock_0_in_grant_vector;

  //vga_ref_2C35_clock_0_in_end_xfer assignment, which is an e_assign
  assign vga_ref_2C35_clock_0_in_end_xfer = ~(vga_ref_2C35_clock_0_in_waits_for_read | vga_ref_2C35_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_vga_ref_2C35_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_vga_ref_2C35_clock_0_in = vga_ref_2C35_clock_0_in_end_xfer & (~vga_ref_2C35_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //vga_ref_2C35_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign vga_ref_2C35_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_vga_ref_2C35_clock_0_in & vga_ref_2C35_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_vga_ref_2C35_clock_0_in & ~vga_ref_2C35_clock_0_in_non_bursting_master_requests);

  //vga_ref_2C35_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_ref_2C35_clock_0_in_arb_share_counter <= 0;
      else if (vga_ref_2C35_clock_0_in_arb_counter_enable)
          vga_ref_2C35_clock_0_in_arb_share_counter <= vga_ref_2C35_clock_0_in_arb_share_counter_next_value;
    end


  //vga_ref_2C35_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_ref_2C35_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|vga_ref_2C35_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_vga_ref_2C35_clock_0_in) | (end_xfer_arb_share_counter_term_vga_ref_2C35_clock_0_in & ~vga_ref_2C35_clock_0_in_non_bursting_master_requests))
          vga_ref_2C35_clock_0_in_slavearbiterlockenable <= |vga_ref_2C35_clock_0_in_arb_share_counter_next_value;
    end


  //cpu/data_master vga_ref_2C35_clock_0/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = vga_ref_2C35_clock_0_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //vga_ref_2C35_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign vga_ref_2C35_clock_0_in_slavearbiterlockenable2 = |vga_ref_2C35_clock_0_in_arb_share_counter_next_value;

  //cpu/data_master vga_ref_2C35_clock_0/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = vga_ref_2C35_clock_0_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //vga_ref_2C35_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign vga_ref_2C35_clock_0_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in = cpu_data_master_requests_vga_ref_2C35_clock_0_in & ~((cpu_data_master_read & (~cpu_data_master_waitrequest)) | ((~cpu_data_master_waitrequest | cpu_data_master_no_byte_enables_and_last_term | !cpu_data_master_byteenable_vga_ref_2C35_clock_0_in) & cpu_data_master_write));
  //vga_ref_2C35_clock_0_in_writedata mux, which is an e_mux
  assign vga_ref_2C35_clock_0_in_writedata = cpu_data_master_dbs_write_8;

  //assign vga_ref_2C35_clock_0_in_endofpacket_from_sa = vga_ref_2C35_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign vga_ref_2C35_clock_0_in_endofpacket_from_sa = vga_ref_2C35_clock_0_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_vga_ref_2C35_clock_0_in = cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in;

  //cpu/data_master saved-grant vga_ref_2C35_clock_0/in, which is an e_assign
  assign cpu_data_master_saved_grant_vga_ref_2C35_clock_0_in = cpu_data_master_requests_vga_ref_2C35_clock_0_in;

  //allow new arb cycle for vga_ref_2C35_clock_0/in, which is an e_assign
  assign vga_ref_2C35_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign vga_ref_2C35_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign vga_ref_2C35_clock_0_in_master_qreq_vector = 1;

  //vga_ref_2C35_clock_0_in_reset_n assignment, which is an e_assign
  assign vga_ref_2C35_clock_0_in_reset_n = reset_n;

  //vga_ref_2C35_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign vga_ref_2C35_clock_0_in_firsttransfer = vga_ref_2C35_clock_0_in_begins_xfer ? vga_ref_2C35_clock_0_in_unreg_firsttransfer : vga_ref_2C35_clock_0_in_reg_firsttransfer;

  //vga_ref_2C35_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign vga_ref_2C35_clock_0_in_unreg_firsttransfer = ~(vga_ref_2C35_clock_0_in_slavearbiterlockenable & vga_ref_2C35_clock_0_in_any_continuerequest);

  //vga_ref_2C35_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_ref_2C35_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (vga_ref_2C35_clock_0_in_begins_xfer)
          vga_ref_2C35_clock_0_in_reg_firsttransfer <= vga_ref_2C35_clock_0_in_unreg_firsttransfer;
    end


  //vga_ref_2C35_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign vga_ref_2C35_clock_0_in_beginbursttransfer_internal = vga_ref_2C35_clock_0_in_begins_xfer;

  //vga_ref_2C35_clock_0_in_read assignment, which is an e_mux
  assign vga_ref_2C35_clock_0_in_read = cpu_data_master_granted_vga_ref_2C35_clock_0_in & cpu_data_master_read;

  //vga_ref_2C35_clock_0_in_write assignment, which is an e_mux
  assign vga_ref_2C35_clock_0_in_write = ((cpu_data_master_granted_vga_ref_2C35_clock_0_in & cpu_data_master_write)) & vga_ref_2C35_clock_0_in_pretend_byte_enable;

  //vga_ref_2C35_clock_0_in_address mux, which is an e_mux
  assign vga_ref_2C35_clock_0_in_address = {cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1 : 0]};

  //slaveid vga_ref_2C35_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign vga_ref_2C35_clock_0_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_vga_ref_2C35_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_vga_ref_2C35_clock_0_in_end_xfer <= 1;
      else 
        d1_vga_ref_2C35_clock_0_in_end_xfer <= vga_ref_2C35_clock_0_in_end_xfer;
    end


  //vga_ref_2C35_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign vga_ref_2C35_clock_0_in_waits_for_read = vga_ref_2C35_clock_0_in_in_a_read_cycle & vga_ref_2C35_clock_0_in_waitrequest_from_sa;

  //vga_ref_2C35_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign vga_ref_2C35_clock_0_in_in_a_read_cycle = cpu_data_master_granted_vga_ref_2C35_clock_0_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = vga_ref_2C35_clock_0_in_in_a_read_cycle;

  //vga_ref_2C35_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign vga_ref_2C35_clock_0_in_waits_for_write = vga_ref_2C35_clock_0_in_in_a_write_cycle & vga_ref_2C35_clock_0_in_waitrequest_from_sa;

  //vga_ref_2C35_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign vga_ref_2C35_clock_0_in_in_a_write_cycle = cpu_data_master_granted_vga_ref_2C35_clock_0_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = vga_ref_2C35_clock_0_in_in_a_write_cycle;

  assign wait_for_vga_ref_2C35_clock_0_in_counter = 0;
  //vga_ref_2C35_clock_0_in_pretend_byte_enable byte enable port mux, which is an e_mux
  assign vga_ref_2C35_clock_0_in_pretend_byte_enable = (cpu_data_master_granted_vga_ref_2C35_clock_0_in)? cpu_data_master_byteenable_vga_ref_2C35_clock_0_in :
    -1;

  assign {cpu_data_master_byteenable_vga_ref_2C35_clock_0_in_segment_3,
cpu_data_master_byteenable_vga_ref_2C35_clock_0_in_segment_2,
cpu_data_master_byteenable_vga_ref_2C35_clock_0_in_segment_1,
cpu_data_master_byteenable_vga_ref_2C35_clock_0_in_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_vga_ref_2C35_clock_0_in = ((cpu_data_master_dbs_address[1 : 0] == 0))? cpu_data_master_byteenable_vga_ref_2C35_clock_0_in_segment_0 :
    ((cpu_data_master_dbs_address[1 : 0] == 1))? cpu_data_master_byteenable_vga_ref_2C35_clock_0_in_segment_1 :
    ((cpu_data_master_dbs_address[1 : 0] == 2))? cpu_data_master_byteenable_vga_ref_2C35_clock_0_in_segment_2 :
    cpu_data_master_byteenable_vga_ref_2C35_clock_0_in_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //vga_ref_2C35_clock_0/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module vga_ref_2C35_clock_0_out_arbitrator (
                                             // inputs:
                                              clk,
                                              clocks_avalon_clocks_slave_readdata_from_sa,
                                              d1_clocks_avalon_clocks_slave_end_xfer,
                                              reset_n,
                                              vga_ref_2C35_clock_0_out_address,
                                              vga_ref_2C35_clock_0_out_granted_clocks_avalon_clocks_slave,
                                              vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave,
                                              vga_ref_2C35_clock_0_out_read,
                                              vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave,
                                              vga_ref_2C35_clock_0_out_requests_clocks_avalon_clocks_slave,
                                              vga_ref_2C35_clock_0_out_write,
                                              vga_ref_2C35_clock_0_out_writedata,

                                             // outputs:
                                              vga_ref_2C35_clock_0_out_address_to_slave,
                                              vga_ref_2C35_clock_0_out_readdata,
                                              vga_ref_2C35_clock_0_out_reset_n,
                                              vga_ref_2C35_clock_0_out_waitrequest
                                           )
;

  output           vga_ref_2C35_clock_0_out_address_to_slave;
  output  [  7: 0] vga_ref_2C35_clock_0_out_readdata;
  output           vga_ref_2C35_clock_0_out_reset_n;
  output           vga_ref_2C35_clock_0_out_waitrequest;
  input            clk;
  input   [  7: 0] clocks_avalon_clocks_slave_readdata_from_sa;
  input            d1_clocks_avalon_clocks_slave_end_xfer;
  input            reset_n;
  input            vga_ref_2C35_clock_0_out_address;
  input            vga_ref_2C35_clock_0_out_granted_clocks_avalon_clocks_slave;
  input            vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave;
  input            vga_ref_2C35_clock_0_out_read;
  input            vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave;
  input            vga_ref_2C35_clock_0_out_requests_clocks_avalon_clocks_slave;
  input            vga_ref_2C35_clock_0_out_write;
  input   [  7: 0] vga_ref_2C35_clock_0_out_writedata;

  reg              active_and_waiting_last_time;
  wire             r_0;
  reg              vga_ref_2C35_clock_0_out_address_last_time;
  wire             vga_ref_2C35_clock_0_out_address_to_slave;
  reg              vga_ref_2C35_clock_0_out_read_last_time;
  wire    [  7: 0] vga_ref_2C35_clock_0_out_readdata;
  wire             vga_ref_2C35_clock_0_out_reset_n;
  wire             vga_ref_2C35_clock_0_out_run;
  wire             vga_ref_2C35_clock_0_out_waitrequest;
  reg              vga_ref_2C35_clock_0_out_write_last_time;
  reg     [  7: 0] vga_ref_2C35_clock_0_out_writedata_last_time;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave | vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave | ~vga_ref_2C35_clock_0_out_requests_clocks_avalon_clocks_slave) & ((~vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave | ~vga_ref_2C35_clock_0_out_read | (vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave & vga_ref_2C35_clock_0_out_read))) & ((~vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave | ~(vga_ref_2C35_clock_0_out_read | vga_ref_2C35_clock_0_out_write) | (1 & (vga_ref_2C35_clock_0_out_read | vga_ref_2C35_clock_0_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign vga_ref_2C35_clock_0_out_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign vga_ref_2C35_clock_0_out_address_to_slave = vga_ref_2C35_clock_0_out_address;

  //vga_ref_2C35_clock_0/out readdata mux, which is an e_mux
  assign vga_ref_2C35_clock_0_out_readdata = clocks_avalon_clocks_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign vga_ref_2C35_clock_0_out_waitrequest = ~vga_ref_2C35_clock_0_out_run;

  //vga_ref_2C35_clock_0_out_reset_n assignment, which is an e_assign
  assign vga_ref_2C35_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //vga_ref_2C35_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_ref_2C35_clock_0_out_address_last_time <= 0;
      else 
        vga_ref_2C35_clock_0_out_address_last_time <= vga_ref_2C35_clock_0_out_address;
    end


  //vga_ref_2C35_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= vga_ref_2C35_clock_0_out_waitrequest & (vga_ref_2C35_clock_0_out_read | vga_ref_2C35_clock_0_out_write);
    end


  //vga_ref_2C35_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (vga_ref_2C35_clock_0_out_address != vga_ref_2C35_clock_0_out_address_last_time))
        begin
          $write("%0d ns: vga_ref_2C35_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //vga_ref_2C35_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_ref_2C35_clock_0_out_read_last_time <= 0;
      else 
        vga_ref_2C35_clock_0_out_read_last_time <= vga_ref_2C35_clock_0_out_read;
    end


  //vga_ref_2C35_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (vga_ref_2C35_clock_0_out_read != vga_ref_2C35_clock_0_out_read_last_time))
        begin
          $write("%0d ns: vga_ref_2C35_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //vga_ref_2C35_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_ref_2C35_clock_0_out_write_last_time <= 0;
      else 
        vga_ref_2C35_clock_0_out_write_last_time <= vga_ref_2C35_clock_0_out_write;
    end


  //vga_ref_2C35_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (vga_ref_2C35_clock_0_out_write != vga_ref_2C35_clock_0_out_write_last_time))
        begin
          $write("%0d ns: vga_ref_2C35_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //vga_ref_2C35_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          vga_ref_2C35_clock_0_out_writedata_last_time <= 0;
      else 
        vga_ref_2C35_clock_0_out_writedata_last_time <= vga_ref_2C35_clock_0_out_writedata;
    end


  //vga_ref_2C35_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (vga_ref_2C35_clock_0_out_writedata != vga_ref_2C35_clock_0_out_writedata_last_time) & vga_ref_2C35_clock_0_out_write)
        begin
          $write("%0d ns: vga_ref_2C35_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module vga_ref_2C35_reset_clk_in_domain_synch_module (
                                                       // inputs:
                                                        clk,
                                                        data_in,
                                                        reset_n,

                                                       // outputs:
                                                        data_out
                                                     )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module vga_ref_2C35_reset_sys_clk_domain_synch_module (
                                                        // inputs:
                                                         clk,
                                                         data_in,
                                                         reset_n,

                                                        // outputs:
                                                         data_out
                                                      )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module vga_ref_2C35 (
                      // 1) global signals:
                       clk_in,
                       reset_n,
                       sdram_clk,
                       sys_clk,
                       vga_clk,

                      // the_sdram
                       zs_addr_from_the_sdram,
                       zs_ba_from_the_sdram,
                       zs_cas_n_from_the_sdram,
                       zs_cke_from_the_sdram,
                       zs_cs_n_from_the_sdram,
                       zs_dq_to_and_from_the_sdram,
                       zs_dqm_from_the_sdram,
                       zs_ras_n_from_the_sdram,
                       zs_we_n_from_the_sdram,

                      // the_sram
                       SRAM_ADDR_from_the_sram,
                       SRAM_CE_N_from_the_sram,
                       SRAM_DQ_to_and_from_the_sram,
                       SRAM_LB_N_from_the_sram,
                       SRAM_OE_N_from_the_sram,
                       SRAM_UB_N_from_the_sram,
                       SRAM_WE_N_from_the_sram,

                      // the_tri_state_bridge_avalon_slave
                       select_n_to_the_ext_flash,
                       tri_state_bridge_address,
                       tri_state_bridge_data,
                       tri_state_bridge_readn,
                       write_n_to_the_ext_flash,

                      // the_vga_controller
                       B_from_the_vga_controller,
                       G_from_the_vga_controller,
                       M1_from_the_vga_controller,
                       M2_from_the_vga_controller,
                       R_from_the_vga_controller,
                       blank_n_from_the_vga_controller,
                       hsync_from_the_vga_controller,
                       sync_n_from_the_vga_controller,
                       sync_t_from_the_vga_controller,
                       vga_clk_to_the_vga_controller,
                       vsync_from_the_vga_controller
                    )
;

  output  [  7: 0] B_from_the_vga_controller;
  output  [  7: 0] G_from_the_vga_controller;
  output           M1_from_the_vga_controller;
  output           M2_from_the_vga_controller;
  output  [  7: 0] R_from_the_vga_controller;
  output  [ 17: 0] SRAM_ADDR_from_the_sram;
  output           SRAM_CE_N_from_the_sram;
  inout   [ 15: 0] SRAM_DQ_to_and_from_the_sram;
  output           SRAM_LB_N_from_the_sram;
  output           SRAM_OE_N_from_the_sram;
  output           SRAM_UB_N_from_the_sram;
  output           SRAM_WE_N_from_the_sram;
  output           blank_n_from_the_vga_controller;
  output           hsync_from_the_vga_controller;
  output           sdram_clk;
  output           select_n_to_the_ext_flash;
  output           sync_n_from_the_vga_controller;
  output           sync_t_from_the_vga_controller;
  output           sys_clk;
  output  [ 21: 0] tri_state_bridge_address;
  inout   [  7: 0] tri_state_bridge_data;
  output           tri_state_bridge_readn;
  output           vga_clk;
  output           vsync_from_the_vga_controller;
  output           write_n_to_the_ext_flash;
  output  [ 11: 0] zs_addr_from_the_sdram;
  output  [  1: 0] zs_ba_from_the_sdram;
  output           zs_cas_n_from_the_sdram;
  output           zs_cke_from_the_sdram;
  output           zs_cs_n_from_the_sdram;
  inout   [ 15: 0] zs_dq_to_and_from_the_sdram;
  output  [  1: 0] zs_dqm_from_the_sdram;
  output           zs_ras_n_from_the_sdram;
  output           zs_we_n_from_the_sdram;
  input            clk_in;
  input            reset_n;
  input            vga_clk_to_the_vga_controller;

  wire    [  7: 0] B_from_the_vga_controller;
  wire    [  7: 0] G_from_the_vga_controller;
  wire             M1_from_the_vga_controller;
  wire             M2_from_the_vga_controller;
  wire    [  7: 0] R_from_the_vga_controller;
  wire    [ 17: 0] SRAM_ADDR_from_the_sram;
  wire             SRAM_CE_N_from_the_sram;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram;
  wire             SRAM_LB_N_from_the_sram;
  wire             SRAM_OE_N_from_the_sram;
  wire             SRAM_UB_N_from_the_sram;
  wire             SRAM_WE_N_from_the_sram;
  wire             blank_n_from_the_vga_controller;
  wire             clk_in_reset_n;
  wire             clocks_avalon_clocks_slave_address;
  wire    [  7: 0] clocks_avalon_clocks_slave_readdata;
  wire    [  7: 0] clocks_avalon_clocks_slave_readdata_from_sa;
  wire    [ 24: 0] cpu_data_master_address;
  wire    [ 24: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire             cpu_data_master_byteenable_ext_flash_s1;
  wire    [  1: 0] cpu_data_master_byteenable_sdram_s1;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_sram_slave;
  wire             cpu_data_master_byteenable_vga_ref_2C35_clock_0_in;
  wire    [  1: 0] cpu_data_master_dbs_address;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [  7: 0] cpu_data_master_dbs_write_8;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_ext_flash_s1;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_granted_sdram_s1;
  wire             cpu_data_master_granted_sram_avalon_sram_slave;
  wire             cpu_data_master_granted_sys_clk_timer_s1;
  wire             cpu_data_master_granted_sysid_control_slave;
  wire             cpu_data_master_granted_vga_controller_s1;
  wire             cpu_data_master_granted_vga_ref_2C35_clock_0_in;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_no_byte_enables_and_last_term;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_ext_flash_s1;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_sdram_s1;
  wire             cpu_data_master_qualified_request_sram_avalon_sram_slave;
  wire             cpu_data_master_qualified_request_sys_clk_timer_s1;
  wire             cpu_data_master_qualified_request_sysid_control_slave;
  wire             cpu_data_master_qualified_request_vga_controller_s1;
  wire             cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_ext_flash_s1;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_data_master_read_data_valid_sram_avalon_sram_slave;
  wire             cpu_data_master_read_data_valid_sram_avalon_sram_slave_shift_register;
  wire             cpu_data_master_read_data_valid_sys_clk_timer_s1;
  wire             cpu_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_data_master_read_data_valid_vga_controller_s1;
  wire             cpu_data_master_read_data_valid_vga_ref_2C35_clock_0_in;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_ext_flash_s1;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_sdram_s1;
  wire             cpu_data_master_requests_sram_avalon_sram_slave;
  wire             cpu_data_master_requests_sys_clk_timer_s1;
  wire             cpu_data_master_requests_sysid_control_slave;
  wire             cpu_data_master_requests_vga_controller_s1;
  wire             cpu_data_master_requests_vga_ref_2C35_clock_0_in;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 24: 0] cpu_instruction_master_address;
  wire    [ 24: 0] cpu_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_instruction_master_dbs_address;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_ext_flash_s1;
  wire             cpu_instruction_master_granted_sdram_s1;
  wire    [  1: 0] cpu_instruction_master_latency_counter;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_ext_flash_s1;
  wire             cpu_instruction_master_qualified_request_sdram_s1;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_ext_flash_s1;
  wire             cpu_instruction_master_read_data_valid_sdram_s1;
  wire             cpu_instruction_master_read_data_valid_sdram_s1_shift_register;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_ext_flash_s1;
  wire             cpu_instruction_master_requests_sdram_s1;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire             d1_clocks_avalon_clocks_slave_end_xfer;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_jtag_uart_avalon_jtag_slave_end_xfer;
  wire             d1_sdram_s1_end_xfer;
  wire             d1_sram_avalon_sram_slave_end_xfer;
  wire             d1_sys_clk_timer_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_tri_state_bridge_avalon_slave_end_xfer;
  wire             d1_vga_controller_s1_end_xfer;
  wire             d1_vga_ref_2C35_clock_0_in_end_xfer;
  wire             ext_flash_s1_wait_counter_eq_0;
  wire             ext_flash_s1_wait_counter_eq_1;
  wire             hsync_from_the_vga_controller;
  wire    [  7: 0] incoming_tri_state_bridge_data;
  wire    [  7: 0] incoming_tri_state_bridge_data_with_Xs_converted_to_0;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_irq;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  wire             jtag_uart_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire             out_clk_clocks_SDRAM_CLK;
  wire             out_clk_clocks_VGA_CLK;
  wire             out_clk_clocks_sys_clk;
  wire             registered_cpu_data_master_read_data_valid_ext_flash_s1;
  wire             reset_n_sources;
  wire             sdram_clk;
  wire    [ 21: 0] sdram_s1_address;
  wire    [  1: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire             sdram_s1_read_n;
  wire    [ 15: 0] sdram_s1_readdata;
  wire    [ 15: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid;
  wire             sdram_s1_reset_n;
  wire             sdram_s1_waitrequest;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_write_n;
  wire    [ 15: 0] sdram_s1_writedata;
  wire             select_n_to_the_ext_flash;
  wire    [ 17: 0] sram_avalon_sram_slave_address;
  wire    [  1: 0] sram_avalon_sram_slave_byteenable;
  wire             sram_avalon_sram_slave_read;
  wire    [ 15: 0] sram_avalon_sram_slave_readdata;
  wire    [ 15: 0] sram_avalon_sram_slave_readdata_from_sa;
  wire             sram_avalon_sram_slave_readdatavalid;
  wire             sram_avalon_sram_slave_reset;
  wire             sram_avalon_sram_slave_write;
  wire    [ 15: 0] sram_avalon_sram_slave_writedata;
  wire             sync_n_from_the_vga_controller;
  wire             sync_t_from_the_vga_controller;
  wire             sys_clk;
  wire             sys_clk_reset_n;
  wire    [  2: 0] sys_clk_timer_s1_address;
  wire             sys_clk_timer_s1_chipselect;
  wire             sys_clk_timer_s1_irq;
  wire             sys_clk_timer_s1_irq_from_sa;
  wire    [ 15: 0] sys_clk_timer_s1_readdata;
  wire    [ 15: 0] sys_clk_timer_s1_readdata_from_sa;
  wire             sys_clk_timer_s1_reset_n;
  wire             sys_clk_timer_s1_write_n;
  wire    [ 15: 0] sys_clk_timer_s1_writedata;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_clock;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             sysid_control_slave_reset_n;
  wire    [ 21: 0] tri_state_bridge_address;
  wire    [  7: 0] tri_state_bridge_data;
  wire             tri_state_bridge_readn;
  wire             vga_clk;
  wire    [ 31: 0] vga_controller_m1_address;
  wire    [ 31: 0] vga_controller_m1_address_to_slave;
  wire    [  1: 0] vga_controller_m1_dbs_address;
  wire             vga_controller_m1_granted_sdram_s1;
  wire             vga_controller_m1_latency_counter;
  wire             vga_controller_m1_qualified_request_sdram_s1;
  wire             vga_controller_m1_read;
  wire             vga_controller_m1_read_data_valid_sdram_s1;
  wire             vga_controller_m1_read_data_valid_sdram_s1_shift_register;
  wire    [ 31: 0] vga_controller_m1_readdata;
  wire             vga_controller_m1_readdatavalid;
  wire             vga_controller_m1_requests_sdram_s1;
  wire             vga_controller_m1_waitrequest;
  wire    [  1: 0] vga_controller_s1_address;
  wire             vga_controller_s1_chipselect;
  wire    [ 31: 0] vga_controller_s1_readdata;
  wire    [ 31: 0] vga_controller_s1_readdata_from_sa;
  wire             vga_controller_s1_reset_n;
  wire             vga_controller_s1_write;
  wire    [ 31: 0] vga_controller_s1_writedata;
  wire             vga_ref_2C35_clock_0_in_address;
  wire             vga_ref_2C35_clock_0_in_endofpacket;
  wire             vga_ref_2C35_clock_0_in_endofpacket_from_sa;
  wire             vga_ref_2C35_clock_0_in_nativeaddress;
  wire             vga_ref_2C35_clock_0_in_read;
  wire    [  7: 0] vga_ref_2C35_clock_0_in_readdata;
  wire    [  7: 0] vga_ref_2C35_clock_0_in_readdata_from_sa;
  wire             vga_ref_2C35_clock_0_in_reset_n;
  wire             vga_ref_2C35_clock_0_in_waitrequest;
  wire             vga_ref_2C35_clock_0_in_waitrequest_from_sa;
  wire             vga_ref_2C35_clock_0_in_write;
  wire    [  7: 0] vga_ref_2C35_clock_0_in_writedata;
  wire             vga_ref_2C35_clock_0_out_address;
  wire             vga_ref_2C35_clock_0_out_address_to_slave;
  wire             vga_ref_2C35_clock_0_out_endofpacket;
  wire             vga_ref_2C35_clock_0_out_granted_clocks_avalon_clocks_slave;
  wire             vga_ref_2C35_clock_0_out_nativeaddress;
  wire             vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave;
  wire             vga_ref_2C35_clock_0_out_read;
  wire             vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave;
  wire    [  7: 0] vga_ref_2C35_clock_0_out_readdata;
  wire             vga_ref_2C35_clock_0_out_requests_clocks_avalon_clocks_slave;
  wire             vga_ref_2C35_clock_0_out_reset_n;
  wire             vga_ref_2C35_clock_0_out_waitrequest;
  wire             vga_ref_2C35_clock_0_out_write;
  wire    [  7: 0] vga_ref_2C35_clock_0_out_writedata;
  wire             vsync_from_the_vga_controller;
  wire             write_n_to_the_ext_flash;
  wire    [ 11: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram;
  wire    [  1: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;
  clocks_avalon_clocks_slave_arbitrator the_clocks_avalon_clocks_slave
    (
      .clk                                                                   (clk_in),
      .clocks_avalon_clocks_slave_address                                    (clocks_avalon_clocks_slave_address),
      .clocks_avalon_clocks_slave_readdata                                   (clocks_avalon_clocks_slave_readdata),
      .clocks_avalon_clocks_slave_readdata_from_sa                           (clocks_avalon_clocks_slave_readdata_from_sa),
      .d1_clocks_avalon_clocks_slave_end_xfer                                (d1_clocks_avalon_clocks_slave_end_xfer),
      .reset_n                                                               (clk_in_reset_n),
      .vga_ref_2C35_clock_0_out_address_to_slave                             (vga_ref_2C35_clock_0_out_address_to_slave),
      .vga_ref_2C35_clock_0_out_granted_clocks_avalon_clocks_slave           (vga_ref_2C35_clock_0_out_granted_clocks_avalon_clocks_slave),
      .vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave (vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave),
      .vga_ref_2C35_clock_0_out_read                                         (vga_ref_2C35_clock_0_out_read),
      .vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave   (vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave),
      .vga_ref_2C35_clock_0_out_requests_clocks_avalon_clocks_slave          (vga_ref_2C35_clock_0_out_requests_clocks_avalon_clocks_slave),
      .vga_ref_2C35_clock_0_out_write                                        (vga_ref_2C35_clock_0_out_write)
    );

  //sdram_clk out_clk assignment, which is an e_assign
  assign sdram_clk = out_clk_clocks_SDRAM_CLK;

  //vga_clk out_clk assignment, which is an e_assign
  assign vga_clk = out_clk_clocks_VGA_CLK;

  //sys_clk out_clk assignment, which is an e_assign
  assign sys_clk = out_clk_clocks_sys_clk;

  clocks the_clocks
    (
      .CLOCK_50  (clk_in),
      .SDRAM_CLK (out_clk_clocks_SDRAM_CLK),
      .VGA_CLK   (out_clk_clocks_VGA_CLK),
      .address   (clocks_avalon_clocks_slave_address),
      .readdata  (clocks_avalon_clocks_slave_readdata),
      .sys_clk   (out_clk_clocks_sys_clk)
    );

  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                            (sys_clk),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                    (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                  (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module        (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module          (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_requests_cpu_jtag_debug_module                 (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_waitrequest                                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_data_master_writedata                                      (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_sdram_s1_shift_register (cpu_instruction_master_read_data_valid_sdram_s1_shift_register),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                  (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                            (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                               (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                               (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                              (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                 (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset_n                                  (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                             (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                     (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                    (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                        (sys_clk_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .clk                                                                   (sys_clk),
      .cpu_data_master_address                                               (cpu_data_master_address),
      .cpu_data_master_address_to_slave                                      (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable_ext_flash_s1                               (cpu_data_master_byteenable_ext_flash_s1),
      .cpu_data_master_byteenable_sdram_s1                                   (cpu_data_master_byteenable_sdram_s1),
      .cpu_data_master_byteenable_sram_avalon_sram_slave                     (cpu_data_master_byteenable_sram_avalon_sram_slave),
      .cpu_data_master_byteenable_vga_ref_2C35_clock_0_in                    (cpu_data_master_byteenable_vga_ref_2C35_clock_0_in),
      .cpu_data_master_dbs_address                                           (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                          (cpu_data_master_dbs_write_16),
      .cpu_data_master_dbs_write_8                                           (cpu_data_master_dbs_write_8),
      .cpu_data_master_granted_cpu_jtag_debug_module                         (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_ext_flash_s1                                  (cpu_data_master_granted_ext_flash_s1),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave                   (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_granted_sdram_s1                                      (cpu_data_master_granted_sdram_s1),
      .cpu_data_master_granted_sram_avalon_sram_slave                        (cpu_data_master_granted_sram_avalon_sram_slave),
      .cpu_data_master_granted_sys_clk_timer_s1                              (cpu_data_master_granted_sys_clk_timer_s1),
      .cpu_data_master_granted_sysid_control_slave                           (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_granted_vga_controller_s1                             (cpu_data_master_granted_vga_controller_s1),
      .cpu_data_master_granted_vga_ref_2C35_clock_0_in                       (cpu_data_master_granted_vga_ref_2C35_clock_0_in),
      .cpu_data_master_irq                                                   (cpu_data_master_irq),
      .cpu_data_master_no_byte_enables_and_last_term                         (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module               (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_ext_flash_s1                        (cpu_data_master_qualified_request_ext_flash_s1),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave         (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_sdram_s1                            (cpu_data_master_qualified_request_sdram_s1),
      .cpu_data_master_qualified_request_sram_avalon_sram_slave              (cpu_data_master_qualified_request_sram_avalon_sram_slave),
      .cpu_data_master_qualified_request_sys_clk_timer_s1                    (cpu_data_master_qualified_request_sys_clk_timer_s1),
      .cpu_data_master_qualified_request_sysid_control_slave                 (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_qualified_request_vga_controller_s1                   (cpu_data_master_qualified_request_vga_controller_s1),
      .cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in             (cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in),
      .cpu_data_master_read                                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module                 (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_ext_flash_s1                          (cpu_data_master_read_data_valid_ext_flash_s1),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave           (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read_data_valid_sdram_s1                              (cpu_data_master_read_data_valid_sdram_s1),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register               (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_read_data_valid_sram_avalon_sram_slave                (cpu_data_master_read_data_valid_sram_avalon_sram_slave),
      .cpu_data_master_read_data_valid_sram_avalon_sram_slave_shift_register (cpu_data_master_read_data_valid_sram_avalon_sram_slave_shift_register),
      .cpu_data_master_read_data_valid_sys_clk_timer_s1                      (cpu_data_master_read_data_valid_sys_clk_timer_s1),
      .cpu_data_master_read_data_valid_sysid_control_slave                   (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_read_data_valid_vga_controller_s1                     (cpu_data_master_read_data_valid_vga_controller_s1),
      .cpu_data_master_read_data_valid_vga_ref_2C35_clock_0_in               (cpu_data_master_read_data_valid_vga_ref_2C35_clock_0_in),
      .cpu_data_master_readdata                                              (cpu_data_master_readdata),
      .cpu_data_master_requests_cpu_jtag_debug_module                        (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_ext_flash_s1                                 (cpu_data_master_requests_ext_flash_s1),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave                  (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_sdram_s1                                     (cpu_data_master_requests_sdram_s1),
      .cpu_data_master_requests_sram_avalon_sram_slave                       (cpu_data_master_requests_sram_avalon_sram_slave),
      .cpu_data_master_requests_sys_clk_timer_s1                             (cpu_data_master_requests_sys_clk_timer_s1),
      .cpu_data_master_requests_sysid_control_slave                          (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_requests_vga_controller_s1                            (cpu_data_master_requests_vga_controller_s1),
      .cpu_data_master_requests_vga_ref_2C35_clock_0_in                      (cpu_data_master_requests_vga_ref_2C35_clock_0_in),
      .cpu_data_master_waitrequest                                           (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                 (cpu_data_master_write),
      .cpu_data_master_writedata                                             (cpu_data_master_writedata),
      .cpu_jtag_debug_module_readdata_from_sa                                (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                                     (d1_cpu_jtag_debug_module_end_xfer),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                               (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .d1_sdram_s1_end_xfer                                                  (d1_sdram_s1_end_xfer),
      .d1_sram_avalon_sram_slave_end_xfer                                    (d1_sram_avalon_sram_slave_end_xfer),
      .d1_sys_clk_timer_s1_end_xfer                                          (d1_sys_clk_timer_s1_end_xfer),
      .d1_sysid_control_slave_end_xfer                                       (d1_sysid_control_slave_end_xfer),
      .d1_tri_state_bridge_avalon_slave_end_xfer                             (d1_tri_state_bridge_avalon_slave_end_xfer),
      .d1_vga_controller_s1_end_xfer                                         (d1_vga_controller_s1_end_xfer),
      .d1_vga_ref_2C35_clock_0_in_end_xfer                                   (d1_vga_ref_2C35_clock_0_in_end_xfer),
      .ext_flash_s1_wait_counter_eq_0                                        (ext_flash_s1_wait_counter_eq_0),
      .ext_flash_s1_wait_counter_eq_1                                        (ext_flash_s1_wait_counter_eq_1),
      .incoming_tri_state_bridge_data_with_Xs_converted_to_0                 (incoming_tri_state_bridge_data_with_Xs_converted_to_0),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                               (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                          (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                       (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .registered_cpu_data_master_read_data_valid_ext_flash_s1               (registered_cpu_data_master_read_data_valid_ext_flash_s1),
      .reset_n                                                               (sys_clk_reset_n),
      .sdram_s1_readdata_from_sa                                             (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                          (sdram_s1_waitrequest_from_sa),
      .sram_avalon_sram_slave_readdata_from_sa                               (sram_avalon_sram_slave_readdata_from_sa),
      .sys_clk_timer_s1_irq_from_sa                                          (sys_clk_timer_s1_irq_from_sa),
      .sys_clk_timer_s1_readdata_from_sa                                     (sys_clk_timer_s1_readdata_from_sa),
      .sysid_control_slave_readdata_from_sa                                  (sysid_control_slave_readdata_from_sa),
      .vga_controller_s1_readdata_from_sa                                    (vga_controller_s1_readdata_from_sa),
      .vga_ref_2C35_clock_0_in_readdata_from_sa                              (vga_ref_2C35_clock_0_in_readdata_from_sa),
      .vga_ref_2C35_clock_0_in_waitrequest_from_sa                           (vga_ref_2C35_clock_0_in_waitrequest_from_sa)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .clk                                                            (sys_clk),
      .cpu_instruction_master_address                                 (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                             (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_ext_flash_s1                    (cpu_instruction_master_granted_ext_flash_s1),
      .cpu_instruction_master_granted_sdram_s1                        (cpu_instruction_master_granted_sdram_s1),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_ext_flash_s1          (cpu_instruction_master_qualified_request_ext_flash_s1),
      .cpu_instruction_master_qualified_request_sdram_s1              (cpu_instruction_master_qualified_request_sdram_s1),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_ext_flash_s1            (cpu_instruction_master_read_data_valid_ext_flash_s1),
      .cpu_instruction_master_read_data_valid_sdram_s1                (cpu_instruction_master_read_data_valid_sdram_s1),
      .cpu_instruction_master_read_data_valid_sdram_s1_shift_register (cpu_instruction_master_read_data_valid_sdram_s1_shift_register),
      .cpu_instruction_master_readdata                                (cpu_instruction_master_readdata),
      .cpu_instruction_master_readdatavalid                           (cpu_instruction_master_readdatavalid),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_ext_flash_s1                   (cpu_instruction_master_requests_ext_flash_s1),
      .cpu_instruction_master_requests_sdram_s1                       (cpu_instruction_master_requests_sdram_s1),
      .cpu_instruction_master_waitrequest                             (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .d1_sdram_s1_end_xfer                                           (d1_sdram_s1_end_xfer),
      .d1_tri_state_bridge_avalon_slave_end_xfer                      (d1_tri_state_bridge_avalon_slave_end_xfer),
      .ext_flash_s1_wait_counter_eq_0                                 (ext_flash_s1_wait_counter_eq_0),
      .ext_flash_s1_wait_counter_eq_1                                 (ext_flash_s1_wait_counter_eq_1),
      .incoming_tri_state_bridge_data                                 (incoming_tri_state_bridge_data),
      .reset_n                                                        (sys_clk_reset_n),
      .sdram_s1_readdata_from_sa                                      (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                   (sdram_s1_waitrequest_from_sa)
    );

  cpu the_cpu
    (
      .clk                                   (sys_clk),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_readdatavalid                       (cpu_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_jtag_debug_module_reset_n)
    );

  jtag_uart_avalon_jtag_slave_arbitrator the_jtag_uart_avalon_jtag_slave
    (
      .clk                                                           (sys_clk),
      .cpu_data_master_address_to_slave                              (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave           (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read                                          (cpu_data_master_read),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave   (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave          (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_waitrequest                                   (cpu_data_master_waitrequest),
      .cpu_data_master_write                                         (cpu_data_master_write),
      .cpu_data_master_writedata                                     (cpu_data_master_writedata),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                       (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .jtag_uart_avalon_jtag_slave_address                           (jtag_uart_avalon_jtag_slave_address),
      .jtag_uart_avalon_jtag_slave_chipselect                        (jtag_uart_avalon_jtag_slave_chipselect),
      .jtag_uart_avalon_jtag_slave_dataavailable                     (jtag_uart_avalon_jtag_slave_dataavailable),
      .jtag_uart_avalon_jtag_slave_dataavailable_from_sa             (jtag_uart_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_avalon_jtag_slave_irq                               (jtag_uart_avalon_jtag_slave_irq),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                       (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_read_n                            (jtag_uart_avalon_jtag_slave_read_n),
      .jtag_uart_avalon_jtag_slave_readdata                          (jtag_uart_avalon_jtag_slave_readdata),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                  (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_readyfordata                      (jtag_uart_avalon_jtag_slave_readyfordata),
      .jtag_uart_avalon_jtag_slave_readyfordata_from_sa              (jtag_uart_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_avalon_jtag_slave_reset_n                           (jtag_uart_avalon_jtag_slave_reset_n),
      .jtag_uart_avalon_jtag_slave_waitrequest                       (jtag_uart_avalon_jtag_slave_waitrequest),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa               (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_avalon_jtag_slave_write_n                           (jtag_uart_avalon_jtag_slave_write_n),
      .jtag_uart_avalon_jtag_slave_writedata                         (jtag_uart_avalon_jtag_slave_writedata),
      .reset_n                                                       (sys_clk_reset_n)
    );

  jtag_uart the_jtag_uart
    (
      .av_address     (jtag_uart_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_avalon_jtag_slave_writedata),
      .clk            (sys_clk),
      .dataavailable  (jtag_uart_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_avalon_jtag_slave_reset_n)
    );

  sdram_s1_arbitrator the_sdram_s1
    (
      .clk                                                            (sys_clk),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_sdram_s1                            (cpu_data_master_byteenable_sdram_s1),
      .cpu_data_master_dbs_address                                    (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                   (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_sdram_s1                               (cpu_data_master_granted_sdram_s1),
      .cpu_data_master_no_byte_enables_and_last_term                  (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_sdram_s1                     (cpu_data_master_qualified_request_sdram_s1),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sdram_s1                       (cpu_data_master_read_data_valid_sdram_s1),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register        (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_sdram_s1                              (cpu_data_master_requests_sdram_s1),
      .cpu_data_master_waitrequest                                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                             (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_sdram_s1                        (cpu_instruction_master_granted_sdram_s1),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_sdram_s1              (cpu_instruction_master_qualified_request_sdram_s1),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_sdram_s1                (cpu_instruction_master_read_data_valid_sdram_s1),
      .cpu_instruction_master_read_data_valid_sdram_s1_shift_register (cpu_instruction_master_read_data_valid_sdram_s1_shift_register),
      .cpu_instruction_master_requests_sdram_s1                       (cpu_instruction_master_requests_sdram_s1),
      .d1_sdram_s1_end_xfer                                           (d1_sdram_s1_end_xfer),
      .reset_n                                                        (sys_clk_reset_n),
      .sdram_s1_address                                               (sdram_s1_address),
      .sdram_s1_byteenable_n                                          (sdram_s1_byteenable_n),
      .sdram_s1_chipselect                                            (sdram_s1_chipselect),
      .sdram_s1_read_n                                                (sdram_s1_read_n),
      .sdram_s1_readdata                                              (sdram_s1_readdata),
      .sdram_s1_readdata_from_sa                                      (sdram_s1_readdata_from_sa),
      .sdram_s1_readdatavalid                                         (sdram_s1_readdatavalid),
      .sdram_s1_reset_n                                               (sdram_s1_reset_n),
      .sdram_s1_waitrequest                                           (sdram_s1_waitrequest),
      .sdram_s1_waitrequest_from_sa                                   (sdram_s1_waitrequest_from_sa),
      .sdram_s1_write_n                                               (sdram_s1_write_n),
      .sdram_s1_writedata                                             (sdram_s1_writedata),
      .vga_controller_m1_address_to_slave                             (vga_controller_m1_address_to_slave),
      .vga_controller_m1_dbs_address                                  (vga_controller_m1_dbs_address),
      .vga_controller_m1_granted_sdram_s1                             (vga_controller_m1_granted_sdram_s1),
      .vga_controller_m1_latency_counter                              (vga_controller_m1_latency_counter),
      .vga_controller_m1_qualified_request_sdram_s1                   (vga_controller_m1_qualified_request_sdram_s1),
      .vga_controller_m1_read                                         (vga_controller_m1_read),
      .vga_controller_m1_read_data_valid_sdram_s1                     (vga_controller_m1_read_data_valid_sdram_s1),
      .vga_controller_m1_read_data_valid_sdram_s1_shift_register      (vga_controller_m1_read_data_valid_sdram_s1_shift_register),
      .vga_controller_m1_requests_sdram_s1                            (vga_controller_m1_requests_sdram_s1)
    );

  sdram the_sdram
    (
      .az_addr        (sdram_s1_address),
      .az_be_n        (sdram_s1_byteenable_n),
      .az_cs          (sdram_s1_chipselect),
      .az_data        (sdram_s1_writedata),
      .az_rd_n        (sdram_s1_read_n),
      .az_wr_n        (sdram_s1_write_n),
      .clk            (sys_clk),
      .reset_n        (sdram_s1_reset_n),
      .za_data        (sdram_s1_readdata),
      .za_valid       (sdram_s1_readdatavalid),
      .za_waitrequest (sdram_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_sdram),
      .zs_ba          (zs_ba_from_the_sdram),
      .zs_cas_n       (zs_cas_n_from_the_sdram),
      .zs_cke         (zs_cke_from_the_sdram),
      .zs_cs_n        (zs_cs_n_from_the_sdram),
      .zs_dq          (zs_dq_to_and_from_the_sdram),
      .zs_dqm         (zs_dqm_from_the_sdram),
      .zs_ras_n       (zs_ras_n_from_the_sdram),
      .zs_we_n        (zs_we_n_from_the_sdram)
    );

  sram_avalon_sram_slave_arbitrator the_sram_avalon_sram_slave
    (
      .clk                                                                   (sys_clk),
      .cpu_data_master_address_to_slave                                      (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                            (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_sram_avalon_sram_slave                     (cpu_data_master_byteenable_sram_avalon_sram_slave),
      .cpu_data_master_dbs_address                                           (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                          (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_sram_avalon_sram_slave                        (cpu_data_master_granted_sram_avalon_sram_slave),
      .cpu_data_master_no_byte_enables_and_last_term                         (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_sram_avalon_sram_slave              (cpu_data_master_qualified_request_sram_avalon_sram_slave),
      .cpu_data_master_read                                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sram_avalon_sram_slave                (cpu_data_master_read_data_valid_sram_avalon_sram_slave),
      .cpu_data_master_read_data_valid_sram_avalon_sram_slave_shift_register (cpu_data_master_read_data_valid_sram_avalon_sram_slave_shift_register),
      .cpu_data_master_requests_sram_avalon_sram_slave                       (cpu_data_master_requests_sram_avalon_sram_slave),
      .cpu_data_master_waitrequest                                           (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                 (cpu_data_master_write),
      .d1_sram_avalon_sram_slave_end_xfer                                    (d1_sram_avalon_sram_slave_end_xfer),
      .reset_n                                                               (sys_clk_reset_n),
      .sram_avalon_sram_slave_address                                        (sram_avalon_sram_slave_address),
      .sram_avalon_sram_slave_byteenable                                     (sram_avalon_sram_slave_byteenable),
      .sram_avalon_sram_slave_read                                           (sram_avalon_sram_slave_read),
      .sram_avalon_sram_slave_readdata                                       (sram_avalon_sram_slave_readdata),
      .sram_avalon_sram_slave_readdata_from_sa                               (sram_avalon_sram_slave_readdata_from_sa),
      .sram_avalon_sram_slave_readdatavalid                                  (sram_avalon_sram_slave_readdatavalid),
      .sram_avalon_sram_slave_reset                                          (sram_avalon_sram_slave_reset),
      .sram_avalon_sram_slave_write                                          (sram_avalon_sram_slave_write),
      .sram_avalon_sram_slave_writedata                                      (sram_avalon_sram_slave_writedata)
    );

  sram the_sram
    (
      .SRAM_ADDR     (SRAM_ADDR_from_the_sram),
      .SRAM_CE_N     (SRAM_CE_N_from_the_sram),
      .SRAM_DQ       (SRAM_DQ_to_and_from_the_sram),
      .SRAM_LB_N     (SRAM_LB_N_from_the_sram),
      .SRAM_OE_N     (SRAM_OE_N_from_the_sram),
      .SRAM_UB_N     (SRAM_UB_N_from_the_sram),
      .SRAM_WE_N     (SRAM_WE_N_from_the_sram),
      .address       (sram_avalon_sram_slave_address),
      .byteenable    (sram_avalon_sram_slave_byteenable),
      .clk           (sys_clk),
      .read          (sram_avalon_sram_slave_read),
      .readdata      (sram_avalon_sram_slave_readdata),
      .readdatavalid (sram_avalon_sram_slave_readdatavalid),
      .reset         (sram_avalon_sram_slave_reset),
      .write         (sram_avalon_sram_slave_write),
      .writedata     (sram_avalon_sram_slave_writedata)
    );

  sys_clk_timer_s1_arbitrator the_sys_clk_timer_s1
    (
      .clk                                                (sys_clk),
      .cpu_data_master_address_to_slave                   (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_sys_clk_timer_s1           (cpu_data_master_granted_sys_clk_timer_s1),
      .cpu_data_master_qualified_request_sys_clk_timer_s1 (cpu_data_master_qualified_request_sys_clk_timer_s1),
      .cpu_data_master_read                               (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sys_clk_timer_s1   (cpu_data_master_read_data_valid_sys_clk_timer_s1),
      .cpu_data_master_requests_sys_clk_timer_s1          (cpu_data_master_requests_sys_clk_timer_s1),
      .cpu_data_master_waitrequest                        (cpu_data_master_waitrequest),
      .cpu_data_master_write                              (cpu_data_master_write),
      .cpu_data_master_writedata                          (cpu_data_master_writedata),
      .d1_sys_clk_timer_s1_end_xfer                       (d1_sys_clk_timer_s1_end_xfer),
      .reset_n                                            (sys_clk_reset_n),
      .sys_clk_timer_s1_address                           (sys_clk_timer_s1_address),
      .sys_clk_timer_s1_chipselect                        (sys_clk_timer_s1_chipselect),
      .sys_clk_timer_s1_irq                               (sys_clk_timer_s1_irq),
      .sys_clk_timer_s1_irq_from_sa                       (sys_clk_timer_s1_irq_from_sa),
      .sys_clk_timer_s1_readdata                          (sys_clk_timer_s1_readdata),
      .sys_clk_timer_s1_readdata_from_sa                  (sys_clk_timer_s1_readdata_from_sa),
      .sys_clk_timer_s1_reset_n                           (sys_clk_timer_s1_reset_n),
      .sys_clk_timer_s1_write_n                           (sys_clk_timer_s1_write_n),
      .sys_clk_timer_s1_writedata                         (sys_clk_timer_s1_writedata)
    );

  sys_clk_timer the_sys_clk_timer
    (
      .address    (sys_clk_timer_s1_address),
      .chipselect (sys_clk_timer_s1_chipselect),
      .clk        (sys_clk),
      .irq        (sys_clk_timer_s1_irq),
      .readdata   (sys_clk_timer_s1_readdata),
      .reset_n    (sys_clk_timer_s1_reset_n),
      .write_n    (sys_clk_timer_s1_write_n),
      .writedata  (sys_clk_timer_s1_writedata)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                   (sys_clk),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_sysid_control_slave           (cpu_data_master_granted_sysid_control_slave),
      .cpu_data_master_qualified_request_sysid_control_slave (cpu_data_master_qualified_request_sysid_control_slave),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_sysid_control_slave   (cpu_data_master_read_data_valid_sysid_control_slave),
      .cpu_data_master_requests_sysid_control_slave          (cpu_data_master_requests_sysid_control_slave),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .d1_sysid_control_slave_end_xfer                       (d1_sysid_control_slave_end_xfer),
      .reset_n                                               (sys_clk_reset_n),
      .sysid_control_slave_address                           (sysid_control_slave_address),
      .sysid_control_slave_readdata                          (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                  (sysid_control_slave_readdata_from_sa),
      .sysid_control_slave_reset_n                           (sysid_control_slave_reset_n)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .clock    (sysid_control_slave_clock),
      .readdata (sysid_control_slave_readdata),
      .reset_n  (sysid_control_slave_reset_n)
    );

  tri_state_bridge_avalon_slave_arbitrator the_tri_state_bridge_avalon_slave
    (
      .clk                                                            (sys_clk),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_ext_flash_s1                        (cpu_data_master_byteenable_ext_flash_s1),
      .cpu_data_master_dbs_address                                    (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_8                                    (cpu_data_master_dbs_write_8),
      .cpu_data_master_granted_ext_flash_s1                           (cpu_data_master_granted_ext_flash_s1),
      .cpu_data_master_no_byte_enables_and_last_term                  (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_ext_flash_s1                 (cpu_data_master_qualified_request_ext_flash_s1),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_ext_flash_s1                   (cpu_data_master_read_data_valid_ext_flash_s1),
      .cpu_data_master_requests_ext_flash_s1                          (cpu_data_master_requests_ext_flash_s1),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                             (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_ext_flash_s1                    (cpu_instruction_master_granted_ext_flash_s1),
      .cpu_instruction_master_latency_counter                         (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_ext_flash_s1          (cpu_instruction_master_qualified_request_ext_flash_s1),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_ext_flash_s1            (cpu_instruction_master_read_data_valid_ext_flash_s1),
      .cpu_instruction_master_read_data_valid_sdram_s1_shift_register (cpu_instruction_master_read_data_valid_sdram_s1_shift_register),
      .cpu_instruction_master_requests_ext_flash_s1                   (cpu_instruction_master_requests_ext_flash_s1),
      .d1_tri_state_bridge_avalon_slave_end_xfer                      (d1_tri_state_bridge_avalon_slave_end_xfer),
      .ext_flash_s1_wait_counter_eq_0                                 (ext_flash_s1_wait_counter_eq_0),
      .ext_flash_s1_wait_counter_eq_1                                 (ext_flash_s1_wait_counter_eq_1),
      .incoming_tri_state_bridge_data                                 (incoming_tri_state_bridge_data),
      .incoming_tri_state_bridge_data_with_Xs_converted_to_0          (incoming_tri_state_bridge_data_with_Xs_converted_to_0),
      .registered_cpu_data_master_read_data_valid_ext_flash_s1        (registered_cpu_data_master_read_data_valid_ext_flash_s1),
      .reset_n                                                        (sys_clk_reset_n),
      .select_n_to_the_ext_flash                                      (select_n_to_the_ext_flash),
      .tri_state_bridge_address                                       (tri_state_bridge_address),
      .tri_state_bridge_data                                          (tri_state_bridge_data),
      .tri_state_bridge_readn                                         (tri_state_bridge_readn),
      .write_n_to_the_ext_flash                                       (write_n_to_the_ext_flash)
    );

  vga_controller_s1_arbitrator the_vga_controller_s1
    (
      .clk                                                 (sys_clk),
      .cpu_data_master_address_to_slave                    (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_vga_controller_s1           (cpu_data_master_granted_vga_controller_s1),
      .cpu_data_master_qualified_request_vga_controller_s1 (cpu_data_master_qualified_request_vga_controller_s1),
      .cpu_data_master_read                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_vga_controller_s1   (cpu_data_master_read_data_valid_vga_controller_s1),
      .cpu_data_master_requests_vga_controller_s1          (cpu_data_master_requests_vga_controller_s1),
      .cpu_data_master_waitrequest                         (cpu_data_master_waitrequest),
      .cpu_data_master_write                               (cpu_data_master_write),
      .cpu_data_master_writedata                           (cpu_data_master_writedata),
      .d1_vga_controller_s1_end_xfer                       (d1_vga_controller_s1_end_xfer),
      .reset_n                                             (sys_clk_reset_n),
      .vga_controller_s1_address                           (vga_controller_s1_address),
      .vga_controller_s1_chipselect                        (vga_controller_s1_chipselect),
      .vga_controller_s1_readdata                          (vga_controller_s1_readdata),
      .vga_controller_s1_readdata_from_sa                  (vga_controller_s1_readdata_from_sa),
      .vga_controller_s1_reset_n                           (vga_controller_s1_reset_n),
      .vga_controller_s1_write                             (vga_controller_s1_write),
      .vga_controller_s1_writedata                         (vga_controller_s1_writedata)
    );

  vga_controller_m1_arbitrator the_vga_controller_m1
    (
      .clk                                                       (sys_clk),
      .d1_sdram_s1_end_xfer                                      (d1_sdram_s1_end_xfer),
      .reset_n                                                   (sys_clk_reset_n),
      .sdram_s1_readdata_from_sa                                 (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                              (sdram_s1_waitrequest_from_sa),
      .vga_controller_m1_address                                 (vga_controller_m1_address),
      .vga_controller_m1_address_to_slave                        (vga_controller_m1_address_to_slave),
      .vga_controller_m1_dbs_address                             (vga_controller_m1_dbs_address),
      .vga_controller_m1_granted_sdram_s1                        (vga_controller_m1_granted_sdram_s1),
      .vga_controller_m1_latency_counter                         (vga_controller_m1_latency_counter),
      .vga_controller_m1_qualified_request_sdram_s1              (vga_controller_m1_qualified_request_sdram_s1),
      .vga_controller_m1_read                                    (vga_controller_m1_read),
      .vga_controller_m1_read_data_valid_sdram_s1                (vga_controller_m1_read_data_valid_sdram_s1),
      .vga_controller_m1_read_data_valid_sdram_s1_shift_register (vga_controller_m1_read_data_valid_sdram_s1_shift_register),
      .vga_controller_m1_readdata                                (vga_controller_m1_readdata),
      .vga_controller_m1_readdatavalid                           (vga_controller_m1_readdatavalid),
      .vga_controller_m1_requests_sdram_s1                       (vga_controller_m1_requests_sdram_s1),
      .vga_controller_m1_waitrequest                             (vga_controller_m1_waitrequest)
    );

  vga_controller the_vga_controller
    (
      .B                  (B_from_the_vga_controller),
      .G                  (G_from_the_vga_controller),
      .M1                 (M1_from_the_vga_controller),
      .M2                 (M2_from_the_vga_controller),
      .R                  (R_from_the_vga_controller),
      .blank_n            (blank_n_from_the_vga_controller),
      .clk                (sys_clk),
      .hsync              (hsync_from_the_vga_controller),
      .master_address     (vga_controller_m1_address),
      .master_data_valid  (vga_controller_m1_readdatavalid),
      .master_read        (vga_controller_m1_read),
      .master_readdata    (vga_controller_m1_readdata),
      .master_waitrequest (vga_controller_m1_waitrequest),
      .reset_n            (vga_controller_s1_reset_n),
      .slave_address      (vga_controller_s1_address),
      .slave_chipselect   (vga_controller_s1_chipselect),
      .slave_readdata     (vga_controller_s1_readdata),
      .slave_write        (vga_controller_s1_write),
      .slave_writedata    (vga_controller_s1_writedata),
      .sync_n             (sync_n_from_the_vga_controller),
      .sync_t             (sync_t_from_the_vga_controller),
      .vga_clk            (vga_clk_to_the_vga_controller),
      .vsync              (vsync_from_the_vga_controller)
    );

  vga_ref_2C35_clock_0_in_arbitrator the_vga_ref_2C35_clock_0_in
    (
      .clk                                                       (sys_clk),
      .cpu_data_master_address_to_slave                          (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_vga_ref_2C35_clock_0_in        (cpu_data_master_byteenable_vga_ref_2C35_clock_0_in),
      .cpu_data_master_dbs_address                               (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_8                               (cpu_data_master_dbs_write_8),
      .cpu_data_master_granted_vga_ref_2C35_clock_0_in           (cpu_data_master_granted_vga_ref_2C35_clock_0_in),
      .cpu_data_master_no_byte_enables_and_last_term             (cpu_data_master_no_byte_enables_and_last_term),
      .cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in (cpu_data_master_qualified_request_vga_ref_2C35_clock_0_in),
      .cpu_data_master_read                                      (cpu_data_master_read),
      .cpu_data_master_read_data_valid_vga_ref_2C35_clock_0_in   (cpu_data_master_read_data_valid_vga_ref_2C35_clock_0_in),
      .cpu_data_master_requests_vga_ref_2C35_clock_0_in          (cpu_data_master_requests_vga_ref_2C35_clock_0_in),
      .cpu_data_master_waitrequest                               (cpu_data_master_waitrequest),
      .cpu_data_master_write                                     (cpu_data_master_write),
      .d1_vga_ref_2C35_clock_0_in_end_xfer                       (d1_vga_ref_2C35_clock_0_in_end_xfer),
      .reset_n                                                   (sys_clk_reset_n),
      .vga_ref_2C35_clock_0_in_address                           (vga_ref_2C35_clock_0_in_address),
      .vga_ref_2C35_clock_0_in_endofpacket                       (vga_ref_2C35_clock_0_in_endofpacket),
      .vga_ref_2C35_clock_0_in_endofpacket_from_sa               (vga_ref_2C35_clock_0_in_endofpacket_from_sa),
      .vga_ref_2C35_clock_0_in_nativeaddress                     (vga_ref_2C35_clock_0_in_nativeaddress),
      .vga_ref_2C35_clock_0_in_read                              (vga_ref_2C35_clock_0_in_read),
      .vga_ref_2C35_clock_0_in_readdata                          (vga_ref_2C35_clock_0_in_readdata),
      .vga_ref_2C35_clock_0_in_readdata_from_sa                  (vga_ref_2C35_clock_0_in_readdata_from_sa),
      .vga_ref_2C35_clock_0_in_reset_n                           (vga_ref_2C35_clock_0_in_reset_n),
      .vga_ref_2C35_clock_0_in_waitrequest                       (vga_ref_2C35_clock_0_in_waitrequest),
      .vga_ref_2C35_clock_0_in_waitrequest_from_sa               (vga_ref_2C35_clock_0_in_waitrequest_from_sa),
      .vga_ref_2C35_clock_0_in_write                             (vga_ref_2C35_clock_0_in_write),
      .vga_ref_2C35_clock_0_in_writedata                         (vga_ref_2C35_clock_0_in_writedata)
    );

  vga_ref_2C35_clock_0_out_arbitrator the_vga_ref_2C35_clock_0_out
    (
      .clk                                                                   (clk_in),
      .clocks_avalon_clocks_slave_readdata_from_sa                           (clocks_avalon_clocks_slave_readdata_from_sa),
      .d1_clocks_avalon_clocks_slave_end_xfer                                (d1_clocks_avalon_clocks_slave_end_xfer),
      .reset_n                                                               (clk_in_reset_n),
      .vga_ref_2C35_clock_0_out_address                                      (vga_ref_2C35_clock_0_out_address),
      .vga_ref_2C35_clock_0_out_address_to_slave                             (vga_ref_2C35_clock_0_out_address_to_slave),
      .vga_ref_2C35_clock_0_out_granted_clocks_avalon_clocks_slave           (vga_ref_2C35_clock_0_out_granted_clocks_avalon_clocks_slave),
      .vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave (vga_ref_2C35_clock_0_out_qualified_request_clocks_avalon_clocks_slave),
      .vga_ref_2C35_clock_0_out_read                                         (vga_ref_2C35_clock_0_out_read),
      .vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave   (vga_ref_2C35_clock_0_out_read_data_valid_clocks_avalon_clocks_slave),
      .vga_ref_2C35_clock_0_out_readdata                                     (vga_ref_2C35_clock_0_out_readdata),
      .vga_ref_2C35_clock_0_out_requests_clocks_avalon_clocks_slave          (vga_ref_2C35_clock_0_out_requests_clocks_avalon_clocks_slave),
      .vga_ref_2C35_clock_0_out_reset_n                                      (vga_ref_2C35_clock_0_out_reset_n),
      .vga_ref_2C35_clock_0_out_waitrequest                                  (vga_ref_2C35_clock_0_out_waitrequest),
      .vga_ref_2C35_clock_0_out_write                                        (vga_ref_2C35_clock_0_out_write),
      .vga_ref_2C35_clock_0_out_writedata                                    (vga_ref_2C35_clock_0_out_writedata)
    );

  vga_ref_2C35_clock_0 the_vga_ref_2C35_clock_0
    (
      .master_address       (vga_ref_2C35_clock_0_out_address),
      .master_clk           (clk_in),
      .master_endofpacket   (vga_ref_2C35_clock_0_out_endofpacket),
      .master_nativeaddress (vga_ref_2C35_clock_0_out_nativeaddress),
      .master_read          (vga_ref_2C35_clock_0_out_read),
      .master_readdata      (vga_ref_2C35_clock_0_out_readdata),
      .master_reset_n       (vga_ref_2C35_clock_0_out_reset_n),
      .master_waitrequest   (vga_ref_2C35_clock_0_out_waitrequest),
      .master_write         (vga_ref_2C35_clock_0_out_write),
      .master_writedata     (vga_ref_2C35_clock_0_out_writedata),
      .slave_address        (vga_ref_2C35_clock_0_in_address),
      .slave_clk            (sys_clk),
      .slave_endofpacket    (vga_ref_2C35_clock_0_in_endofpacket),
      .slave_nativeaddress  (vga_ref_2C35_clock_0_in_nativeaddress),
      .slave_read           (vga_ref_2C35_clock_0_in_read),
      .slave_readdata       (vga_ref_2C35_clock_0_in_readdata),
      .slave_reset_n        (vga_ref_2C35_clock_0_in_reset_n),
      .slave_waitrequest    (vga_ref_2C35_clock_0_in_waitrequest),
      .slave_write          (vga_ref_2C35_clock_0_in_write),
      .slave_writedata      (vga_ref_2C35_clock_0_in_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  vga_ref_2C35_reset_clk_in_domain_synch_module vga_ref_2C35_reset_clk_in_domain_synch
    (
      .clk      (clk_in),
      .data_in  (1'b1),
      .data_out (clk_in_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa);

  //reset is asserted asynchronously and deasserted synchronously
  vga_ref_2C35_reset_sys_clk_domain_synch_module vga_ref_2C35_reset_sys_clk_domain_synch
    (
      .clk      (sys_clk),
      .data_in  (1'b1),
      .data_out (sys_clk_reset_n),
      .reset_n  (reset_n_sources)
    );

  //sysid_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  assign sysid_control_slave_clock = 0;

  //vga_ref_2C35_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign vga_ref_2C35_clock_0_out_endofpacket = 0;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ext_flash_lane0_module (
                                // inputs:
                                 data,
                                 rdaddress,
                                 rdclken,
                                 wraddress,
                                 wrclock,
                                 wren,

                                // outputs:
                                 q
                              )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 21: 0] rdaddress;
  input            rdclken;
  input   [ 21: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [4194303: 0];
  wire    [  7: 0] q;
  reg     [ 21: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("ext_flash.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "ext_flash.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 22,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module ext_flash (
                   // inputs:
                    address,
                    read_n,
                    select_n,
                    write_n,

                   // outputs:
                    data
                 )
;

  inout   [  7: 0] data;
  input   [ 21: 0] address;
  input            read_n;
  input            select_n;
  input            write_n;

  wire    [  7: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //ext_flash_lane0, which is an e_ram
  ext_flash_lane0_module ext_flash_lane0
    (
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data = (~select_n & ~read_n)? q_0: {8{1'bz}};

//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "/usr/local/3rdparty/altera/quartus101/quartus/eda/sim_lib/altera_mf.v"
`include "/usr/local/3rdparty/altera/quartus101/quartus/eda/sim_lib/220model.v"
`include "/usr/local/3rdparty/altera/quartus101/quartus/eda/sim_lib/sgate.v"
`include "sram.v"
`include "clocks.v"
`include "sys_clk_timer.v"
`include "cpu_test_bench.v"
`include "cpu_mult_cell.v"
`include "cpu_oci_test_bench.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "sdram.v"
`include "sysid.v"
`include "vga_controller.v"
`include "jtag_uart.v"
`include "vga_ref_2C35_clock_0.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire    [  7: 0] B_from_the_vga_controller;
  wire    [  7: 0] G_from_the_vga_controller;
  wire             M1_from_the_vga_controller;
  wire             M2_from_the_vga_controller;
  wire    [  7: 0] R_from_the_vga_controller;
  wire    [ 17: 0] SRAM_ADDR_from_the_sram;
  wire             SRAM_CE_N_from_the_sram;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram;
  wire             SRAM_LB_N_from_the_sram;
  wire             SRAM_OE_N_from_the_sram;
  wire             SRAM_UB_N_from_the_sram;
  wire             SRAM_WE_N_from_the_sram;
  wire             blank_n_from_the_vga_controller;
  wire             clk;
  reg              clk_in;
  wire             hsync_from_the_vga_controller;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  reg              reset_n;
  wire             sdram_clk;
  wire             select_n_to_the_ext_flash;
  wire             sync_n_from_the_vga_controller;
  wire             sync_t_from_the_vga_controller;
  wire             sys_clk;
  wire             sysid_control_slave_clock;
  wire    [ 21: 0] tri_state_bridge_address;
  wire    [  7: 0] tri_state_bridge_data;
  wire             tri_state_bridge_readn;
  wire             vga_clk;
  wire             vga_clk_to_the_vga_controller;
  wire             vga_ref_2C35_clock_0_in_endofpacket_from_sa;
  wire             vga_ref_2C35_clock_0_out_endofpacket;
  wire             vga_ref_2C35_clock_0_out_nativeaddress;
  wire             vsync_from_the_vga_controller;
  wire             write_n_to_the_ext_flash;
  wire    [ 11: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram;
  wire    [  1: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  vga_ref_2C35 DUT
    (
      .B_from_the_vga_controller       (B_from_the_vga_controller),
      .G_from_the_vga_controller       (G_from_the_vga_controller),
      .M1_from_the_vga_controller      (M1_from_the_vga_controller),
      .M2_from_the_vga_controller      (M2_from_the_vga_controller),
      .R_from_the_vga_controller       (R_from_the_vga_controller),
      .SRAM_ADDR_from_the_sram         (SRAM_ADDR_from_the_sram),
      .SRAM_CE_N_from_the_sram         (SRAM_CE_N_from_the_sram),
      .SRAM_DQ_to_and_from_the_sram    (SRAM_DQ_to_and_from_the_sram),
      .SRAM_LB_N_from_the_sram         (SRAM_LB_N_from_the_sram),
      .SRAM_OE_N_from_the_sram         (SRAM_OE_N_from_the_sram),
      .SRAM_UB_N_from_the_sram         (SRAM_UB_N_from_the_sram),
      .SRAM_WE_N_from_the_sram         (SRAM_WE_N_from_the_sram),
      .blank_n_from_the_vga_controller (blank_n_from_the_vga_controller),
      .clk_in                          (clk_in),
      .hsync_from_the_vga_controller   (hsync_from_the_vga_controller),
      .reset_n                         (reset_n),
      .sdram_clk                       (sdram_clk),
      .select_n_to_the_ext_flash       (select_n_to_the_ext_flash),
      .sync_n_from_the_vga_controller  (sync_n_from_the_vga_controller),
      .sync_t_from_the_vga_controller  (sync_t_from_the_vga_controller),
      .sys_clk                         (sys_clk),
      .tri_state_bridge_address        (tri_state_bridge_address),
      .tri_state_bridge_data           (tri_state_bridge_data),
      .tri_state_bridge_readn          (tri_state_bridge_readn),
      .vga_clk                         (vga_clk),
      .vga_clk_to_the_vga_controller   (vga_clk_to_the_vga_controller),
      .vsync_from_the_vga_controller   (vsync_from_the_vga_controller),
      .write_n_to_the_ext_flash        (write_n_to_the_ext_flash),
      .zs_addr_from_the_sdram          (zs_addr_from_the_sdram),
      .zs_ba_from_the_sdram            (zs_ba_from_the_sdram),
      .zs_cas_n_from_the_sdram         (zs_cas_n_from_the_sdram),
      .zs_cke_from_the_sdram           (zs_cke_from_the_sdram),
      .zs_cs_n_from_the_sdram          (zs_cs_n_from_the_sdram),
      .zs_dq_to_and_from_the_sdram     (zs_dq_to_and_from_the_sdram),
      .zs_dqm_from_the_sdram           (zs_dqm_from_the_sdram),
      .zs_ras_n_from_the_sdram         (zs_ras_n_from_the_sdram),
      .zs_we_n_from_the_sdram          (zs_we_n_from_the_sdram)
    );

  ext_flash the_ext_flash
    (
      .address  (tri_state_bridge_address),
      .data     (tri_state_bridge_data),
      .read_n   (tri_state_bridge_readn),
      .select_n (select_n_to_the_ext_flash),
      .write_n  (write_n_to_the_ext_flash)
    );

  initial
    clk_in = 1'b0;
  always
    #10 clk_in <= ~clk_in;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on