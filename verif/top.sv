`timescale 1ns/1ns


module top;

    import uvm_pkg::*;
    `include "uvm_macros.svh"
    
    import alu_test_pkg::*;

    logic clock;

    alu_interface intf(.clock(clock));

    alu dut(
        .clock(intf.clock),
        .reset(intf.reset),
        .A(intf.a),
        .B(intf.b),
        .ALU_Sel(intf.op_code),
        .ALU_Out(intf.result),
        .CarryOut(intf.carry_out)
    );


    initial begin
        uvm_config_db #(virtual alu_interface)::set(null, "*", "vif", intf );
        //-- Refer: https://www.synopsys.com/content/dam/synopsys/services/whitepapers/hierarchical-testbench-configuration-using-uvm.pdf
    end



    //--------------------------------------------------------
    //Start The Test
    //--------------------------------------------------------
    initial begin
        run_test();//"alu_test_simple"
    end


    //--------------------------------------------------------
    //Clock Generation
    //--------------------------------------------------------
    initial begin
        clock = 0;
        #5;
    forever begin
        clock = ~clock;
        #2;
    end
    end


    //--------------------------------------------------------
    //Maximum Simulation Time
    //--------------------------------------------------------
    initial begin
    #5000;
        $display("Sorry! Ran out of clock cycles!");
        $finish();
    end





endmodule: top