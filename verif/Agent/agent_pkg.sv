`ifndef ALU_AGENT_PKG
`define ALU_AGENT_PKG

package alu_agent_pkg;
 
   import uvm_pkg::*;
   `include "uvm_macros.svh"

   //////////////////////////////////////////////////////////
   // include Agent components : driver,monitor,sequencer
   /////////////////////////////////////////////////////////
   import configurations_pkg::*;   
   
   `include "seq_item.sv"
   `include "sequencer.sv"
   `include "driver.sv"
   `include "monitor.sv"
   `include "agent.sv"

endpackage

`endif