`ifndef CALC_SEQ_PKG_SV
 `define CALC_SEQ_PKG_SV

package alu_seq_pkg;
   import uvm_pkg::*;      // import the UVM library
 `include "uvm_macros.svh" // Include the UVM macros

  import alu_agent_pkg::alu_seq_item;
  import alu_agent_pkg::alu_sequencer;

 `include "base_seq.sv"
 `include "simple_seq.sv"
endpackage 
`endif