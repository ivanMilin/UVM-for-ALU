`ifndef ALU_TEST_PKG_SV
`define ALU_TEST_PKG_SV

package alu_test_pkg;

    import uvm_pkg::*;      // import the UVM library   
    `include "uvm_macros.svh" // Include the UVM macros

    import alu_agent_pkg::*;
    import alu_seq_pkg::*;
    import configurations_pkg::*;   
    
    `include "scoreboard.sv"
    `include "env.sv"   
    `include "test_base.sv"
    `include "test_simple.sv"


endpackage : alu_test_pkg

`include "interface.sv"

`endif